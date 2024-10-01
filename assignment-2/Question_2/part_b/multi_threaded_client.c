#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <pthread.h>
#include <time.h>

#define PORT 8989
#define BUFFER_SIZE 1024

// Function to handle client tasks
void* client_task(void* arg) {
    int sock = 0;                                 // Socket descriptor for the client
    struct sockaddr_in serv_addr;                 // Structure to store server address
    char buffer[BUFFER_SIZE] = {0};               // Buffer for storing the server's response
    char request[BUFFER_SIZE];                    // Buffer for storing the request to be sent to the server
    pthread_t this_id = pthread_self();           // Get the current thread ID

    // Create a unique request message for each thread
    snprintf(request, sizeof(request), "Requesting top 2 CPU processes from thread %lu", (unsigned long)this_id);

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

    // Introduce a random delay
    usleep((rand() % 100) * 1000);  // Random delay between 0 to 100 ms

    // Send request to the server
    send(sock, request, strlen(request), 0);
    printf("Thread %lu: Request sent\n", (unsigned long)this_id);

    // Read response from the server
    read(sock, buffer, BUFFER_SIZE);
    printf("Thread %lu: Server Response: %s\n", (unsigned long)this_id, buffer);

    // Close the socket
    close(sock);
    return NULL;
}

// Driver Code
int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is passed
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <number_of_clients>\n", argv[0]); // Error message for incorrect usage
        return EXIT_FAILURE;  // Exit the program with a failure code if arguments are incorrect
    }

    int num_clients = atoi(argv[1]);  // Convert the number of clients from command line argument to an integer
    pthread_t *threads = malloc(num_clients * sizeof(pthread_t));  // Allocate memory for storing thread IDs

    // Create threads to simulate concurrent client connections
    for (int i = 0; i < num_clients; i++) {
        // Create a new thread for each client connection, executing the 'client_task' function
        if (pthread_create(&threads[i], NULL, client_task, NULL) != 0) {
            // If thread creation fails, print an error message, free allocated memory, and exit with failure code
            fprintf(stderr, "Failed to create thread %d\n", i + 1);
            free(threads);  // Free dynamically allocated memory
            return EXIT_FAILURE;  // Return failure code
        }
    }

    // Wait for all threads to finish
    for (int i = 0; i < num_clients; i++) {
        pthread_join(threads[i], NULL);
    }

    free(threads);
    return EXIT_SUCCESS;
}