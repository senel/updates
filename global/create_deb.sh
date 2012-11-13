#!/bin/bash
./create_control.sh
rm xbian-update1.0-0.1-1.0-0.2.deb
ar -r xbian-update1.0-0.1-1.0-0.2.deb debian-binary control.tar.gz data.tar.gz