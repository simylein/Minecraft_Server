#!/bin/bash
# minecraft server speedrun script

# read the settings
. ./server.settings

# change to server directory
cd ${serverdirectory}

# check if server is running
if ! screen -list | grep -q "${servername}"; then
	echo -e "${yellow}Server is not currently running!${nocolor}"
	exit 1
fi

# wait for ingame start command
echo "waiting for start ingame command..."
start="confirm challange start"
screenlog="screenlog.0"
while true; do
	if [[ ! -z $(grep "$start" "$screenlog") ]]; then
		break
	fi
sleep 1s
done

# create ingame scoreboard
echo "creating scoreboard..."
screen -Rd ${servername} -X stuff "scoreboard objectives add health health$(printf '\r')"
screen -Rd ${servername} -X stuff "scoreboard objectives setdisplay list health$(printf '\r')"

# apply effects
echo "applying effects..."
screen -Rd ${servername} -X stuff "gamemode adventure @a$(printf '\r')"
screen -Rd ${servername} -X stuff "effect give @a minecraft:slowness 100 2$(printf '\r')"
screen -Rd ${servername} -X stuff "time set night$(printf '\r')"
screen -Rd ${servername} -X stuff "difficulty peaceful$(printf '\r')"

# welcome message
echo "Welcome to Minecraft Speedrun Server"
screen -Rd ${servername} -X stuff "say Welcome to Minecraft Speedrun Server$(printf '\r')"
echo "starting countdown..."

# countdown
counter="60"
while [ ${counter} -gt 0 ]; do
	if [[ "${counter}" =~ ^(60|40|20|10|5|4|3|2|1)$ ]];then
		echo "Speedrun Challange starts in ${counter} seconds!"
		screen -Rd ${servername} -X stuff "say Speedrun Challange starts in ${counter} seconds!$(printf '\r')"
	fi
counter=$((counter-1))
sleep 1s
done

# remove effects
echo "removing effects..."
screen -Rd ${servername} -X stuff "effect clear @a$(printf '\r')"
screen -Rd ${servername} -X stuff "gamemode survival @a$(printf '\r')"
screen -Rd ${servername} -X stuff "effect give @a minecraft:saturation$(printf '\r')"
screen -Rd ${servername} -X stuff "time set day$(printf '\r')"
screen -Rd ${servername} -X stuff "difficulty hard$(printf '\r')"

# challange start
echo "Speedrun Challange has started"
screen -Rd ${servername} -X stuff "say Speedrun Challange has startet$(printf '\r')"
screen -Rd ${servername} -X stuff "say God Luck and Have Fun :PogChamp:,:ZickZackSmiley:$(printf '\r')"

# all possible death messages
death01="was shot by"
death02="was pummeled by"
death03="was pricked to death"
death04="walked into a cactus whilst trying to escape"
death05="drowned"
death06="experienced kinetic energy"
death07="blew up"
death08="was blown up by"
death09="was killed by"
death10="hit the ground too hard"
death11="fell from a high place"
death12="fell off"
death13="fell while climbing"
death14="was squashed by a falling"
death15="went up in flames"
death16="walked into fire"
death17="burned to death"
death18="was burnt to a crisp"
death19="went off with a bang"
death20="tried to swim in lava"
death21="was struck by lightning"
death22="discovered the floor was lava"
death23="walked into danger zone"
death24="was killed by"
death25="was slain by"
death26="was fireballed by"
death27="was stung to death"
death28="starved to death"
death29="suffocated in a wall"
death30="was squished too much"
death31="was squashed by"
death32="was poked to death by a sweet berry bush"
death33="was killed trying to hurt"
death34="was impaled by"
death35="fell out of the world"
death36="didn't want to live in the same world as"
death37="withered away"

# timer sequence and main scanning sequenze
reset="confirm challange reset"
dragondeath="Free the End"
screenlog="screenlog.0"
counter="0"
while [ ${counter} -lt 12000 ]; do # while under 3 hours and 20 minutes do loop
	let "hours=counter/3600"
		if (( ${hours} < 10 )); then
					hours=0${hours}
		fi
	let "minutes=(counter%3600)/60"
		if (( ${minutes} < 10 )); then
					minutes=0${minutes}
		fi
	let "seconds=(counter%3600)%60"
		if (( ${seconds} < 10 )); then
					seconds=0${seconds}
		fi
	if [[ ! -z $(grep "$dragondeath" "$screenlog") ]]; then # if dragon is killed output time and reset server
		echo "Challange has been completed in ${hours}:${minutes}:${seconds}"
		screen -Rd ${servername} -X stuff "say Challange has been completed in ${hours}:${minutes}:${seconds}$(printf '\r')"
		echo "Congratulations! You did it!"
		screen -Rd ${servername} -X stuff "say Congratulations! You did it!$(printf '\r')"
		screen -Rd ${servername} -X stuff "gamemode spectator @a$(printf '\r')"
		./reset.sh
		break
	fi
	if [[ ! -z $(grep "$reset" "$screenlog") ]]; then # if ingame reset id requested output time and reset server
		echo "A server reset has been requested"
		screen -Rd ${servername} -X stuff "say A server reset has been requested$(printf '\')"
		echo "Challange stopped at ${hours}:${minutes}:${seconds}"
		screen -Rd ${servername} -X stuff "say Challange stopped at ${hours}:${minutes}:${seconds}$(printf '\r')"
		screen -Rd ${servername} -X stuff "gamemode spectator @a$(printf '\r')"
		./reset.sh
		break
	fi
	if [[ ! -z $(grep -E "$death01|$death02|$death03|$death04|$death05|$death06|$death07|$death08|$death09|$death10|$death11|$death12|$death13|$death14|$death15|$death16|$death17|$death18|$death19|$death20|$death21|$death22|$death23|$death24|$death25|$death26|$death27|$death28|$death29|$death30|$death31|$death32|$death33|$death34|$death35|$death36|$death37" "$screenlog") ]]; then # if a player dies output time and reset server
		echo "You died! Challange stopped at ${hours}:${minutes}:${seconds}!"
		screen -Rd ${servername} -X stuff "say You died! Challange stopped at ${hours}:${minutes}:${seconds}!$(printf '\r')"
		screen -Rd ${servername} -X stuff "gamemode spectator @a$(printf '\r')"
		./reset.sh
		break
	fi
	if [ $((counter%240)) -eq 0 ]; then # output time every 4 minutes
		echo "Time elapsed: ${hours}:${minutes}:${seconds}"
		screen -Rd ${servername} -X stuff "say Time elapsed: ${hours}:${minutes}:${seconds}$(printf '\r')"
	fi
counter=$((counter+1))
sleep 1s
done
