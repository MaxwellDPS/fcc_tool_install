
#!/bin/bash
BASEDIR=$PWD
DIR=$BASEDIR"/fcc"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Installing php"
apt install php -y
echo "Git fcc tool"
git clone https://github.com/FCC/mmba_JSON_bulkimporter.git
mv mmba_JSON_bulkimporter fcc
sed -i 's|DEFINE."BASE_PATH",".*".;|DEFINE\("BASE_PATH","'"$DIR"'"\);|g' fcc/functions.php
sudo chmod -R 777 fcc
rm fcc/data/*
