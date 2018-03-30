#!/bin/bash

SYSDIR=$1
if [ "x$SYSDIR" = "x" ]; then
echo "You must specify system directory as first argument";
exit
fi

VENDOR=openstone
DEVICE=stonexone

BASE=../../../vendor/$VENDOR/$DEVICE
sudo chmod -R 755 "$BASE"
#rm -rf $BASE/*
rm 2>/dev/null missingfiles.txt

for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    #if [ ! -e "$BASE/$FILE" ] ; then
     if [ -e "$SYSDIR/$FILE" ] ; then
      sudo cp $SYSDIR/$FILE $BASE/$FILE
      sudo chmod 777 $BASE/$FILE
     else
      #sed -i "s|$FILE|#$FILE|g" proprietary-blobs.txt
      echo "missing $FILE " >>missingfiles.txt
     fi
    #fi
done

#./setup-makefiles.sh
