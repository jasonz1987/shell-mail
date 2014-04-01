#!/bin/sh

# Desc:shell script for sending mail with mail command through STMP
# Author:by Jason.z
# Mail:ccnuzxg@gmail.com
# Date:2014-04-01

# must be same with STMP account addr
from="sender@example.com"
# more receiver like a@example.com b@example.com ...
to="reciever@example.com"
subject="Your email title"
#you can also read content from the file just use $(cat yourfile)
body="This is body content of your email"

declare -a attachments
attachments=( "a.pdf" "b.zip" )

#deal with attachment args
declare -a attargs
for att in "${attachments[@]}"; do
   [ ! -f "$att" ] && echo "Warning: attachment $att not found, skipping" >&2 && continue	
  attargs+=( "-a"  "$att" )
done

# smtp server info
smtpserver="smtp.example.com"
smtpport="25"
user="sender"
password="123456"

mail -s "$subject" -r "$from" -S smtp="smtp://${smtpserver}:${smtpport}" \
                              -S smtp-auth=login \
                              -S smtp-auth-user="$user" \
                              -S smtp-auth-password="$password" \
                              -S sendwait \
                              "${attargs[@]}" "$to" <<< "$body"