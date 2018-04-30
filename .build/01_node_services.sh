#!/usr/bin/env bash

# ---------------------------------------
# Run PM2 Managed Node services
# ---------------------------------------

{ # try
    echo "Start Node JS Server..."
    (cd /home/app/; node start server.js)

} || { # catch
    echo "Exception: an error occured..."

}
