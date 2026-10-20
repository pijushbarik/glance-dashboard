#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock

glance_home=/data/data/com.termux/files/home/glance-dashboard

cd $glance_home

(./launch-glance.sh 2>&1 | rotatelogs -p ./cleanup-logs.sh ./logs/app_log.%Y-%m-%d-%H%M.log 21600 &)
