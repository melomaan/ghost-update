#!/bin/bash
# Üllar Seerme
# Script updates Ghost blogging platform to latest version.

read -p "Enter the full path of the Ghost installation: " DIRECTORY
if [ ! -d "$DIRECTORY" ]; then
	echo "Path does not exist"
	exit 1
fi

read -p "Do you want a backup to be created via tar from $DIRECTORY? (y/n): " ANS
if [ $ANS == "n" ]; then
	echo "Continuing without backup"
elif [ $ANS == "y" ]; then
	DATE=$(date +%Y-%m-%d)
	tar -cvf ghost-$DATE.tar.gz $DIRECTORY > /dev/null
	echo "Created backup named ghost-$DATE.tar.gz"
else
	echo "Enter either "y" or "n""
	exit 1
fi

wget -q http://ghost.org/zip/ghost-latest.zip
echo "Downloaded latest version to $(pwd)"

rm -rf ${DIRECTORY}core/ > /dev/null
echo "Deleted core/ from $DIRECTORY to prepare for update"

unzip -uo ghost-latest.zip -d $DIRECTORY > /dev/null
echo "Installed latest version of Ghost to $DIRECTORY"

cd $DIRECTORY && npm install --production > /dev/null && cd .. > /dev/null
echo "Installed new dependencies for Node.JS"

pm2 restart ghost > /dev/null
echo "Restarted Ghost. Refresh your browser"