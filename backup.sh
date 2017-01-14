#!/bin/bash

dest=/media/backup
# Be careful if using --delete
# options="--delete --ignore-errors"
options="--ignore-errors"
log="/var/log/backup.$(date +%w).log"

# Start
echo "*** $(date +'%F %T') - Backup start ***" >>$log

# Music
if [ -d /media/data/Music -a -d ${dest}/Music ]; then
	rsync -av $options /media/data/Music/ ${dest}/Music >>$log 2>&1
else
	echo "Music destination directory not found" >>$log 2>&1
fi

# Videos
if [ -d /media/data/Videos -a -d ${dest}/Videos ]; then
	rsync -av $options /media/data/Videos/ ${dest}/Videos >>$log 2>&1
else
	echo "Video destination directory not found" >>$log 2>&1
fi

# End
echo "*** $(date +'%F %T') - End of backup ***" >>$log
echo "===========================================" >>$log
