#!/bin/bash
ST_CLI='/usr/local/bin/speedtest-cli'
USER=$(whoami)
BBLOGGER_PATH="/Users/$USER/bbspeedlogger"
RESULTS="$BBLOGGER_PATH/results"
NOW=$(date +"%Y-%m-%d_%H-%M")
TMP="$BBLOGGER_PATH/.temp"
#YOUR_SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')
#iwgetid

# check if bblogger folder exists or not
if [ ! -d "$BBLOGGER_PATH" ]; then
  echo "bblogger directory does not exist. creating..."
  /bin/mkdir -p $BBLOGGER_PATH
fi

if [ ! -d "$RESULTS" ]; then
  echo "result directory does not exist. creating..."
  /bin/mkdir -p $RESULTS
fi

$ST_CLI --share 1> $TMP
URL=$(grep -io 'www.speedtest.net/result/.*[.png]' $TMP)
wget -O $RESULTS/$NOW.png "$URL"

DLD=$(grep Download $TMP)
ULD=$(grep Upload $TMP)

terminal-notifier -message "$DLD & $ULD" -title "bbspeedlogger" -command -subtitle "Speed test complete"
