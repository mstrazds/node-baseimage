# node-baseimage
A Node 8.x.x base image container. Builds upon on the [phusion/baseimage-full](https://github.com/phusion/baseimage-docker) container. You can find the docker automated build [here](https://registry.hub.docker.com/u/mstrazds/node-baseimage/).

### Services
All services are defined and managed using the phusion/baseimage methodology. NodeJS services utilise the PM2 service monitor for processes. Logs are output using syslog and can be accessed using ``docker logs {container}``. PM2 does not need to be used if not required.

* PM2 (for controlling services)

### Default Settings
The container sets up a www root folder in the following location:

``/home/app/public``

By default there is a server.js node application saved to:

``/home/app/server.js``

PM2 is configured to start and monitor this service.

The following port is exposed (intended to be used behind reverse proxy):

* 8000 (HTTP)
