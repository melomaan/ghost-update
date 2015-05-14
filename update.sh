#!/bin/bash
# Üllar Seerme
# Script updates Ghost blogging platform to latest version.

# Since the URL below actually redirects to the page with the latest version
# number in the URL, using curl and egrep shows just the necessary version.
ACT=$(curl -s https://github.com/TryGhost/Ghost/releases/latest | egrep -o '[0-9]+.[0-9]+.[0-9]+')
echo "Latest version of Ghost is: $ACT"

while true; do
	read -p "Proceed with update? (y/n): " VER
	# In the following loops I use ${ARG,,} notation where "ARG" is indicative
	# of the answer read in by the prompt and ",," performs a lower-case
	# conversion
	if [ ${VER,,} == "n" ]; then
		echo "Exiting script"
		exit 0
	elif [ ${VER,,} == "y" ]; then
		echo "Continuing with version $ACT"
		break
	else
		echo "Enter either "y" or "n"!"
	fi
done

while true; do
	read -p "Enter the full path of the Ghost installation directory: " DIRECTORY
	if [ -d $DIRECTORY ]; then
		break
	else
		echo "Path does not exist. Try again"
	fi
done

while true; do
	read -p "Do you want a backup to be created from $DIRECTORY? (y/n): " BK
	if [ ${BK,,} == "n" ]; then
		echo "Continuing without backup"
		break
	elif [ ${BK,,} == "y" ]; then
		DATE=$(date +%Y-%m-%d)
		tar -C $DIRECTORY -zcvf ghost-backup-$DATE.tar.gz . > /dev/null
		echo "Created backup named ghost-backup-$DATE.tar.gz at $(pwd)"
		break
	else
		echo "Enter either "y" or "n"!"
	fi
done

if [ ! -f "Ghost-$ACT.zip" ]; then
	wget -q https://github.com/TryGhost/Ghost/releases/download/${ACT}/Ghost-${ACT}.zip
	echo "Downloaded latest version to $(pwd)"
else
	while true; do
		read -p "File Ghost-$ACT.zip already exists. Download again? (y/n): " DL
		if [ ${DL,,} == "n" ]; then
			echo "Continuing with current Ghost-$ACT.zip file"
			break
		elif [ ${DL,,} == "y" ]; then
			# Overwrite current .zip file
			wget -Nq https://github.com/TryGhost/Ghost/releases/download/${ACT}/Ghost-${ACT}.zip
			echo "Downloaded latest version to $(pwd)"
			break
		else
			echo "Enter either "y" or "n"!"
		fi
	done
fi

rm -rf ${DIRECTORY}core/ > /dev/null
echo "Deleted core/ from $DIRECTORY to prepare for update"

unzip -uo Ghost-$ACT.zip -d $DIRECTORY > /dev/null
echo "Installed latest version of Ghost to $DIRECTORY"

cd $DIRECTORY && npm install --production > /dev/null && cd - > /dev/null
echo "Installed new dependencies for Node.JS"

pm2 restart ghost > /dev/null
echo "Restarted Ghost. Refresh your browser"

if [ -f "Ghost-$ACT.zip" ]; then
	while true; do
		read -p "Do you want to clean up downloaded Ghost-$ACT.zip? (y/n): " CLN
		if [ ${CLN,,} = "n" ]; then
			break
		elif [ ${CLN,,} == "y" ]; then
			rm -f Ghost-$ACT.zip
			echo "Deleted Ghost-$ACT.zip from $(pwd)"
			break
		else
			echo "Enter either "y" or "n"!"
		fi
	done
fi

# Executes only if user opted for a backup at the start
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
			echo "Enter either "y" or "n"!"
		fi
	done
fi