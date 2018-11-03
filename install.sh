#!/bin/bash
BASEDIR=$PWD
DIR=$BASEDIR"/fcc"
currentuser=$(who | awk '{print $1}')}

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

apt install php -y

git clone https://github.com/FCC/mmba_JSON_bulkimporter.git

mv mmba_JSON_bulkimporter fcc

sed -i 's|DEFINE."BASE_PATH",".*".;|DEFINE\("BASE_PATH","'"$DIR"'"\);|g' fcc/functions.php
chown -R $currentuser:$currentuser fcc
rm fcc/data/*

