#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <pthread.h>

#define PORT 8989
#define BUFFER_SIZE 1024

// Function to handle client tasks
void* client_task(void* arg) {
    int sock = 0;
    struct sockaddr_in serv_addr;
    const char *hello = "Hello from client";
    char buffer[BUFFER_SIZE] = {0};

    pthread_t this_id = pthread_self();

    // Create socket
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        fprintf(stderr, "Thread %lu: Socket creation error\n", (unsigned long)this_id);
        return NULL;
    }

    // Prepare the server address
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(PORT);

    // Convert IPv4 address from text to binary
    if (inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr) <= 0) {
        fprintf(stderr, "Thread %lu: Invalid address/Address not supported\n", (unsigned long)this_id);
        close(sock);
        return NULL;
    }

    // Connect to the server
    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        fprintf(stderr, "Thread %lu: Connection Failed\n", (unsigned long)this_id);
        close(sock);
        return NULL;
    }

    // Send message to the server
    send(sock, hello, strlen(hello), 0);
    printf("Thread %lu: Hello message sent\n", (unsigned long)this_id);

    // Read response from the server
    read(sock, buffer, BUFFER_SIZE);
    printf("Thread %lu: Message received: %s\n", (unsigned long)this_id, buffer);

    // Close the socket
    close(sock);
    return NULL;
}

// Driver Code
int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <number_of_clients>\n", argv[0]);
        return EXIT_FAILURE;
    }

    int num_clients = atoi(argv[1]);
    pthread_t *threads = malloc(num_clients * sizeof(pthread_t));

    // Create threads for concurrent client connections
    for (int i = 0; i < num_clients; i++) {
        if (pthread_create(&threads[i], NULL, client_task, NULL) != 0) {
            fprintf(stderr, "Failed to create thread %d\n", i + 1);
            free(threads);
            return EXIT_FAILURE;
        }
    }

    // Wait for all threads to finish
    for (int i = 0; i < num_clients; i++) {
        pthread_join(threads[i], NULL);
    }

    free(threads);
    return EXIT_SUCCESS;
}