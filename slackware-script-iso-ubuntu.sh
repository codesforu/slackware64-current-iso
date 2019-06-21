#!/bin/sh
#script for usage on ubuntu with ISOLINUX path
xorriso -as mkisofs\
   -iso-level 3\
   -full-iso9660-filenames\
   -R -J -A "Slackware Install"\
   -hide-rr-moved\
   -v -d -N\
   -b isolinux/isolinux.bin\
   -c isolinux/boot.cat\
   -no-emul-boot -boot-load-size 4 -boot-info-table\
   -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin\
   -eltorito-alt-boot\
   -e isolinux/efiboot.img\
   -no-emul-boot -isohybrid-gpt-basdat\
   -m 'source'\
   -volid "SlackDVD"\
   -output /tmp/slackware-dvd.iso \
   .
