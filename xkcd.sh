#!/bin/bash

RANGE=1500
while true # eternal loop
do
number=$RANDOM # random number from 0 to $RANGE
# a random int within a certain range, useing the 'modulo' operator.
# This returns the remainder of a division operation.
let "number %= $RANGE"
foo="https://xkcd.com/"
url="$foo$number/info.0.json" # stich the url address together
curl $url | grep -Po '(?<=\"img": )(.*?)(?=\,)' > temp.txt 
python xkcd.py 
curl $(python xkcd.py) -o image # get and save image locally
feh -F image &  # show image in full screen mode
sleep 60
kill $!
done
