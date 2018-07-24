if [ $# -ne 1 ]
then
  echo "usage: $0 <id>"
  exit 1
fi
mkdir -p /var/log/sunrise
echo "create rsyslogd config file for $1"
sudo bash -c  "echo -e ':syslogtag,isequal,\"$1:\" /var/log/sunrise/$1.log\n& stop' > /etc/rsyslog.d/00-sunrise-$1.conf"
echo "reload rsyslogd"
sudo /etc/init.d/rsyslog force-reload
echo "start app with $1 id"
./rlog-test $1
