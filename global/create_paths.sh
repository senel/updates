#!/bin/bash
cat status | grep ^M | awk '{print $2}' | sed 's,/*[^/]\+/*$,,' > paths
cat status | grep ^A | awk '{print $2}' | sed 's,/*[^/]\+/*$,,' >> paths
awk '!x[$0]++' paths > paths.new
rm paths;
while read p; do
  echo -e "\tif [ ! -d /$p ]; then\n\t\tmkdir -p /$p;\n\tfi\n" >> paths
done < paths.new
rm paths.new
