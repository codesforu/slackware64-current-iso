#!/bin/sh
#  rsync://mirrors.kernel.org/slackware/ (US) 
#  rsync://mirror.slackbuilds.org/slackware/ (US) 
#  rsync://slackware.cs.utah.edu/slackware/ (US) 
#  rsync://rsync.lug.udel.edu/slackware/ (US) 
#  rsync://slackware.uk/slackware/ (UK) 
   rsync -havP \
       --delete --delete-after \
       --no-o --no-g --safe-links \
       --timeout=60 --contimeout=30 \ 
       #rsync://your-upstream-mirror/slackware/ \
       #/your-toplevel-pub/slackware/
       rsync://your-upstream-mirror/slackware/slackware64-current/ \
       /home/user/slackware/slackware64-current/

