#!/usr/bin/env python

"""
Get random image from dilbert.com
"""

import urllib, datetime, sys, re
import bs4
import requests
import shutil
import os
import urllib.request
import datetime
import random

rint = random.randint(1, 400) 
base = datetime.datetime.today()
random_date = base - datetime.timedelta(days=rint)
random_date = random_date.strftime('%Y-%m-%d')
try:
    os.remove("dilbert_comic")
except FileNotFoundError:
    pass

url = 'https://dilbert.com/strip/' + random_date

fp = urllib.request.urlopen(url)
mybytes = fp.read()
mystr = mybytes.decode("utf8")
fp.close()

soup = bs4.BeautifulSoup(mystr, "html.parser")

# this will return src attrib from img tag that is inside 'a' tag
for a in soup.find_all('a'):
    if a.img:
        if "//assets.amuniversal" in a.img['src']:
            # construct a url
            img_url = "https:" + a.img['src']
#            print(img_url)
            r = requests.get(img_url, stream=True)
            if r.status_code == 200:
                with open("dilbert_comic", 'wb') as f:
                    for chunk in r.iter_content(1024):
                        f.write(chunk)
