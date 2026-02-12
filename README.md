# Inception
This project has beeen created as part of the 42 curriculum by elopez-u.

## Description
- **Virtual Machines vs Docker**

Virtual Machines, also known as VMs, are an emulation of a physical machine (including virtualized hardware) running an operating system.

Dokcer is a software platform to create and run Docker containers. A Docker container is an emulation of a user-space instance, the part of the operating system where user processes run.

- **Secrets vs Environment Variables**

Secrets are stored in a virtual filesystem managed by Docker, and they are only accessible to the containers that have been granted access to them.

Environment Variables, on the other hand, are visible to anyone with access to the container, including processes running the container.

- **Docker Network vs Host Network**

Bridge is the default driver for standalone containers. It creates a private, internal network on the host. Containers on the same bridge network can communicate with each other using their internal IP addresses. To access them from outside the host, you must map ports.

Host driver removes network isolation entirely. The container shares the host's network namespace. This means the container uses the host's IP address directly, and any port the container listens on is opened on the host.

- **Docker Volumes vs Bind Mounts**

Docker Volumes are Docker's answer to managed persistent storage. When you create a named volume, Docker builds a virtual file system that can then be attached to a container (or multiple containers) to serve as persistent storage. This virtual file system, while existing on the host, is managed by Docker itself.

Bind Mounts are fairly straightforward, it is a way to mount a directory from the host machine into your container. You simply define the directory on your host system and the path where you'd like it to appear within your container's filesystem.

## Instructions
To start running my Inception project’s Docker containers, simply run `make up` from the project’s root directory, where the Makefile is located.

You can also run `make re` in case any error occurs during container generation, or in case you want to rebuild them.

Once the Docker containers are up, open 127.0.0.1, localhost or elopez-u.42.fr in the web browser of your choice and you will access the WordPress sample page.

## Resources
https://docs.docker.com  
https://docs.docker.com/build/building/best-practices  
https://aws.amazon.com/compare/the-difference-between-docker-vm  
https://semaphore.io/blog/docker-secrets-management  
https://www.geeksforgeeks.org/devops/basics-of-docker-networking  
https://www.portainer.io/blog/persistent-storage-docker-bind-mounts-and-named-volumes

While developing this project, I also used AI. It helped me correct typos, identify default naming conventions, solve version compatibility issues, and especially understand Docker logs.
