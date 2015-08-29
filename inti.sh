#!/bin/bash
USER=$(whoami)
BBLOGGER_PATH="/Users/$USER/bblogger"

#add alias for bblogger in your zshrc
printf 'alias lognow=/Users/$USER/bblogger/.log_now"' >> ~/.zshrc

#Install dependencies
pip install speedtest-cli 
brew install terminal-notifier

printf 'Done installing dependencies...Logging speed now'
sh log_now.sh


