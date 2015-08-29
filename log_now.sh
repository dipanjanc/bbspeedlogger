#!/bin/bash
ST_CLI='/usr/local/bin/speedtest-cli'
BBLOGGER_PATH="/Users/dipanjanchakraborty/bblogger"
NOW=$(date +"%Y-%m-%d_%H-%M")
TMP="$BBLOGGER_PATH/.temp"
#YOUR_SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')
#iwgetid

# check if bblogger folder exists or not
if [ ! -d "$BBLOGGER_PATH" ]; then
  echo "bblogger directory does not exist. creating..."
  /bin/mkdir -p $BBLOGGER_PATH
fi

$ST_CLI --share 1> $TMP
URL=$(grep -io 'www.speedtest.net/result/.*[.png]' $TMP)
wget -O $BBLOGGER_PATH/$NOW.png "$URL"



