#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <pthread.h>

#define PORT 8989
#define MAX_CLIENTS 50

// Structure to hold client information
typedef struct {
    int socket;
    struct sockaddr_in address;
} client_info;

// Function to handle client connections
void* handle_client(void* args) {
    client_info* client = (client_info*)args;
    int client_socket = client->socket;
    char buffer[1024];

    // Inform that a new client has connected
    printf("Client connected: %s:%d\n", inet_ntoa(client->address.sin_addr), ntohs(client->address.sin_port));

    // Receiving data from the client
    recv(client_socket, buffer, sizeof(buffer), 0);
    printf("Received data: %s\n", buffer);

    // Close the client socket after handling
    close(client_socket);
    free(client);  // Free the allocated memory for client info
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
            continue;  // Skip to the next iteration
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
            continue;  // Skip to the next iteration
        }

        // Detach the thread to allow it to clean up after itself
        pthread_detach(thread_id);
    }

    // Close the server socket (this line will not be reached in the current setup)
    close(server_socket);
    return 0;
}