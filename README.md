# -Asterisk-scripts
# Slack alert for wombat/issabel server

#!/bin/bash
echo “------------------------------”
echo `date`
RESPONSE=response.txt
status=$(curl -XGET http://voice.getcarbon.co:8080/wombat/WombatItDials.jsp?#LOGOFF -m 5 -s -w %{http_code} $1 -o $RESPONSE)
echo $status
if [ $status != ‘200’ ]
then
    echo  ‘Cannot connect to dialer services: Attempting to restart the server’
    curl --insecure -X POST -H ‘Content-type: application/json’ --data ‘{“text”:” <@U01666KFTJ4> <@U04JW1DS6DU>  wombat dialer is down, restarting the server...“}’ https://hooks.slack.com/services/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
else
    echo “Dialer is UP”
fi 

---------------------
#!/bin/bash
SLACK_WEBHOOK_URL=“https://hooks.slack.com/services/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”
# Check if asterisk service is running
if systemctl is-active asterisk.service &> /dev/null; then
    echo “asterisk service is running.”
else
    curl -X POST -H ‘Content-type: application/json’ --data ‘{“text”:” <@U04JW77DS6DU> <@U04K2662PZ0A> Asterisk Service (Issabel) is down, Restarting Service...“}’ “$SLACK_WEBHOOK_URL”
    sudo service asterisk restart 
