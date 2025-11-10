#!/bin/bash

set -ouex pipefail

sed -i 's/^#AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
sed -i 's/^#LockLayering=false/LockLayering=true/' /etc/rpm-ostreed.conf