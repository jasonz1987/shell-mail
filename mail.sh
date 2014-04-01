#!/bin/sh

# Desc:shell script for sending mail with mail command
# Author:by Jason.z
# Mail:ccnuzxg@gmail.com
# Date:2014-04-01


from="sender@example.com"
to="reciever@example.com"
subject="Your email title"
body="This is body content of your email"
declare -a attachments
attachments=( "a.pdf" "b.zip" )

declare -a attargs
for att in "${attachments[@]}"; do
  attargs+=( "-a"  "$att" )
done

mail -s "$subject" -r "$from" "${attargs[@]}" "$to" <<< "$body"