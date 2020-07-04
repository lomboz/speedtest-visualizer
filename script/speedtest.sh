#!/bin/sh

TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
TARGET_DIR=/var/www/html/speedtest-visualizer/data
CALL_PATH=$(pwd)

echo "run speedtest on "$TIMESTAMP

#/var/www/html/speedtest-visualizer/script/speedtest-cli --json >> $TARGET_DIR/speedtest_$TIMESTAMP.json
speedtest --server 33397 --json >> $TARGET_DIR/speedtest_$TIMESTAMP.json

# NUr Ergebnisse der letzten Wochen
echo "daten aufräumen"
find $TARGET_DIR -depth -mtime +7 -exec rm -f '{}' \;
echo "index der Dateien anlegen"
cd $TARGET_DIR
find  -type f \( -name "*.json" \) | sort > $TARGET_DIR/index.txt

cd $CALL_PATH
#echo "speedtest_$TIMESTAMP.json" >> $TARGET_DIR/index.txt

