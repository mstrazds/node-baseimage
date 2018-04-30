# node-baseimage
A Node 8.x.x base image container. Builds upon on the [phusion/baseimage-full](https://github.com/phusion/baseimage-docker) container. You can find the docker automated build [here](https://registry.hub.docker.com/u/mstrazds/node-baseimage/).

### Services
All services are defined and managed using the phusion/baseimage methodology. NodeJS services are managed by runit. Logs are output using syslog and can be accessed using ``docker logs {container}``.

### Default Settings
The container sets up a www root folder in the following location:

``/home/app/public``

By default there is a server.js node application saved to:

``/home/app/server.js``

The following port is exposed (intended to be used behind reverse proxy):

* 8000 (HTTP)
