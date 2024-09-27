#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <pthread.h>
#include <dirent.h>
#include <fcntl.h>
#include <time.h>

#define PORT 8989
#define MAX_CLIENTS 50
#define BUFFER_SIZE 1024

// Structure to hold client information
typedef struct {
    int socket;
    struct sockaddr_in address;
} client_info;

// Extract CPU information from /proc/[pid]/stat
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

            // Check if top 2 
            if (total_cpu > top_cpu[0]) {
                top_cpu[1] = top_cpu[0]; top_pids[1] = top_pids[0];
                strcpy(top_proc_names[1], top_proc_names[0]);

                top_cpu[0] = total_cpu; top_pids[0] = pid;
                sscanf(stat_content, "%d %255s", &pid, top_proc_names[0]);
            } else if (total_cpu > top_cpu[1]) {
                top_cpu[1] = total_cpu; top_pids[1] = pid;
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

// Handle client
void* handle_client(void* args) {
    client_info* client = (client_info*)args;
    int client_socket = client->socket;
    char buffer[BUFFER_SIZE];

    // Client connected
    printf("Client connected: %s:%d\n", inet_ntoa(client->address.sin_addr), ntohs(client->address.sin_port));

    // Receive request from client
    recv(client_socket, buffer, sizeof(buffer), 0);
    printf("Client Request: %s\n", buffer);

    // Fetch and send CPU information
    if (get_cpu_info(buffer) == 0) {
        send(client_socket, buffer, strlen(buffer), 0);
    } else {
        snprintf(buffer, BUFFER_SIZE, "Failed to retrieve process information\n");
        send(client_socket, buffer, strlen(buffer), 0);
    }

    // Close
    close(client_socket);
    free(client);
    pthread_exit(NULL);
}

// Driver Code
int main() {
    int server_socket, new_socket;
    struct sockaddr_in server_address, client_address;
    socklen_t client_len = sizeof(client_address);
    pthread_t thread_id;

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
    if (listen(server_socket, MAX_CLIENTS) == 0) {
        printf("Listening on port %d\n", PORT);
    } else {
        perror("Failed to listen on socket");
        close(server_socket);
        exit(EXIT_FAILURE);
    }

    while (1) {
        // Accept a new client connection
        new_socket = accept(server_socket, (struct sockaddr*)&client_address, &client_len);
        if (new_socket < 0) {
            perror("Failed to accept connection");
            continue;
        }

        // Allocate memory for client info structure
        client_info* client = malloc(sizeof(client_info));
        client->socket = new_socket;
        client->address = client_address;

        // Create a new thread to handle the client
        if (pthread_create(&thread_id, NULL, handle_client, (void*)client) != 0) {
            perror("Failed to create thread");
            close(new_socket);
            free(client);
            continue;
        }

        // Detach the thread to allow it to clean up after itself
        pthread_detach(thread_id);
    }

    // Close the server socket (this line will not be reached in the current setup)
    close(server_socket);
    return 0;
}
