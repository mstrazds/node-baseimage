FROM mstrazds/armhf-passenger-docker:latest

# Install node 8.x environment
RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install Ubuntu Packages
RUN apt-get update && apt-get install nodejs yarn vim wget -y

# Phusion setup
ENV HOME /root

CMD ["/sbin/my_init"]

# Set terminal to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Create new symlink to UTC timezone for localtime
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/UTC /etc/localtime

# Copy friendly bashrc file for docker identification in terminal
COPY .build/.bashrc /root/.bashrc

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# COPY .build/default /etc/nginx/sites-available/default
COPY .build/app.conf /etc/nginx/sites-enabled/app.conf
COPY .build/node-harmony-proxy /usr/local/bin/node-harmony-proxy

# Make harmony proxy wrapper executable for passenger service
RUN chmod +x /usr/local/bin/node-harmony-proxy

# Preserve Environment Variables for Nginx/Passenger
COPY .build/env.conf /etc/nginx/main.d/env.conf

# Set terminal environment
ENV TERM=xterm

# Setup Nginx
RUN rm -f /etc/service/nginx/down

# Setup working dir/create empty public folder
WORKDIR /home/app
RUN mkdir -p /home/app/public

# Bundle app source
COPY . /home/app

# Setup Public folder permissions
RUN chown -R app:app /home/app/public
RUN chmod -R 755 /home/app/public

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
