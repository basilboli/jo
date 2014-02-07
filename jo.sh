#!/bin/sh
# Checking medals for the French Team during Olimpic Games in Sotchi!

# Calling kimono REST and parsing it with jq
curl -XGET "http://www.kimonolabs.com/api/bt87amte?apikey=1958af648abda5f435ac666899dbdc21" | jq '.results.collection1[0].medals_total' > now

before_no=`cat before`
now_no=`cat now`
echo "Before: "$before_no
echo "Now: " $now_no

# if number of medals have change notify 
if [ "$now_no" != "$before_no" ]; then

echo 'New medal!!!'
echo $now_no > before
echo 'Notifying karotz ....'
#php -f /home/runner/tools/karotz/karotz.php TEXT "Congratulations! New medal for France!"

fi;
