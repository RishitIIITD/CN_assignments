#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <dirent.h>
#include <fcntl.h>
#include <time.h>

#define PORT 8989
#define MAX_CLIENTS 50
#define BUFFER_SIZE 1024

// Extract CPU information from /proc/[pid]/stat
int get_cpu_info(char* buffer) {
    DIR* dir;                    // Directory pointer for /proc directory
    struct dirent* entry;         // Directory entry for iterating through /proc
    char proc_stat[1024];         // Buffer for storing the path to the /proc/[pid]/stat file
    char stat_content[1024];      // Buffer for reading the contents of /proc/[pid]/stat
    int pid, utime, stime;        // Variables to store process ID, user time, and system time
    int top_cpu[2] = {0};         // Array to store CPU times of top 2 processes
    int top_pids[2] = {0};        // Array to store PIDs of top 2 processes
    char top_proc_names[2][256] = {{0}, {0}};  // Array to store process names of top 2 processes

    // Open the /proc directory to read the list of running processes
    dir = opendir("/proc");
    if (dir == NULL) {
        // If opening /proc fails, print an error and return -1
        perror("Failed to open /proc");
        return -1;
    }

    // Loop through all entries in the /proc directory
    while ((entry = readdir(dir)) != NULL) {
        // Only process directories with numeric names (these correspond to process IDs)
        if (entry->d_type == DT_DIR && atoi(entry->d_name) > 0) {
            // Construct the path to the /proc/[pid]/stat file
            snprintf(proc_stat, sizeof(proc_stat), "/proc/%s/stat", entry->d_name);
            int fd = open(proc_stat, O_RDONLY);  // Open the stat file
            if (fd < 0) continue;  // If unable to open the file, skip to the next process

            // Read the contents of /proc/[pid]/stat into stat_content
            read(fd, stat_content, sizeof(stat_content));
            close(fd);  // Close the file after reading

            // Extract PID, user time (utime), and system time (stime) from the stat file
            sscanf(stat_content, "%d %*s %*c %*d %*d %*d %*d %*d %*u %*lu %*lu %*lu %*lu %*lu %lu %lu", &pid, &utime, &stime);
            int total_cpu = utime + stime;  // Calculate the total CPU time for the process

            // Check if this process has a higher total CPU time than the current top process
            if (total_cpu > top_cpu[0]) {
                // Shift the current top process to second place
                top_cpu[1] = top_cpu[0]; top_pids[1] = top_pids[0];
                strcpy(top_proc_names[1], top_proc_names[0]);

                // Update the top process with the new process
                top_cpu[0] = total_cpu; top_pids[0] = pid;
                sscanf(stat_content, "%d %255s", &pid, top_proc_names[0]);
            }
            // Check if this process has a higher total CPU time than the second process
            else if (total_cpu > top_cpu[1]) {
                top_cpu[1] = total_cpu; top_pids[1] = pid;
                sscanf(stat_content, "%d %255s", &pid, top_proc_names[1]);
            }
        }
    }

    closedir(dir);      // Close the /proc directory after iterating

    // Format the result into the provided buffer, including the top 2 processes by CPU usage
    snprintf(buffer, BUFFER_SIZE,
        "Timestamp: %ld\n"
        "Process 1: PID: %d, Name: %s, CPU Time: %d\n"
        "Process 2: PID: %d, Name: %s, CPU Time: %d\n",
        time(NULL), top_pids[0], top_proc_names[0], top_cpu[0],
        top_pids[1], top_proc_names[1], top_cpu[1]);

    return 0;
}

// Handle client
void handle_client(int client_socket) {
    char buffer[BUFFER_SIZE];       // Buffer for storing client request and server response

    // Client connected
    printf("Client connected.\n");

    // Receive request from client
    recv(client_socket, buffer, sizeof(buffer), 0);
    printf("Client Request: %s\n", buffer);

    // Fetch CPU information and send it back to the client
    if (get_cpu_info(buffer) == 0) {
        // If CPU information retrieval is successful, send it to the client
        send(client_socket, buffer, strlen(buffer), 0);
    } else {
        // If CPU information retrieval fails, send an error message to the client
        snprintf(buffer, BUFFER_SIZE, "Failed to retrieve process information\n");
        send(client_socket, buffer, strlen(buffer), 0);
    }

    // Close the socket
    close(client_socket);
}

// Driver Code
int main() {
    int server_socket, new_socket;                  // Server socket and new client socket for accepting connections
    struct sockaddr_in server_address, client_address;  // Server and client address structures
    socklen_t client_len = sizeof(client_address);   // Length of the client address structure

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

        // Handle the client in a single-threaded manner
        handle_client(new_socket);
    }

    // Close the server socket (this line will not be reached in the current setup)
    close(server_socket);
    return 0;
}