#!/bin/bash
USER=$(whoami)
BBLOGGER_PATH="/Users/$USER/bbspeedlogger"
NOW=$(date +"%Y-%m-%d_%H-%M")
TMP="$BBLOGGER_PATH/.temp"

printf "\n\n Checking ping\n" 1>> $TMP
ping -c 10 google.com >>$TMP
printf '\n\n========================\n\n' 1>> $TMP
cat $TMP >> $RESULTS/$NOW.txt