# ReadMe

## Instructions for running the makefile of Question 1


### Compile server node:
make server

### Compile client node:
make client

### Compile both server and client node:
make all

### Run the server node:
make run-server CPU=<CPU_core>

CPU_core = 0, 1, 2, ...

### Run the client node:
make run-client CPU_CORE=<CPU_corer> NUM_CLIENTS=<Number_of_requests>

Number_of_requests = 1, 2, 3, ...

Eg,

make run-client CPU_CORE=1,2 NUM_CLIENTS=2

make run-client CPU_CORE=1-5 NUM_CLIENTS=5

## Instruction for running the makefile of Question 2 (select)

### Compile both server and client node:
make all

### Run the server node:
make run_server CPU=<CPU_core>

### Run the client node:
make run_client CPU=<CPU_core> REQUESTS=<Number_of_requests>
