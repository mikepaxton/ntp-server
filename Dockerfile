FROM debian:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y chrony && \
    rm -rf /var/lib/apt/lists/*

# Copy the chrony configuration file
COPY chrony.conf /etc/chrony/chrony.conf

# Command to run the chrony daemon
CMD ["chronyd", "-d", "-f", "/etc/chrony/chrony.conf"]
