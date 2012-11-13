1) Create an update folder inside you're local git repository

2) Put all global files inside the update folder

3) Git diff
A stands for the SHA from previous release
B stands for the SHA from next release
```
git diff --names-only A..B > update/status
```
4) Edit status file
C - Custom
File isn't installed by default but in other ways
A - Add / M - Modified
Installed with the .deb package
D - Delete
Delete file

5) Run create_data.sh
This file will create the data.tar.gz needed for the .deb

6) Run create_md5.sh
This will create a file called md5sums need for the .deb

7) Create prerm, preinst, postrm, postinst file (see previous examples)
This files will be called to configure the .deb package. If not used, leave them with a "#!/bin/bash" header
File that were labeled with a "C" in the status file, should be edited in these files.
These files are normally files that the user will edit/configure for themselves and which we don't want to overwrite.
This can be patches, file additions, sed replacements etc.

*) Run create paths.sh
A .deb installed requires that all folders are already present before it unpacks the new data
This file will create a if loops for all pre install folder creation, which you can then put in the preinst file.

8) Edit the control file

9) Run create_deb.sh
This will create the final .deb file.

10) Test if it installs, upgrades and can be removed.

*Important* (see previous examples)
- Create informative verbose message
- Create sufficient checks before doing a step
- Don't install files that are part of another package like /boot/kernel, /etc/usbmount/usbmount.conf
- Create a log file in /home/xbian/update.log with the following message:
* Success: A step has succeeded.
* Notice: A step failed, but this isn't really a problem (e.g, a package was already installed, or a patches was already applied)
* Error: A step failed, also breaking the update (e.g., can't install a package, missing files, to heavily modified system)
- Show the log file at the end of the installation so users can ask for help

*Version numbering*
1.0-0.1: Version 1 Alpha 1
1.0-0.2: Version 2 Alpha 2
1.0-1: Version 1 Beta 1
1.0-2: Version 1 Beta 1
1.0: Version 1 Stable
2.0-0.1: Version 2 Alpha 1

An update should be named by the previous version and the version upgrading to.
The upgrade from XBian 1.0 Alpha 1 to XBian 1 Alpha 2 is called: 1.0-0.1-1.0-0.2