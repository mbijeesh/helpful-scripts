#=============== Ping Fail Alert
# This script is to check the ping status 

#Host names
HOST1="IP1"
HOST2="IP2"
HOST3="IP3"

# No ping request
COUNT=10

# Email Details
SUBJECT=" Ping Failed for  server"
EMAILID="email1 email2 "
for myHost in $HOST1 $HOST2 $HOST3
do
  count=$(ping -c $COUNT $myHost | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
#if [ ! -z "$count" ] ; then
if [ "$count" -eq 0 ] ; then
# 100% failed
echo "Host : $myHost is down (ping failed) at $(date)" | mail -s "$myHost - $SUBJECT" $EMAILID
  fi
done

