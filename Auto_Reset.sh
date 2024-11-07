#!/bin/bash


while true; do
    # Check if the app is running
    pid=$(ps aux | grep 'bash' | grep -v grep | awk '{print $2}')
    BTBScreens_PATH=""
    echo "PID is $pid"

    if [ -n "$pid" ]; then
        # Check if the app is responding
        if ! ps -p $pid > /dev/null; then
            echo "$BTBScreens is not responding. Terminating the app..."
            kill -9 $pid
            echo "Restarting BTBscreens.sh..." 
            bash "$BTBScreens_PATH"
        else
            echo "BTBScreens.sh is running and responding."
        fi
    else
        echo "BTBScreens.sh is not running."
        bash "$BTBScreens_PATH"
    fi

    # Wait for 30 seconds before checking again
    sleep 30
done
