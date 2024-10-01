#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define PORT 8989
#define BUFFER_SIZE 1024

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <number_of_requests>\n", argv[0]);
        return -1;
    }

    int request_limit = atoi(argv[1]);
    if (request_limit <= 0) {
        fprintf(stderr, "Please provide a positive integer for the number of requests.\n");
        return -1;
    }

    int sock = 0;
    struct sockaddr_in serv_addr;
    char buffer[BUFFER_SIZE] = {0};
    char request[BUFFER_SIZE];

    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        fprintf(stderr, "Socket creation error\n");
        return -1;
    }

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(PORT);

    if (inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr) <= 0) {
        fprintf(stderr, "Invalid address/ Address not supported\n");
        return -1;
    }

    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        fprintf(stderr, "Connection Failed\n");
        return -1;
    }

    printf("Connected to server. You can send up to %d messages.\n", request_limit);

    for (int i = 0; i < request_limit; i++) {
        printf("Enter a message: \n");
        if (fgets(request, sizeof(request), stdin) == NULL) break;

        request[strcspn(request, "\n")] = 0;
        send(sock, request, strlen(request), 0);
        printf("Message sent\n");

        int valread = read(sock, buffer, BUFFER_SIZE);
        if (valread > 0) {
            buffer[valread] = '\0';
            printf("Server Response: %s\n", buffer);
        }
    }

    printf("Closing connection.\n");
    close(sock);
    return 0;
}