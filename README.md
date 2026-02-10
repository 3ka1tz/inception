# Inception
This project has beeen created as part of the 42 curriculum by elopez-u.

## Description
- **Virtual Machines vs Docker**: Virtual Machines or also know as VMs,

- **Secrets vs Environment Variables**:

- **Docker Network vs Host Network**:  
The bridge network is Docker's standard, isolated virtual network. Docker creates a virtual network (usually docker0) and containers get their own private IP inside that network. Containers communicate with each other through this virtual network; to expose them to the outside world, you must publish ports.  
The host network removes the isolation between container and host. The container shares the host's network stack, no virtual interface, no NAT. The container uses the host's IP address directly. Ports inside the container are the same as ports on the host (no port mapping allowed).

- **Docker Volumes vs Bind Mounts**: 

## Instructions
To start running my Inception project’s Docker containers, simply run `make up` from the project’s root directory, where the Makefile is located.

You can also run `make re` in case any unwanted temporary files were generated.

Once the Docker containers are up, open 127.0.0.1, localhost or elopez-u.42.fr in the web browser of your choice.

## Resources
https://aws.amazon.com/compare/the-difference-between-docker-vm/

https://docs.docker.com
https://docs.docker.com/build/building/best-practices/

AI helped me understand Docker logs, find version compatibility issues, correct typos, and identify default naming conventions.
