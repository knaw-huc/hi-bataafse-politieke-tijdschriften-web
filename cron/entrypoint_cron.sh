#!/bin/sh

mv /app/crontab /etc/cron.d/crontab

crontab /etc/cron.d/crontab
touch /var/log/cron.log

# Run right away first time, otherwise the volume is empty until the next whole hour
/app/crontask.sh >> /var/log/cron.log 2>&1

cron && tail -f /var/log/cron.log
