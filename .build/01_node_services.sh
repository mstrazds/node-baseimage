#!/usr/bin/env bash

# ---------------------------------------
# Run PM2 Managed Node services
# ---------------------------------------

{ # try
    echo "Setup node service with PM2..."
    (cd /home/app/; pm2 start server.js)

} || { # catch
    echo "Exception: an error occured..."
    
}
