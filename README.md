slackware64-current-iso
======

**NO BULLSHIT, TAKE ME THERE!**  
Link to download the latest release:  
[RELEASE: 20190619-4.19.52](https://github.com/codesforu/slackware64-current-iso/releases/tag/20190619-4.19.52)

Overview
--------
This repository  **irrgularly** updates and releases ISO installation image for  slackware64-current branch. Although this branch is not tagged stable, it is stable enough to fit general usage.  
Since the main-stream hardware is already x86_64, the main focus will be on slackware64-current. If you want me to update it on demand or you need a x86_32 version, you can open an issue or sponsor me with a server so that I can make it automatic, as well as providing another mirror for Slackware. The best way is to do it yourself, just read the DIY section below.  
The main reason and purpose for this repository to exist is because the latest Slackware release (14.2) uses an out-dated Linux kernel (4.4.14) which can hardly boot on new Intel CPUs (since 7th or 8th, not sure for which generation exactly), and I want to install Slackware on a computer with an 8th Intel CPU while Slackware has a current branch following stable new Linux kernel without official installation ISO image.  
Repo created on 21. Jun. 2019.


Release
--------
**[Link to RELEASEs](https://github.com/codesforu/slackware64-current-iso/releases)**  
The rest of this section mainly describes the naming of the released ISO image.  

Normally it will look like this:  

> slackware64-current-yyyymmdd-x.y.z-install-dvd.iso  

where "yyyymmdd" represents the date of generating, and "x.y.z" represents the version of Linux kernel.  

And there will also be a checksum file:  

> slackware64-current-yyyymmdd-x.y.z-install-dvd.iso.md5  

which contains the MD5 checksum of the generated ISO image.  

Since github has a limit of 2GB for a single file in a release, and the size of a regular ISO installation image since Slackware 14.2 is around 3GB, the install iso is archived and splited into the size of a CD (700MB) in zip format.

DIY
--------

To generate the ISO image by yourself,  shell scripts are also released. Original method is provided by Patrick Volkerding, the creator of Slackware. Modification might be needed depending on your host.  Both x86_32 and x86_64 version could be generated with these scripts, and you can try on other releases as well.
