#!/bin/bash
# minecraft server update script

# root safety check
if [ $(id -u) = 0 ]; then
	echo "$(tput bold)$(tput setaf 1)please do not run me as root :( - this is dangerous!$(tput sgr0)"
	exit 1
fi

# read server.functions file with error checking
if [[ -f "server.functions" ]]; then
	. ./server.functions
else
	echo "$(date) fatal: server.functions is missing" >> fatalerror.log
	echo "fatal: server.functions is missing"
	exit 1
fi

# read server.properties file with error checking
if ! [[ -f "server.properties" ]]; then
	echo "$(date) fatal: server.properties is missing" >> fatalerror.log
	echo "fatal: server.properties is missing"
	exit 1
fi

# read server.settings file with error checking
if [[ -f "server.settings" ]]; then
	. ./server.settings
else
	echo "$(date) fatal: server.settings is missing" >> fatalerror.log
	echo "fatal: server.settings is missing"
	exit 1
fi

# change to server directory with error checking
if [ -d "${serverdirectory}" ]; then
	cd ${serverdirectory}
else
	echo "$(date) fatal: serverdirectory is missing" >> fatalerror.log
	echo "fatal: serverdirectory is missing"
	exit 1
fi

# parsing script arguments
ParseScriptArguments "$@"

# write date to logfile
echo "${date} executing update script" >> ${screenlog}

# check if server is running
if ! screen -list | grep -q "\.${servername}"; then

	# remove all older safety backups
	if [[ -s "${backupdirectory}/cached/update-"* ]]; then
		rm ${backupdirectory}/cached/update-*
	fi

	# create backup
	CheckVerbose "${blue}backing up...${nocolor}"
	tar -czf world.tar.gz world && mv ${serverdirectory}/world.tar.gz ${backupdirectory}/cached/update-${newdaily}.tar.gz

	# check if safety backup exists
	if ! [[ -s "${backupdirectory}/cached/update-${newdaily}.tar.gz" ]]; then
		echo "${red}warning: safety backup failed - proceeding to server update${nocolor}"
		echo "warning: safety backup failed - proceeding to server update" >> ${screenlog}
	else
		echo "created ${backupdirectory}/cached/update-${newdaily}.tar.gz as a safety backup" >> ${backuplog}
		echo "" >> ${backuplog}
	fi

	# Test internet connectivity and update on success
	wget --spider --quiet https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
	if [ "$?" != 0 ]; then
		echo "${red}Warning: Unable to connect to Mojang API. Skipping update...${nocolor}"
		echo "Warning: Unable to connect to Mojang API. Skipping update..." >> ${screenlog}
	else
		CheckQuiet "${green}downloading newest server version...${nocolor}"
		echo "downloading newest server version..." >> ${screenlog}
		# check if already on newest version
		if [[ "${serverfile}" = *"minecraft-server.1.16.5.jar" ]]; then
			CheckVerbose "You are running the newest server version - skipping update"
			echo "You are running the newest server version - skipping update" >> ${screenlog}
		else
			wget -q -O minecraft-server.1.16.5.jar https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
			# update serverfile variable in server.settings
			newserverfile="${serverdirectory}/minecraft-server.1.16.5.jar"
			# if new serverfile exists remove oldserverfile
			if [ -f "${newserverfile}" ]; then
				CheckVerbose "${green}Success: updating server.settings for startup with new server version 1.16.5${nocolor}"
				sed -i "s|${serverfile}|${newserverfile}|g" server.settings
				# remove old serverfile if it exists
				if [ -f "${serverfile}" ]; then
					rm ${serverfile}
				fi
			else
				echo "${yellow}Warning: could not remove old serverfile ${serverfile} because new serverfile ${newserverfile} is missing${nocolor}"
				echo "Server will startup with old serverfile ${serverfile}"
			fi
		fi
	fi

	# user info

	# user info about download
	CheckVerbose "removing scripts in serverdirectory... "

	# remove scripts from serverdirectory
	# declare all scripts in an array
	declare -a scripts=( "LICENSE" "README.md" "start.sh" "restore.sh" "reset.sh" "restart.sh" "stop.sh" "backup.sh" "update.sh" "maintenance.sh" "prerender.sh" "watchdog.sh" "welcome.sh" "vent.sh" )
	# get length of script array
	scriptslength=${#scripts[@]}
	# loop through all entries in the array
	for (( i = 1; i < ${scriptslength} + 1; i ++ )); do
		CheckVerbose "Removing script ${1}"
		rm "${scripts[${i}-1]}"
	done

	# user info about download
	CheckVerbose "downloading scripts from GitHub... "

	# downloading scripts from github
	# declare all scripts in an array
	declare -a scripts=( "LICENSE" "README.md" "start.sh" "restore.sh" "reset.sh" "restart.sh" "stop.sh" "backup.sh" "update.sh" "maintenance.sh" "prerender.sh" "watchdog.sh" "welcome.sh" "vent.sh" )
	# get length of script array
	scriptslength=${#scripts[@]}
	# loop through all entries in the array
	for (( i = 1; i < ${scriptslength} + 1; i ++ )); do
		FetchScriptFromGitHub "${scripts[${i}-1]}"
	done

	# user info
	CheckVerbose "download successful"

	# make selected scripts executable
	# declare all scripts in an array
	declare -a scripts=( "start.sh" "restore.sh" "reset.sh" "restart.sh" "stop.sh" "backup.sh" "update.sh" "maintenance.sh" "prerender.sh" "watchdog.sh" "welcome.sh" "vent.sh" )
	# get length of script array
	scriptslength=${#scripts[@]}
	# loop through all entries in the array
	for (( i = 1; i < ${scriptslength} + 1; i ++ )); do
		CheckVerbose "Setting script ${1} executable"
		chmod +x ${scripts[${i}-1]}
	done

	# store serverdirectory
	serverdirectory=`pwd`

	# restart the server
	CheckQuiet "${cyan}restarting server...${nocolor}"
	./start.sh "$@"

	# restart the server
	CheckQuiet "${green}restarting server...${nocolor}"
	./start.sh "$@"
	exit 0
fi

# check if immediatly is specified
if ! [[ ${immediatly} == true ]]; then
	# countdown
	counter="60"
	while [ ${counter} -gt 0 ]; do
		if [[ "${counter}" =~ ^(60|40|20|10|5|4|3|2|1)$ ]];then
			CheckQuiet "${blue}[Script]${nocolor} server is updating in ${counter} seconds"
			screen -Rd ${servername} -X stuff "tellraw @a [\"\",{\"text\":\"[Script] \",\"color\":\"blue\"},{\"text\":\"server is updating in ${counter} seconds\"}]$(printf '\r')"
		fi
		counter=$((counter-1))
		sleep 1s
	done
fi

# server stop
CheckQuiet "stopping server..."
PrintToScreen "say stopping server..."
PrintToScreen "stop"

# check if server stopped
stopchecks="0"
while [ $stopchecks -lt 30 ]; do
	if ! screen -list | grep -q "\.${servername}"; then
		break
	fi
	stopchecks=$((stopchecks+1))
	sleep 1;
done

# force quit server if not stopped
if screen -list | grep -q "${servername}"; then
		echo "${yellow}minecraft server still hasn't closed after 30 seconds, closing screen manually${nocolor}"
		screen -S ${servername} -X quit
fi

# remove all older safety backups
if [[ -s "${backupdirectory}/cached/update-"* ]]; then
	rm ${backupdirectory}/cached/update-*
fi

# create backup
CheckVerbose "${blue}backing up...${nocolor}"
tar -czf world.tar.gz world && mv ${serverdirectory}/world.tar.gz ${backupdirectory}/cached/update-${newdaily}.tar.gz

# check if safety backup exists
if ! [[ -s "${backupdirectory}/cached/update-${newdaily}.tar.gz" ]]; then
	echo "${red}warning: safety backup failed - proceeding to server update${nocolor}"
	echo "warning: safety backup failed - proceeding to server update" >> ${screenlog}
else
	echo "created ${backupdirectory}/cached/update-${newdaily}.tar.gz as a safety backup" >> ${backuplog}
	echo "" >> ${backuplog}
fi

# Test internet connectivity and update on success
wget --spider --quiet https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
if [ "$?" != 0 ]; then
	echo "${red}Warning: Unable to connect to Mojang API. Skipping update...${nocolor}"
	echo "Warning: Unable to connect to Mojang API. Skipping update..." >> ${screenlog}
else
	CheckQuiet "${green}downloading newest server version...${nocolor}"
	echo "downloading newest server version..." >> ${screenlog}
	# check if already on newest version
	if [[ "${serverfile}" = *"minecraft-server.1.16.5.jar" ]]; then
		CheckVerbose "You are running the newest server version - skipping update"
		echo "You are running the newest server version - skipping update" >> ${screenlog}
	else
		wget -q -O minecraft-server.1.16.5.jar https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
		# update serverfile variable in server.settings
		newserverfile="${serverdirectory}/minecraft-server.1.16.5.jar"
		# if new serverfile exists remove oldserverfile
		if [ -f "${newserverfile}" ]; then
			CheckVerbose "${green}Success: updating server.settings for startup with new server version 1.16.5${nocolor}"
			sed -i "s|${serverfile}|${newserverfile}|g" server.settings
			# remove old serverfile if it exists
			if [ -f "${serverfile}" ]; then
				rm ${serverfile}
			fi
		else
			echo "${yellow}Warning: could not remove old serverfile ${serverfile} because new serverfile ${newserverfile} is missing${nocolor}"
			echo "Server will startup with old serverfile ${serverfile}"
		fi
	fi
fi

# user info

# user info about download
CheckVerbose "removing scripts in serverdirectory... "

# remove scripts from serverdirectory
# declare all scripts in an array
declare -a scripts=( "LICENSE" "README.md" "start.sh" "restore.sh" "reset.sh" "restart.sh" "stop.sh" "backup.sh" "update.sh" "maintenance.sh" "prerender.sh" "watchdog.sh" "welcome.sh" "vent.sh" )
# get length of script array
scriptslength=${#scripts[@]}
# loop through all entries in the array
for (( i = 1; i < ${scriptslength} + 1; i ++ )); do
	CheckVerbose "Removing script ${1}"
	rm "${scripts[${i}-1]}"
done

# user info about download
CheckVerbose "downloading scripts from GitHub... "

# downloading scripts from github
# declare all scripts in an array
declare -a scripts=( "LICENSE" "README.md" "start.sh" "restore.sh" "reset.sh" "restart.sh" "stop.sh" "backup.sh" "update.sh" "maintenance.sh" "prerender.sh" "watchdog.sh" "welcome.sh" "vent.sh" )
# get length of script array
scriptslength=${#scripts[@]}
# loop through all entries in the array
for (( i = 1; i < ${scriptslength} + 1; i ++ )); do
	FetchScriptFromGitHub "${scripts[${i}-1]}"
done

# user info
CheckVerbose "download successful"

# make selected scripts executable
# declare all scripts in an array
declare -a scripts=( "start.sh" "restore.sh" "reset.sh" "restart.sh" "stop.sh" "backup.sh" "update.sh" "maintenance.sh" "prerender.sh" "watchdog.sh" "welcome.sh" "vent.sh" )
# get length of script array
scriptslength=${#scripts[@]}
# loop through all entries in the array
for (( i = 1; i < ${scriptslength} + 1; i ++ )); do
	CheckVerbose "Setting script ${1} executable"
	chmod +x ${scripts[${i}-1]}
done

# store serverdirectory
serverdirectory=`pwd`

# restart the server
CheckQuiet "${cyan}restarting server...${nocolor}"
./start.sh "$@"
