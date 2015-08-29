# bbspeedlogger
log your broadband speed as regularly as you wish

speedtest-cli works with Python 2.4-3.4

#Installation

pip / easy_install

pip install speedtest-cli
or

easy_install speedtest-cli
Github

pip install git+https://github.com/sivel/speedtest-cli.git
or

git clone https://github.com/sivel/speedtest-cli.git
python speedtest-cli/setup.py install
Just download (Like the way it used to be)

wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest_cli.py
chmod +x speedtest-cli
or

curl -Lo speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest_cli.py
chmod +x speedtest-cli

to create a shortcut add the following line to .bashrc/.zshrc
alias lognow='sh ~/path_to_bblogger/log_now.sh >> ~/path_to_log_file'
