#!/bin/bash

websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
    "https://example.com"
)

logFile="status.log"


for website in "${websites[@]}"; do
    status_code=$(curl -o /dev/null -s -w "%{http_code}" --location "$website")

    if [[ "$status_code" -eq 200 ]]; then
        echo "$website is UP" >> "$logFile"
    else
        echo "$website is DOWN" >> "$logFile"
    fi
done

echo "Результати записано у файл $logFile"