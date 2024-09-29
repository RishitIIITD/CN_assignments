#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define PORT 8989
#define BUFFER_SIZE 1024

// Function to handle client tasks
void client_task(int request_number) {
    int sock = 0;
    struct sockaddr_in serv_addr;
    char buffer[BUFFER_SIZE] = {0};
    char request[BUFFER_SIZE];

    // Create a unique request message for each client
    snprintf(request, sizeof(request), "Requesting top 2 CPU processes for request number %d", request_number);

    // Create socket
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        fprintf(stderr, "Request %d: Socket creation error\n", request_number);
        return;
    }

    // Prepare the server address
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(PORT);

    // Convert IPv4 address from text to binary
    if (inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr) <= 0) {
        fprintf(stderr, "Request %d: Invalid address/Address not supported\n", request_number);
        close(sock);
        return;
    }

    // Connect to the server
    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        fprintf(stderr, "Request %d: Connection Failed\n", request_number);
        close(sock);
        return;
    }

    // Introduce a random delay
    usleep((rand() % 100) * 1000);  // Random delay between 0 to 100 ms

    // Send request to the server
    send(sock, request, strlen(request), 0);
    printf("Request %d: Request sent\n", request_number);

    // Read response from the server
    read(sock, buffer, BUFFER_SIZE);
    printf("Request %d: Server Response: %s\n", request_number, buffer);

    // Close the socket
    close(sock);
}

// Driver Code
int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <number_of_clients>\n", argv[0]);
        return EXIT_FAILURE;
    }

    int num_clients = atoi(argv[1]);

    // Execute client tasks sequentially
    for (int i = 1; i <= num_clients; i++) {
        client_task(i);
    }

    return EXIT_SUCCESS;
}