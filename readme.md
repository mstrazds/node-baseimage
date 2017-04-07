# node-baseimage
A Node 6.x.x base image container. Builds upon on the excellent [phusion/passenger-full](https://github.com/phusion/passenger-docker) container. You can find the docker automated build [here](https://registry.hub.docker.com/u/mstrazds/node-baseimage/).

### Services
All services are defined and managed using the phusion/baseimage methodology. Logs are output using syslog and can be accessed using ``docker logs {container}``.

* Nginx
* Passenger

### Default Settings
The container sets up a www root folder in the following location:

``/home/app/public``

By default there is a server.js node application saved to:

``/home/app/server.js``

Passenger is configured to pick this up and run using the nginx module.

The following port is exposed (intended to be used behind reverse proxy):

* 80 (HTTP)

### Notes
The `.build/env.conf` contains environment variables (examples) that
are maintained through to the passenger service. These are copied
to the `/etc/nginx/main.d/env.conf` folder on build. You should replace
these with your own when using this as a baseimage.
