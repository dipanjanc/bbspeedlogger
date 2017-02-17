#!/bin/bash
ST_CLI='/usr/local/bin/speedtest-cli'
USER=$(whoami)
BBLOGGER_PATH="/Users/$USER/Dropbox/wizardry/bbspeedlogger"
RESULTS="$BBLOGGER_PATH/results"
NOW=$(date +"%Y-%m-%d_%H-%M")
TMP="$BBLOGGER_PATH/.temp"
#!/bin/bash
ST_CLI='/usr/local/bin/speedtest-cli'
USER=$(whoami)
YOUR_SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'| sed '/^$/d;s/[[:blank:]]//g')
BBLOGGER_PATH="/Users/$USER/bbspeedlogger"
RESULTS="$BBLOGGER_PATH/results/$YOUR_SSID"
NOW=$(date +"%Y-%m-%d_%H-%M")
TMP="$BBLOGGER_PATH/.temp"

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

#check connectivity to internet
echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    
printf '\n\n===========START SPEEDTEST=============\n\n' >> $TMP
printf "$YOUR_SSID - $NOW" 1>> $TMP
printf "\n\n" 1>> $TMP
$ST_CLI --share 1>> $TMP

URL=$(grep -io 'www.speedtest.net/result/.*[.png]' $TMP) 1>> $TMP
wget -O $RESULTS/$NOW.png "$URL" 1>> $TMP

printf '\n\n============END OF SPEEDTEST============\n\n' 1>> $TMP

#cat $TMP > $RESULTS/$NOW.txt
#Preparing notification
DLD=$(grep Download: $TMP)
ULD=$(grep Upload: $TMP)

terminal-notifier -message "$DLD & $ULD" -title "bbspeedlogger" -subtitle "$YOUR_SSID" -open file://localhost/$RESULTS

printf "\n\n============Checking ping============\n" 1>> $TMP
ping -c 10 google.com >>$TMP
printf '\n\n========================\n\n' 1>> $TMP
cat $TMP >> $RESULTS/$NOW.txt

else
    echo "You are Offline" 1>> $TMP
    terminal-notifier -message "You are Offline" -title "bbspeedlogger"
fi

rm $TMP


