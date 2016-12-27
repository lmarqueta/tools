#!/bin/bash 
# Monitors a URL and sends an email if it changes
# Computes web site MD5 and compares with a previously stored one
# Requirement: mutt must be able to send emails :)
# Suggestion: add to cron.daily

# Configure URL and path to save the computed md5
url="http://"        # URL to monitor
md5_path="<path>"    # path to store md5 

# configure mail notification
subject="subject"
rcptto="username@example.com"
msg="Please check ${url}, it has been modified"

# main
md5_file=${md5_path}/.$(echo $url|md5sum|awk '{print $1}')
md5=$(curl -qs $url | md5sum | awk '{print $1}')
if [[ ! -r $md5_file ]]; then
    echo "$md5" > $md5_file
    exit 0
else
    prev=$(cat $md5_file) || exit 1
    echo "$md5" > $md5_file
fi

if [[ "$prev" != "$md5" ]]; then
    echo "$msg" | mutt -s "$subject"  "$rcptto"
fi

