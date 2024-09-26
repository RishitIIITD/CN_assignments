#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>

// inet_addr
#include <arpa/inet.h>
#include <unistd.h>

// For threading, link with lpthread
#include <pthread.h>

// Function to send data to the server socket
void* clienthread(void* args)
{
    int client_request = *((int*)args);
    int network_socket;

    // Create a stream socket
    network_socket = socket(AF_INET, SOCK_STREAM, 0);

    // Initialize port number and address
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_addr.s_addr = INADDR_ANY;
    server_address.sin_port = htons(8989);

    // Initiate a socket connection
    int connection_status = connect(network_socket,
                                    (struct sockaddr*)&server_address,
                                    sizeof(server_address));

    // Check for connection error
    if (connection_status < 0) {
        puts("Error\n");
        return 0;
    }

    printf("Connection established by client thread\n");

    // Send data to the socket (example value 1)
    send(network_socket, &client_request, sizeof(client_request), 0);

    // Close the connection
    close(network_socket);
    pthread_exit(NULL);

    return 0;
}

// Driver Code
int main(int argc, char *argv[])
{
    if (argc != 2) {
        printf("Usage: %s <number_of_clients>\n", argv[0]);
        exit(1);
    }

    int num_clients = atoi(argv[1]);
    pthread_t tid[num_clients];

    // Create connection for each client
    for (int i = 0; i < num_clients; i++) {
        int client_request = 1;  // Example data to send

        // Create thread for each client connection
        if (pthread_create(&tid[i], NULL, clienthread, &client_request) != 0) {
            printf("Failed to create thread for client %d\n", i + 1);
        }
    }

    printf("All %d client connections have been initiated.\n", num_clients);

    // Infinite loop to keep the client process running
    while (1) {
        // This loop ensures the process remains active until terminated with Ctrl-C
        sleep(1);
    }

    return 0;
}