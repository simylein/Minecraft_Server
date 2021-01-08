#!/bin/bash
# minecraft server restore script

# read the settings
. ./server.settings

# change to server directory
cd ${serverdirectory}

# write date to logfile
echo "${date} executing restore script" >> ${screenlog}

# check if server is running
if ! screen -list | grep -q "${servername}"; then
	echo "server is not currently running!" >> ${screenlog}
	echo -e "${yellow}server is not currently running!${nocolor}"
	exit 1
fi

# countdown
counter="60"
while [ ${counter} -gt 0 ]; do
	if [[ "${counter}" =~ ^(60|40|20|10|5|4|3|2|1)$ ]];then
		echo -e "${blue}[Script]${nocolor} server is restoring a backup in ${counter} seconds"
		screen -Rd ${servername} -X stuff "tellraw @a [\"\",{\"text\":\"[Script] \",\"color\":\"blue\",\"italic\":false},{\"text\":\"server is restoring a backup in ${counter} seconds\"}]$(printf '\r')"
	fi
	counter=$((counter-1))
	sleep 1s
done

# server stop
echo "stopping server..."
screen -Rd ${servername} -X stuff "say stopping server...$(printf '\r')"
screen -Rd ${servername} -X stuff "stop$(printf '\r')"

# check if server stopped
stopchecks="0"
while [ $stopchecks -lt 30 ]; do
	if ! screen -list | grep -q "${servername}"; then
		break
	fi
	stopchecks=$((stopchecks+1))
	sleep 1;
done

# force quit server if not stopped
if screen -list | grep -q "${servername}"; then
	echo -e "${yellow}Minecraft server still hasn't closed after 30 seconds, closing screen manually${nocolor}"
	screen -S ${servername} -X quit
fi

# create arrays with backupdirectorys
cd ${backupdirectory}
backups=($(ls))
cd hourly
backupshourly=($(ls))
cd ../
cd daily
backupsdaily=($(ls))
cd ../
cd weekly
backupsweekly=($(ls))
cd ../
cd monthly
backupsmonthly=($(ls))
cd ../
cd cached
backupscached=($(ls))
cd ../

# ask for daily or hourly backup to restore
PS3='Would you like to restore a ${backups[0]}, ${backups[1]}, ${backups[2]}, ${backups[3]}, ${backups[4]}? '
select dailyhourlyweeklymonthly in "${backups[@]}"
do
	echo "You chose: ${dailyhourlyweeklymonthly}"
	break
done

# select specific backup out of daily, hourly, monthly, weekly or a special backup
if [[ "${dailyhourlyweeklymonthly}" == "${backups[0]}" ]]
then
	# ask for cached backup
	PS3="Which ${backups[4]} backup would you like to restore?"
	select backup in "${backupscached[@]}"
	do
		echo "You chose: ${backup}"
		break
	done
elif [[ "${dailyhourlyweeklymonthly}" == "${backups[1]}" ]]
then
	# ask for daily backup
	PS3="Which ${backups[0]} backup would you like to restore? "
	select backup in "${backupsdaily[@]}"
	do 
		echo "You chose: ${backup}"
		break
	done
elif [[ "${dailyhourlyweeklymonthly}" == "${backups[2]}" ]]
then
	# ask for hourly backup
	PS3="Which ${backups[1]} backup would you like to restore? "
	select backup in "${backupshourly[@]}"
	do
		echo "You chose: ${backup}"
		break
	done
elif [[ "${dailyhourlyweeklymonthly}" == "${backups[3]}" ]]
then
	# ask for monthly backup
	PS3="Which ${backups[2]} backup would you like to restore? "
	select backup in "${backupsmonthly[@]}"
	do
		echo "You chose: ${backup}"
		break
	done
elif [[ "${dailyhourlyweeklymonthly}" == "${backups[4]}" ]]
then
	# ask for weekly backup
	PS3="Which ${backups[3]} backup would you like to restore? "
	select backup in "${backupsweekly[@]}"
	do
		echo "You chose: ${backup}"
		break
	done
fi

# echo selected backup
echo "selected backup to restore: ${backupdirectory}/${dailyhourlyweeklymonthly}/${backup}"

# ask for permission to proceed
echo "I will now delete the current world-directory and replace it with your chosen backup"
echo "You have chosen: ${backupdirectory}/${dailyhourlyweeklymonthly}/${backup} as a backup to restore"
read -p "Continue? [Y/N]:"
if [[ $REPLY =~ ^[Yy]$ ]]
then echo -e "${green}restoring backup...${nocolor}"
	cd ${homedirectory}
	rm -r ${serverdirectory}/world
	cp -r ${backupdirectory}/${dailyhourlyweeklymonthly}/${backup} ${serverdirectory}
	mv ${backup} ${servername}
	echo -e "${blue}restarting server with restored backup...${nocolor}"
	cd ${serverdirectory}
	echo "${date} The backup ${backupdirectory}/${dailyhourlyweeklymonthly}/${backup} has been restored" >> ${screenlog}
	./start.sh
else echo -e "${yellow}canceling backup restore...${nocolor}"
	echo -e "${blue}restarting server...${nocolor}"
	cd ${serverdirectory}
	./start.sh
fi
