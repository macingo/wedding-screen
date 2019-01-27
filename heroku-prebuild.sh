#!/bin/sh

echo "Download from: ${DOWNLOAD_URL}"

if [ "x${DOWNLOAD_URL}" = "x" ]; then
  exit 0
fi

mkdir /tmp/wedding
curl -L -o /tmp/wedding/file.zip ${DOWNLOAD_URL}
unzip /tmp/wedding/file.zip -d /tmp/wedding
rm -f /tmp/wedding/file.zip
find /tmp/wedding -name 'config.json' | xargs -I '{}' mv '{}' ./src/config/config.json
find /tmp/wedding -type f -not -path '*/\.*' | xargs -I '{}' mv '{}' ./src/public/images/
rm -rf /tmp/wedding
