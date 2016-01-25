#!/bin/sh
# https://github.com/robzr/bearDropper
# bearDropper install script - @robzr

if [ -f /etc/init.d/bearDropper ] ; then
  echo Detected previous version of bearDropper - stopping
  /etc/init.d/bearDropper stop
fi
echo -e '\nRetrieving and installing latest version...'
wget -O /etc/init.d/bearDropper http://cdn.rawgit.com/robzr/bearDropper/master/src/init.d/bearDropper 
wget -O /etc/config/bearDropper http://cdn.rawgit.com/robzr/bearDropper/master/src/config/bearDropper
wget -O /usr/sbin/bearDropper http://cdn.rawgit.com/robzr/bearDropper/master/bearDropper
chmod 755 /usr/sbin/bearDropper /etc/init.d/bearDropper
echo -e '\nRunning on historical log data'
/usr/sbin/bearDropper -m entire -f stdout
echo -e '\nStarting background process'
/etc/init.d/bearDropper enable
/etc/init.d/bearDropper start