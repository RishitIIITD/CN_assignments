# flags
CC = gcc
CFLAGS = -pthread
CLIENT_SRC = multi_threaded_client.c
SERVER_SRC = multi_threaded_server.c
CLIENT_OUT = multi_threaded_client
SERVER_OUT = multi_threaded_server
PORT = 8989
CLIENT_CPU_CORE ?= 1  # Default CPU core for client
SERVER_CPU_CORE ?= 0  # Default CPU core for server
NUM_CLIENTS ?= 1      # Default number of client threads

# deafult - compile both server and client
all: server client

# compile server
server: $(SERVER_SRC)
	$(CC) $(CFLAGS) $(SERVER_SRC) -o $(SERVER_OUT)

# compile client
client: $(CLIENT_SRC)
	$(CC) $(CFLAGS) $(CLIENT_SRC) -o $(CLIENT_OUT)

# Rrun server
run-server: server
	taskset -c $(SERVER_CPU_CORE) ./$(SERVER_OUT)

# run client
run-client: client
	taskset -c $(CLIENT_CPU_CORE) ./$(CLIENT_OUT) $(NUM_CLIENTS)

# clean
clean:
	rm -f $(SERVER_OUT) $(CLIENT_OUT)