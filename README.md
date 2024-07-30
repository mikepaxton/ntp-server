# NTP Server Setup with Docker on Raspberry Pi

This repository contains the configuration files needed to set up a Network Time Protocol (NTP) server using Docker and Docker Compose on a Raspberry Pi. The NTP server is based on `chrony` and uses the `debian:latest` Docker image for a lightweight solution.

## Currently using NTP-Server
- Joplin-Server

## Prerequisites

- Docker installed on your Raspberry Pi
- Docker Compose installed on your Raspberry Pi

## Files in This Repository

- `Dockerfile`: Builds a Docker image for the `chrony` NTP server.
- `chrony.conf`: Configuration file for the `chrony` NTP server.
- `docker-compose.yml`: Docker Compose file to set up and run the NTP server.

## Instructions

### Step 1: Clone the Repository

Clone this repository to your Raspberry Pi:

```bash
git clone https://github.com/mikepaxton/ntp-server.git
cd ntp-server
```


### Step 2: Build and Run the NTP Server
Navigate to the directory containing the files and run the following commands to build the Docker image and start the NTP server:

```sh
docker-compose up -d --build

```

### Step 3: Verify the NTP Server
To check if the NTP server is running correctly, you can inspect the logs:

```sh
docker-compose logs ntp
```

### Additional Information

#### Dockerfile:

Uses debian:latest as the base image.
Installs chrony NTP server.
Copies the chrony.conf configuration file into the container.
Starts the chronyd daemon with the specified configuration file.

#### chrony.conf:

Configures chrony to use pool.ntp.org servers, specifies the drift file location, and sets various time synchronization options.

#### docker-compose.yml:

Builds the Docker image from the Dockerfile.
Exposes UDP port 123, which is used by NTP.
Mounts volumes for chrony data and system time settings.
Adds SYS_TIME capability to the container to allow chronyd to adjust the system clock.
Sets environment variables for NTP servers and timezone.

### Notes
Ensure Docker and Docker Compose are correctly installed on your Raspberry Pi.
If you encounter any issues, check the Docker logs for more information.

