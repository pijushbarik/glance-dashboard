#!/data/data/com.termux/files/usr/bin/bash
# Find and delete log files in log directory older than 2 days (48 hours)
find /data/data/com.termux/files/home/glance/logs/ -name "app_log.*" -mmin +2880 -delete
