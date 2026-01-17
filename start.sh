#!/bin/bash

# Start PHP server in background on port 8080
php5 -S 127.0.0.1:8080 -t /app &

# Wait a moment for PHP to start
sleep 1

# Start HAProxy in foreground
haproxy -f /etc/haproxy/haproxy.cfg -db

