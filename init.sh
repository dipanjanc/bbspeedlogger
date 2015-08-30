#!/bin/bash
USER=$(whoami)
BBLOGGER_PATH="/Users/$USER/bbspeedlogger"

#Install dependencies
pip install speedtest-cli 
brew install terminal-notifier

printf '\n\n creating symlink in usr/local/bin'

sudo ln -s $BBLOGGER_PATH/log_now.sh /usr/local/bin/bbspeedlogger

#add alias for bblogger in your zshrc

printf '\n\n alias lognow='/usr/local/bin/bbspeedlogger'' >> ~/.zshrc

printf '\n\n type lognow to log your broadband speed'

printf '\n\n Done installing dependencies...Logging speed now'
sh log_now.sh


