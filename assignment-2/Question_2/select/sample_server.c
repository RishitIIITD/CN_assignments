#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/select.h>
#include <dirent.h>
#include <time.h>
#include <errno.h>

#define PORT 8989
#define MAX_CLIENTS 50
#define BUFFER_SIZE 1024

// Function to extract CPU information from /proc/[pid]/stat
int get_cpu_info(char* buffer) {
    DIR* dir;
    struct dirent* entry;
    char proc_stat[1024];
    char stat_content[1024];
    int pid, utime, stime;
    int top_cpu[2] = {0}; 
    int top_pids[2] = {0}; 
    char top_proc_names[2][256] = {{0}, {0}};

    dir = opendir("/proc");
    if (dir == NULL) {
        perror("Failed to open /proc");
        return -1;
    }

    while ((entry = readdir(dir)) != NULL) {
        if (entry->d_type == DT_DIR && atoi(entry->d_name) > 0) {
            snprintf(proc_stat, sizeof(proc_stat), "/proc/%s/stat", entry->d_name);
            int fd = open(proc_stat, O_RDONLY);
            if (fd < 0) continue;

            read(fd, stat_content, sizeof(stat_content));
            close(fd);

            // Extract process name, pid, user time, kernel time
            sscanf(stat_content, "%d %*s %*c %*d %*d %*d %*d %*d %*u %*lu %*lu %*lu %*lu %*lu %lu %lu", &pid, &utime, &stime);
            int total_cpu = utime + stime;

            // Check if in top 2
            if (total_cpu > top_cpu[0]) {
                top_cpu[1] = top_cpu[0]; 
                top_pids[1] = top_pids[0];
                strcpy(top_proc_names[1], top_proc_names[0]);

                top_cpu[0] = total_cpu; 
                top_pids[0] = pid;
                sscanf(stat_content, "%d %255s", &pid, top_proc_names[0]);
            } else if (total_cpu > top_cpu[1]) {
                top_cpu[1] = total_cpu; 
                top_pids[1] = pid;
                sscanf(stat_content, "%d %255s", &pid, top_proc_names[1]);
            }
        }
    }

    closedir(dir);

    // Send top 2
    snprintf(buffer, BUFFER_SIZE,
             "Timestamp: %ld\n"
             "Process 1: PID: %d, Name: %s, CPU Time: %d\n"
             "Process 2: PID: %d, Name: %s, CPU Time: %d\n",
             time(NULL), top_pids[0], top_proc_names[0], top_cpu[0],
             top_pids[1], top_proc_names[1], top_cpu[1]);

    return 0;
}

// Main driver code
int main() {
    int server_socket, new_socket, client_socket[MAX_CLIENTS];
    struct sockaddr_in server_address, client_address;
    fd_set readfds;
    char buffer[BUFFER_SIZE];
    socklen_t client_len = sizeof(client_address);

    // Initialize client socket array
    for (int i = 0; i < MAX_CLIENTS; i++) {
        client_socket[i] = 0;
    }

    // Create a TCP socket
    server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket == -1) {
        perror("Failed to create socket");
        exit(EXIT_FAILURE);
    }

    // Prepare the server address structure
    server_address.sin_family = AF_INET;
    server_address.sin_addr.s_addr = INADDR_ANY;
    server_address.sin_port = htons(PORT);

    // Bind the socket to the address and port
    if (bind(server_socket, (struct sockaddr*)&server_address, sizeof(server_address)) < 0) {
        perror("Failed to bind socket");
        close(server_socket);
        exit(EXIT_FAILURE);
    }

    // Listen for incoming connections
    if (listen(server_socket, MAX_CLIENTS) < 0) {
        perror("Failed to listen on socket");
        close(server_socket);
        exit(EXIT_FAILURE);
    }

    printf("Server listening on port %d\n", PORT);

    while (1) {
        // Clear the socket set
        FD_ZERO(&readfds);

        // Add the server socket to the set
        FD_SET(server_socket, &readfds);
        int max_sd = server_socket;

        // Add child sockets to the set
        for (int i = 0; i < MAX_CLIENTS; i++) {
            int sd = client_socket[i];
            if (sd > 0) FD_SET(sd, &readfds);
            if (sd > max_sd) max_sd = sd;
        }

        // Wait for activity on one of the sockets
        int activity = select(max_sd + 1, &readfds, NULL, NULL, NULL);
        if (activity < 0 && errno != EINTR) {
            perror("Select error");
            continue;
        }

        // If something happened on the server socket, it's an incoming connection
        if (FD_ISSET(server_socket, &readfds)) {
            new_socket = accept(server_socket, (struct sockaddr*)&client_address, &client_len);
            if (new_socket < 0) {
                perror("Failed to accept connection");
                continue;
            }

            printf("New connection: socket fd is %d, IP is %s, Port is %d\n",
                   new_socket, inet_ntoa(client_address.sin_addr), ntohs(client_address.sin_port));

            // Add new socket to the client_socket array
            for (int i = 0; i < MAX_CLIENTS; i++) {
                if (client_socket[i] == 0) {
                    client_socket[i] = new_socket;
                    printf("Added new socket to client list as %d\n", i);
                    break;
                }
            }
        }

        // Check all clients for incoming data
        for (int i = 0; i < MAX_CLIENTS; i++) {
            int sd = client_socket[i];

            if (FD_ISSET(sd, &readfds)) {
                // Check if it was for closing, and read the incoming message
                int valread = read(sd, buffer, BUFFER_SIZE);
                if (valread == 0) {
                    // Client disconnected
                    getpeername(sd, (struct sockaddr*)&client_address, &client_len);
                    printf("Client disconnected: IP %s, Port %d\n", inet_ntoa(client_address.sin_addr), ntohs(client_address.sin_port));
                    close(sd);
                    client_socket[i] = 0;
                } else {
                    // Fetch CPU information and send it to the client
                    buffer[valread] = '\0';
                    printf("Client Request: %s\n", buffer);

                    if (get_cpu_info(buffer) == 0) {
                        send(sd, buffer, strlen(buffer), 0);
                    } else {
                        snprintf(buffer, BUFFER_SIZE, "Failed to retrieve process information\n");
                        send(sd, buffer, strlen(buffer), 0);
                    }
                }
            }
        }
    }

    // Close the server socket (this line will not be reached in the current setup)
    close(server_socket);
    return 0;
}