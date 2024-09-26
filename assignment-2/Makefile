# Specify the compiler
CC = gcc

# Compiler flags
CFLAGS = -pthread

# Target executable
TARGET = multi_threaded_server

# Source file
SRC = multi_threaded_server.c

# Default rule
all: $(TARGET)

# Rule to build the server
$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)
	@echo "Compilation complete!"

# Rule to run the server with taskset on a specified CPU
run: $(TARGET)
	@if [ -z "$(CPU)" ]; then \
		echo "Usage: make run CPU=<cpu_number>"; \
	else \
		echo "Running the server on CPU $(CPU) with taskset..."; \
		taskset -c $(CPU) ./$(TARGET); \
	fi

# Clean up generated files
clean:
	rm -f $(TARGET)
	@echo "Cleaned up!"

# Phony targets
.PHONY: all clean run