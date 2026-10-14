#!/usr/bin/env bash
set -x
if [ -d /app/repo/hi-bataafse-politieke-tijdschriften-web/.git ]; then
    cd /app/repo/hi-bataafse-politieke-tijdschriften-web
    git pull
else
    git clone https://github.com/knaw-huc/hi-bataafse-politieke-tijdschriften-web.git /app/repo/hi-bataafse-politieke-tijdschriften-web
fi
cp -r /app/repo/hi-bataafse-politieke-tijdschriften-web/html/* /app/repo/html/

