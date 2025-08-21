#!/bin/bash

APP_URL="http://localhost:5000"

for ((i=1; i<=50; i++)); do
    echo "Making request $i"
    curl -s "$APP_URL" >/dev/null
    sleep 1  # Optional: Add a delay between requests
done

echo "Requests completed"
