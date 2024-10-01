#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define PORT 8989
#define BUFFER_SIZE 1024

int main(int argc, char *argv[]) {
    // Check for the correct number of command-line arguments
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <number_of_requests>\n", argv[0]);  // Print usage message if incorrect
        return -1;  // Exit with error code
    }

    // Convert the second argument to an integer and check if it's positive
    int request_limit = atoi(argv[1]);
    if (request_limit <= 0) {
        fprintf(stderr, "Please provide a positive integer for the number of requests.\n");  // Error message for non-positive input
        return -1;  // Exit with error code
    }

    int sock = 0;  // Variable for the socket file descriptor
    struct sockaddr_in serv_addr;  // Structure to hold server address information
    char buffer[BUFFER_SIZE] = {0};  // Buffer to store server responses
    char request[BUFFER_SIZE];  // Buffer to store user input requests

    // Create a socket
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        fprintf(stderr, "Socket creation error\n");  // Print error message if socket creation fails
        return -1;  // Exit with error code
    }

    // Configure server address structure
    serv_addr.sin_family = AF_INET;  // Set the address family to IPv4
    serv_addr.sin_port = htons(PORT);  // Convert port number to network byte order

    // Convert IPv4 address from text to binary form
    if (inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr) <= 0) {
        fprintf(stderr, "Invalid address/ Address not supported\n");  // Print error message for invalid address
        return -1;  // Exit with error code
    }

    // Establish a connection to the server
    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        fprintf(stderr, "Connection Failed\n");  // Print error message if connection fails
        return -1;  // Exit with error code
    }

    printf("Connected to server. You can send up to %d messages.\n", request_limit);  // Inform user of the connection and request limit

    // Loop to send messages to the server
    for (int i = 0; i < request_limit; i++) {
        printf("Enter a message: \n");  // Prompt user for input
        if (fgets(request, sizeof(request), stdin) == NULL) break;  // Read user input and break if there is an error

        request[strcspn(request, "\n")] = 0;  // Remove the newline character from the input
        send(sock, request, strlen(request), 0);  // Send the message to the server
        printf("Message sent\n");  // Confirm message was sent

        // Read the server's response
        int valread = read(sock, buffer, BUFFER_SIZE);  // Read response from the server
        if (valread > 0) {  // If data was read successfully
            buffer[valread] = '\0';  // Null-terminate the buffer
            printf("Server Response: %s\n", buffer);  // Print the server's response
        }
    }

    printf("Closing connection.\n");  // Inform user that the connection is being closed
    close(sock);  // Close the socket
    return 0;  // Exit successfully
}