#!/bin/bash
USER=$(whoami)
BBLOGGER_PATH="/Users/$USER/bbspeedlogger"

#Install dependencies
pip install speedtest-cli 
brew install terminal-notifier
brew install wget
printf '\n\n creating symlink in usr/local/bin \n\n'

sudo ln -s $BBLOGGER_PATH/log_now.sh /usr/local/bin/bbspeedlogger

#add alias for bblogger in your zshrc
grep -q -F 'alias bbspeedlogger='/usr/local/bin/bbspeedlogger'' ~/.zshrc || echo 'alias bbspeedlogger='/usr/local/bin/bbspeedlogger'' >> ~/.zshrcgrep -q -F 'alias bbspeedlogger='/usr/local/bin/bbspeedlogger'' ~/.zshrc || echo 'alias bbspeedlogger='/usr/local/bin/bbspeedlogger'' >> ~/.zshrc
#printf '\n\n alias lognow='/usr/local/bin/bbspeedlogger'' >> ~/.zshrc

printf '\n\n Done installing dependencies...type "lognow" to log your broadband speed\n\n'



