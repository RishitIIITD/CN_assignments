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

// Main driver code
int main() {
    int server_socket, new_socket, client_socket[MAX_CLIENTS];  // Socket descriptors for the server, new client connections, and an array for multiple client sockets
    struct sockaddr_in server_address, client_address;           // Structures to hold server and client address information
    fd_set readfds;                                             // File descriptor set for monitoring multiple sockets for readability
    char buffer[BUFFER_SIZE];                                   // Buffer for storing data to be sent/received
    socklen_t client_len = sizeof(client_address);             // Length of the client address structure, used for accepting connections


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

    while (1) {  // Infinite loop to continuously listen for client connections and handle requests
        // Clear the socket set
        FD_ZERO(&readfds);  // Initialize the file descriptor set to be empty

        // Add the server socket to the set
        FD_SET(server_socket, &readfds);  // Add the server socket to the set of monitored sockets
        int max_sd = server_socket;  // Initialize the maximum socket descriptor

        // Add child sockets to the set
        for (int i = 0; i < MAX_CLIENTS; i++) {
            int sd = client_socket[i];  // Get the socket descriptor for the client
            if (sd > 0) FD_SET(sd, &readfds);  // If the socket is valid, add it to the set
            if (sd > max_sd) max_sd = sd;  // Update the maximum socket descriptor if needed
        }

        // Wait for activity on one of the sockets
        int activity = select(max_sd + 1, &readfds, NULL, NULL, NULL);  // Block until there is activity on one of the sockets
        if (activity < 0 && errno != EINTR) {  // Check for select error
            perror("Select error");  // Print error message if select fails
            continue;  // Continue the loop
        }

        // If something happened on the server socket, it's an incoming connection
        if (FD_ISSET(server_socket, &readfds)) {  // Check if the server socket is in the set
            new_socket = accept(server_socket, (struct sockaddr*)&client_address, &client_len);  // Accept the incoming connection
            if (new_socket < 0) {
                perror("Failed to accept connection");  // Print error if accepting connection fails
                continue;  // Continue the loop
            }

            // Print information about the new connection
            printf("New connection: socket fd is %d, IP is %s, Port is %d\n",
                new_socket, inet_ntoa(client_address.sin_addr), ntohs(client_address.sin_port));

            // Add new socket to the client_socket array
            for (int i = 0; i < MAX_CLIENTS; i++) {
                if (client_socket[i] == 0) {  // Find an empty slot in the client_socket array
                    client_socket[i] = new_socket;  // Assign the new socket to the available slot
                    printf("Added new socket to client list as %d\n", i);  // Print the index of the new client
                    break;  // Exit the loop once the socket is added
                }
            }
        }

        // Check all clients for incoming data
        for (int i = 0; i < MAX_CLIENTS; i++) {
            int sd = client_socket[i];  // Get the socket descriptor for the client

            if (FD_ISSET(sd, &readfds)) {  // Check if this client socket has activity
                // Check if it was for closing, and read the incoming message
                int valread = read(sd, buffer, BUFFER_SIZE);  // Read data from the client socket
                if (valread == 0) {  // If the read returns 0, the client has disconnected
                    getpeername(sd, (struct sockaddr*)&client_address, &client_len);  // Get the client's address
                    printf("Client disconnected: IP %s, Port %d\n", inet_ntoa(client_address.sin_addr), ntohs(client_address.sin_port));
                    close(sd);  // Close the client socket
                    client_socket[i] = 0;  // Mark this slot as empty
                } else {
                    // Fetch CPU information and send it to the client
                    buffer[valread] = '\0';  // Null-terminate the received data
                    printf("Client Request: %s\n", buffer);  // Print the client's request

                    // Call the function to get CPU info and send it back to the client
                    if (get_cpu_info(buffer) == 0) {
                        send(sd, buffer, strlen(buffer), 0);  // Send the CPU info to the client
                    } else {
                        snprintf(buffer, BUFFER_SIZE, "Failed to retrieve process information\n");  // Prepare error message
                        send(sd, buffer, strlen(buffer), 0);  // Send error message to the client
                    }
                }
            }
        }
    }


    // Close the server socket (this line will not be reached in the current setup)
    close(server_socket);
    return 0;
}