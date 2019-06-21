slackware64-current-iso
======

No bullshit
--------
Link to download the latest release:  
[RELEASE: 20190619-4.19.52](https://github.com/codesforu/slackware64-current-iso/releases/tag/20190619-4.19.52)

Overview
--------
This repository  **irrgularly** updates and releases ISO installation image for  slackware64-current branch. Although this branch is not tagged stable, it is stable enough to fit general usage.  
If you want me to update it on demand, you can open an issue or sponsor me a with server to make it automatic. The best way is to do it yourself, just read the DIY section below.  
The main reason and purpose for this repository to exist is because the latest Slackware release (14.2) uses an out-dated Linux kernel (4.4.14) which can hardly boot on new Intel CPUs (since 7th or 8th, not sure for which generation exactly), and I want to install Slackware on a computer with an 8th Intel CPU while Slackware has a current branch following stable new Linux kernel without official installation ISO image.
Created on 21. Jun. 2019.


DIY
--------

To generate the ISO image by yourself,  shell scripts are also released. Original method is provided by Patrick Volkerding, the creator of Slackware. Modification might be needed depending on your host.  Both x86_32 and x86_64 version could be generated with these scripts, and you can try on other releases as well.
