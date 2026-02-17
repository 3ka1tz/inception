# User Documentation

This project has been created as part of the 42 curriculum by elopez-u.

## Provided Services

**MariaDB**
MariaDB Server is one of the most popular open source relational databases. It's made by the original developers of MySQL and guaranteed to stay open source. It is part of most cloud offerings and the default in most Linux distributions. In my case, I will be using MariaDB as the database service for WordPress. For more information about this service, visit: https://mariadb.org.

**WordPress**
WordPress is a open source publishing platform of choice for millions of websites worldwide, from creators and small businesses to enterprises. In my case, I will be using WordPress service to provide a index sample page to localhost. For more information about this service, visit: https://wordpress.org.

**NGINX**
NGINX is an HTTP web server, reverse proxy, content cache, load balancer, TCP/UDP server, and mail proxy server. In my case, I will be using NGINX service as the only entrypoint into my infrastructure via the port 443 only, and using just the TLSv1.2 or TLSv1.3 protocols. For more information about this service, visit: https://nginx.org.

## Start and Stop the Project

To start the project, clone this full repository into a Linux or macOS virtual machine and run `make up` from the project's root directory, where the Makefile is located.

You can also run `make re` in case any error occurs during container generation, or in case you want to rebuild them.

To stop it, run `make down` to stop the containers or `make fclean` to remove them.

## Access the Website and the Administration Panel

Once the Docker containers are up, open 127.0.0.1, localhost or elopez-u.42.fr in the web browser of your choice and you will access the WordPress sample page.

To access the WordPress Administration Panel, you just need to add /wp-admin to the previous mentioned URLs, for example, you can use "localhost/wp-admin".

## Locate and Manage Credentials

Credentials are stored as environment variables in a hidden .env file. As they are environment variables, just modifying their values in the .env file, will change them in all the services they are used.

## Check that the Services are Running correctly

The `docker ps` command only shows running containers by default. To see all containers, use the -all (or -a) flag.

The `docker logs` command batch-retrieves logs present at the time of execution.
