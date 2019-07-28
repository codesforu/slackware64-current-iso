#!/bin/bash
#
# Shell script to build (unofficial) Slackware-current ISOs
# 
# Lars Strand - larstra (at) ifi uio no
#
# Last update: Sun Nov 10 20:49:57 CET 2013
#

DATE=`date +"%d_%b_%Y"`
MD5SUM="/usr/bin/md5sum"

CURRENT="slackware-current-$DATE-DVD.iso"
CURRENT64="slackware64-current-$DATE-DVD.iso"

LOC_CURRENT="/usit/ftp1/ftp/slackware/slackware-current"
LOC_CURRENT64="/usit/ftp1/ftp/slackware/slackware64-current"

DUMP="/usit/ftp1/ftp/slackware/slackware-iso/slackware-current-iso"
MKISOFS="/usr/bin/mkisofs"

# remove the old build
rm -rf $DUMP/*

# build DVD CURRENT ISO
cd $LOC_CURRENT/

$MKISOFS -o $DUMP/$CURRENT \
-R -J -V "Slackware-current DVD" \
-x ./source \
-hide-rr-moved \
-v -d -N -no-emul-boot -boot-load-size 4 -boot-info-table \
-sort isolinux/iso.sort \
-b isolinux/isolinux.bin \
-c isolinux/isolinux.boot \
-p "Slackware-current build from slackware.no - NOT OFFICIAL" \
-publisher "Slackware-current build from slackware.no - NOT OFFICIAL" \
-A "Slackware-current DVD - build $DATE" .

# build DVD CURRENT 64 ISO
cd $LOC_CURRENT64/

$MKISOFS -o $DUMP/$CURRENT64 \
-R -J -V "Slackware64-current DVD" \
-x ./source \
-hide-rr-moved \
-v -d -N -no-emul-boot -boot-load-size 4 -boot-info-table \
-sort isolinux/iso.sort \
-b isolinux/isolinux.bin \
-c isolinux/isolinux.boot \
-p "Slackware64-current build from slackware.no - NOT OFFICIAL" \
-publisher "Slackware64-current build from slackware.no - NOT OFFICIAL" \
-A "Slackware64-current DVD - build $DATE" .

# jump to right build location
cd $DUMP

# copy the Changelog, so folks know what's included
cp -l $LOC_CURRENT/ChangeLog.txt ChangeLog-current.txt
cp -l $LOC_CURRENT64/ChangeLog.txt ChangeLog64-current.txt

# make MD5 sums of the ISOs
$MD5SUM $CURRENT > CHECKSUMS.md5
$MD5SUM $CURRENT64 >> CHECKSUMS.md5

# bump warning
echo "** WARNING! **
This is experimental current ISO builds. They are NOT official,
so use at your own risk! 
If you have any comments/suggestions/error-reports regarding these ISOs, 
let me know so I can improve the build-script! You'll find the script
at: http://www.slackware.no/makeSlackISOs.sh
New build every Tuesday at 0500 CET/CEST
Enjoy!
larstra (at) ifi uio no
" > README.TXT

# end
