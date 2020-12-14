#!/bin/bash
# minecraft server backup script

# read the settings
. ./server.settings

# change to server directory
cd ${serverdirectory}

# write date to logfiles
echo "${date} executing backup-hourly script" >> ${screenlog}
echo "${date} executing backup-hourly script" >> ${backuplog}

# check if server is running
if ! screen -list | grep -q "${servername}"; then
	echo -e "${yellow}Server is not currently running!${nocolor}"
	echo "Server is not currently running!" >> ${screenlog}
	exit 1
fi

# check if there is no backup from today
if ! [ -d "${backupdirectory}/hourly/${servername}-${newhourly}" ]; then
	cp -r ${serverdirectory}/world ${backupdirectory}/hourly/${servername}-${newhourly}
else
	echo "warning backup already exists!" >> ${backuplog}
	exit 1
fi

# ingame and logfile success and error output
if [ -d "${backupdirectory}/hourly/${servername}-${newhourly}" ]; then
	screen -Rd ${servername} -X stuff "say newest backup has been successfully created!$(printf '\r')"
	echo "newest backup has been successfully created!" >> ${backuplog}
	echo "added ${backupdirectory}/hourly/${servername}-${newhourly}" >> ${backuplog}
else
	screen -Rd ${servername} -X stuff "say fatal could not backup world - please tell your server admin!$(printf '\r')"
	echo "fatal could not backup world!" >> ${backuplog}
fi

# check if there is a backup from today
if [ -d "${backupdirectory}/hourly/${servername}-${newhourly}" ]; then
	rm -r ${backupdirectory}/hourly/${servername}-${oldhourly}
else
	echo "warning cannot remove old backup because new backup is missing" >> ${backuplog}
	exit 1
fi

# ingame and logfile success and error output
if ! [ -d "${backupdirectory}/hourly/${servername}-${oldhourly}" ]; then
	screen -Rd ${servername} -X stuff "say oldest backup has been successfully removed!$(printf '\r')"
	echo "oldest backup has been successfully removed!" >> ${backuplog}
	echo "removed ${backupdirectory}/hourly/${servername}-${oldhourly}" >> ${backuplog}
else
	screen -Rd ${servername} -X stuff "say warning could not remove old backup - please tell your server admin!$(printf '\r')"
	echo "warning could not remove old backup!" >> ${backuplog}
fi

# write one padding line to backuplog
echo "" >> ${backuplog}
