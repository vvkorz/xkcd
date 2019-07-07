#!/bin/bash

# If you need a random int within a certain range, use the 'modulo' operator.
# This returns the remainder of a division operation.

RANGE=1500
#while true; do
for item in 1 2 3 4 5
do
number=$RANDOM # random image id
let "number %= $RANGE"
foo="https://xkcd.com/"
url="$foo$number/info.0.json"
echo $url
curl $url | grep -Po '(?<=\"img": )(.*?)(?=\,)' > temp.txt 
python xkcd.py
curl $(python xkcd.py) -o image 
feh -F image &
sleep 5
kill $!
done
