#!/bin/bash
# Üllar Seerme
# Script updates Ghost blogging platform to latest version.

while true; do
	read -p "Enter the full path of the Ghost installation directory: " DIRECTORY
	if [ -d $DIRECTORY ]; then
		break
	else
		echo "Path does not exist. Try again"
	fi
done

while true; do
	read -p "Do you want a Tar backup to be created from $DIRECTORY? (y/n): " BK
	if [ ${BK,,} == "n" ]; then
		echo "Continuing without backup"
		break
	elif [ ${BK,,} == "y" ]; then
		DATE=$(date +%Y-%m-%d)
		tar -cvf ghost-backup-$DATE.tar.gz $DIRECTORY > /dev/null
		echo "Created backup named ghost-backup-$DATE.tar.gz"
		break
	else
		echo "Enter either "y" or "n""
	fi
done

if [ ! -f "ghost-latest.zip" ]; then
	wget -q http://ghost.org/zip/ghost-latest.zip
	echo "Downloaded latest version to $(pwd)"
else
	while true; do
		read -p "File ghost-latest.zip already exists. Download again? (y/n): " DL
		if [ ${DL,,} == "n" ]; then
			echo "Continuing with current ghost-latest.zip file"
			break
		elif [ ${DL,,} == "y" ]; then
			wget -Nq http://ghost.org/zip/ghost-latest.zip
			echo "Downloaded latest version to $(pwd)"
			break
		else
			echo "Enter either "y" or "n""
		fi
	done
fi

rm -rf ${DIRECTORY}core/ > /dev/null
echo "Deleted core/ from $DIRECTORY to prepare for update"

unzip -uo ghost-latest.zip -d $DIRECTORY > /dev/null
echo "Installed latest version of Ghost to $DIRECTORY"

cd $DIRECTORY && npm install --production > /dev/null && cd .. > /dev/null
echo "Installed new dependencies for Node.JS"

pm2 restart ghost > /dev/null
echo "Restarted Ghost. Refresh your browser"

if [ -f "ghost-latest.zip" ]; then
	while true; do
		read -p "Do you want to clean up downloaded ghost-latest.zip? (y/n): " CLN
		if [ ${CLN,,} = "n" ]; then
			break
		elif [ ${CLN,,} == "y" ]; then
			rm -f ghost-latest.zip
			echo "Deleted ghost-latest.zip from $(pwd)"
			break
		else
			echo "Enter either "y" or "n""
		fi
	done
fi

if [ ${BK,,} == "y" ]; then
	while true; do
		read -p "Do you want to clean up newly created backup ghost-backup-$DATE.tar.gz? (y/n): " CLN
		if [ ${CLN,,} = "n" ]; then
			break
		elif [ ${CLN,,} == "y" ]; then
			rm -f ghost-backup-$DATE.tar.gz
			echo "Deleted ghost-backup-$DATE.tar.gz from $(pwd)"
			break
		else
			echo "Enter either "y" or "n""
		fi
	done
fi