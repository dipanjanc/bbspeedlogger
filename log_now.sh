
#!/bin/bash
#display SSID Mac
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'
#uncomment to display SSID for Ubuntu
#iwgetid
date && speedtest-cli --share && printf "\n\n================= \n\n\n"
