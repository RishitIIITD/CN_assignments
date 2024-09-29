#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define PORT 8989
#define BUFFER_SIZE 1024

int main() {
    int sock = 0;
    struct sockaddr_in serv_addr;
    char buffer[BUFFER_SIZE] = {0};
    char request[BUFFER_SIZE];

    // Create socket
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        fprintf(stderr, "Socket creation error\n");
        return -1;
    }

    // Prepare the server address
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(PORT);

    // Convert IPv4 address from text to binary
    if (inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr) <= 0) {
        fprintf(stderr, "Invalid address/ Address not supported\n");
        return -1;
    }

    // Connect to the server
    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        fprintf(stderr, "Connection Failed\n");
        return -1;
    }

    printf("Connected to server. Enter a message: \n");
    while (fgets(request, sizeof(request), stdin) != NULL) {
        // Remove newline character from the input
        request[strcspn(request, "\n")] = 0;

        // Send request to the server
        send(sock, request, strlen(request), 0);
        printf("Message sent\n");

        // Read response from the server
        int valread = read(sock, buffer, BUFFER_SIZE);
        if (valread > 0) {
            buffer[valread] = '\0'; // Null-terminate the buffer
            printf("Server Response: %s\n", buffer);
        }

        printf("Enter a message: \n");
    }

    // Close the socket
    close(sock);
    return 0;
}