#!/bin/bash

echo "=== Process Management Demonstration ==="
echo ""

echo "1. Listing top 10 CPU-consuming processes:"
ps aux --sort=-%cpu | head -11
echo ""

echo "2. Current system load:"
uptime
echo ""

echo "3. Memory usage:"
free -h
echo ""

echo "4. Starting a background process:"
sleep 300 &
DEMO_PID=$!
echo "Started sleep process with PID: $DEMO_PID"
echo ""

echo "5. Checking process status:"
ps -p $DEMO_PID -o pid,ppid,cmd,stat
echo ""

echo "6. Killing the demo process:"
kill $DEMO_PID
sleep 1
echo "Process killed"
echo ""

echo "7. Listing active systemd services:"
systemctl list-units --type=service --state=running | head -10
echo ""

echo "Demo complete!"
