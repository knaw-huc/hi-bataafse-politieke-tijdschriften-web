FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron gettext && apt-get -y install git

WORKDIR /app

COPY cron/crontab /app/crontab
COPY cron/entrypoint_cron.sh /app/
COPY cron/crontask.sh /app/

ENTRYPOINT ["/app/entrypoint_cron.sh"]
