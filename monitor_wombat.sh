#!/bin/bash
SLACK_WEBHOOK_URL=“https://hooks.slack.com/services/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”
# Check if asterisk service is running
if 
systemctl is-active asterisk.service &> /dev/null; 

then
    echo “asterisk service is running.”

else
    curl -X POST -H ‘Content-type: application/json’ --data ‘{“text”:” <@U04JW77DS6DU> <@U04K2662PZ0A> Asterisk Service (Issabel) is down, Restarting Service...“}’ “$SLACK_WEBHOOK_URL”
    sudo service asterisk restart 
