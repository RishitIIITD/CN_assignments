CC = gcc
CFLAGS = -Wall -pthread
SERVER_SRC = sample_server.c
CLIENT_SRC = sample_client.c
SERVER_BIN = sample_server
CLIENT_BIN = sample_client

.PHONY: all clean run_server run_client

all: $(SERVER_BIN) $(CLIENT_BIN)

$(SERVER_BIN): $(SERVER_SRC)
	$(CC) $(CFLAGS) -o $(SERVER_BIN) $(SERVER_SRC)

$(CLIENT_BIN): $(CLIENT_SRC)
	$(CC) $(CFLAGS) -o $(CLIENT_BIN) $(CLIENT_SRC)

run_server:
	@echo "Starting server..."
	taskset -c $(CPU) ./$(SERVER_BIN)

run_client:
	@echo "Starting client with $(REQUESTS) requests on CPU core(s) $(CPU)..."
	taskset -c $(CPU) ./$(CLIENT_BIN) $(REQUESTS)

run: all
	@echo "Usage: make run CPU=<CPU cores> REQUESTS=<number of requests>"
	@echo "Example: make run CPU=0 REQUESTS=5"

clean:
	rm -f $(SERVER_BIN) $(CLIENT_BIN)