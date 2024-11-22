from collections import defaultdict

# Read the uploaded .tr file to extract enqueue and dequeue events and compute queueing delays.
trace_file_path = 'tcp-example3.tr'
queueing_delays = []

# Define a dictionary to store enqueue times by packet IDs.
enqueue_times = defaultdict(float)

# Reprocess trace file to extract queueing delay
with open(trace_file_path, 'r') as file:
    for line in file:
        parts = line.strip().split()
        if len(parts) > 0:
            event = parts[0]
            time = float(parts[1])
            packet_id = parts[-1]  # Assuming last column is the packet identifier

            if event == '+':  # Enqueue event
                enqueue_times[packet_id] = time
            elif event == '-' and packet_id in enqueue_times:  # Dequeue event
                delay = time - enqueue_times[packet_id]
                queueing_delays.append((enqueue_times[packet_id], delay))
                del enqueue_times[packet_id]  # Remove processed packet

# Save the processed queueing delays to a .dat file
queueing_delay_file_path = "queueing_delay3.dat"

with open(queueing_delay_file_path, 'w') as f:
    for time, delay in queueing_delays:
        f.write(f"{time} {delay}\n")

print(len(queueing_delays))
print(queueing_delay_file_path)  # Output the number of data points and file path