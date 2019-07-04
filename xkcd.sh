#!/bin/bash
curl https://xkcd.com/1/info.0.json | grep -Po '(?<=\"img": )(.*?)(?=\,)' > temp.txt 
python xkcd.py
curl $(python xkcd.py) -o image 
firefox image
