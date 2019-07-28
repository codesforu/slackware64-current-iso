#!/bin/sh
# $Id: create_miniiso.sh,v 1.10 2009/08/13 10:59:14 root Exp root $
# -------------------------------------------------------------------------
# Purpose:
#   Create mini ISO image for installing Slackware ('mini' meaning: not
#   containing any Slackware package. Some people want to use a creditcard
#   sized CD for their installs.
# Needed:
#   The 'isolinux' and 'kernels' directories from the Slackware tree.
# Author:
#   Eric Hameleers <alien@slackware.com> 21-sep-2006
# -------------------------------------------------------------------------

# Set this to the Slackware release you want to create this mini iso for:
RELEASE=${RELEASE:-"current"}

# If you create an iso for slackware64, then set the value of ARCH=x86_64
ARCH=${ARCH:-"i486"}
[ "$ARCH" = "x86_64" ] && PKGMAIN="slackware64" || PKGMAIN="slackware"

# This is where the Slackware directory is (can not be a mounted DVD because
# the file ./isolinux/isolinux.bin must be writable!
SLACKROOT=${SLACKROOT:-"/home/ftp/pub/Linux/Slackware/${PKGMAIN}-${RELEASE}"}

# The 'staging' area is where the ISO file is created:
STAGING=${STAGING:-"/tmp/slackboot"}

# ----------------------------------------------------------------------

BUILDER="Alien <alien@slackware.com>"
DATE=`date +"%d_%b_%Y"`

# Do not tolerate sloppy scripting:
set -u
set -e
trap 'echo "*** $0 FAILED on line $LINENO! ***"' ERR

# Delete any existing output files from a previous run:
rm -f ${STAGING}/slackware{,_${ARCH}}-${RELEASE}-mini-install.iso*

if [ ! -d $SLACKROOT ]; then
  echo "*** I can't find the Slackware package tree $SLACKROOT!"
  exit 1
fi

# STAGING is where we will do all our work:
[ ! -d ${STAGING} ] && ( mkdir -p $STAGING || ( echo "*** Could not create directory ${STAGING}!"; exit 1 ) )

# OK... work starts here:

# Isolinux seems to touch isolinux.bin (and SLACKROOT could be readonly):
# mkisofs refuses absolute pathnames to isolinux.bin:
cd ${SLACKROOT}
mkisofs -o ${STAGING}/slackware_${ARCH}-${RELEASE}-mini-install.iso \
    -R -J -V "Slackware Mini Install" \
    -hide-rr-moved -hide-joliet-trans-tbl \
    -v -d -N -no-emul-boot -boot-load-size 4 -boot-info-table \
    -x ./extra \
    -x ./slackboot \
    -x ./slackware64/kde \
    -x ./slackware64/kdei \
    -x ./slackware64/tcl \
    -x ./slackware64/x \
    -x ./slackware64/xap \
    -x ./slackware64/xfce \
    -x ./slackware64/y \
    -b isolinux/isolinux.bin \
    -c isolinux/isolinux.boot \
    -sort isolinux/iso.sort \
    -preparer "Slackware-${RELEASE} build by ${BUILDER}" \
    -publisher "The Slackware Linux Project - http://www.slackware.com/" \
    -A "Slackware-${RELEASE} for ${ARCH} Mini Install CD - build $DATE" \
    .

cd ${STAGING}
md5sum slackware_${ARCH}-${RELEASE}-mini-install.iso > slackware_${ARCH}-${RELEASE}-mini-install.iso.md5
cd -

echo ""
echo "------------------------------------------------------------------------"
echo "The new slackware_${ARCH}-${RELEASE}-mini-install.iso file is:"
echo "    '${STAGING}/slackware_${ARCH}-${RELEASE}-mini-install.iso'"
echo "------------------------------------------------------------------------"
echo ""

