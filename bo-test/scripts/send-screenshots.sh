#!/bin/sh                                                                                                              
set -e

FILES=/var/app/features/errorShots/*.png
KEY=hSvpwxCplFVDQ74MBo19wtA7v3wHaAQl
URL=http://imagebin.ca/upload.php
for f in $FILES
do
  echo "Sending $f file..."
  curl \
    -F "key=$KEY" \
    -F "file=@$f" \
    "$URL"
done
