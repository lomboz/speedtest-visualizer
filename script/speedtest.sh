#!/bin/sh

TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
TARGET_DIR=../data

echo "run speedtest on "$TIMESTAMP

./speedtest-cli --json >> $TARGET_DIR/speedtest_$TIMESTAMP.json

echo "speedtest_$TIMESTAMP.json" >> $TARGET_DIR/index.txt