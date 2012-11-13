#!/bin/bash
#Generate md5 checksums
cat status | grep ^M | awk '{print "../../"$2}' | xargs md5sum > md5sums
cat status | grep ^A | awk '{print "../../"$2}' | xargs md5sum >> md5sums
sed -i 's/..\/..\///g' md5sums;