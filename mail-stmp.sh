#!/bin/sh

# Desc:shell script for sending mail with mail command through STMP
# Author:by Jason.z
# Mail:ccnuzxg@gmail.com
# Date:2014-04-01


from="sender@example.com"
to="reciever@example.com"
subject="Your email title"
body="This is body content of your email"
declare -a attachments
attachments=( "a.pdf" "b.zip" )


smtpserver="10.10.10.10"
smtpport="443"
$user="test"
$password="123456"

mail -s "$subject" -r "$from" -S smtp="smtp://${smtpserver}:${smtpport}" \
                              -S smtp-auth=login \
                              -S smtp-auth-user="$user" \
                              -S smtp-auth-password="$password" \
                              -S sendwait \
                              "${attargs[@]}" "$to" <<< "$body"