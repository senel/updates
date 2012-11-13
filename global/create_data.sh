#!/bin/bash
#rm update1_0a1-1_0a2.tar
#cat status | grep ^D | awk '{print "if [ -f $2 ]; then rm $2; else  echo Failed: $2 does not exists >> update.log; fi}' > remove.sh
#cat status | grep ^C | awk '{print $2}'

#Create tarball
rm data.tar.gz
cat status | grep ^M | awk '{print "../"$2}' | xargs tar cvf data.tar
cat status | grep ^A | awk '{print "../"$2}' | xargs tar rvf data.tar
gzip -9 data.tar