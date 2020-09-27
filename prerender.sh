#!/bin/bash
# Minecraft Server start script

. ./settings.sh

cd ${serverdirectory}

echo "I will prerender your minecraft world by teleporting a selcted player through it"
echo "I will scan so to speak in a grid with the spacing of 256 blocks"
read -p "Please enter a playername: " playername
echo "The player will be ${playername}"

echo "I would like to know how fast you want to scan your world"
echo "I would recommend an interval of 30 to 60 secounds"
echo "Please enter an interval in secounds. Example: sleep 60s"
read -p "interval:" interval
echo "The selected interval will be ${interval}"

echo "I will now start to teleport the selected player through he world"
echo "Continue?"
read -p "[Y/N]:"
if [[ $REPLY =~ ^[Yy]$ ]]
	then echo "starting prerender..."
	else echo "exiting..."
		exit 1
fi

# grid settings

x='128'

a='2048'
b='1792'
c='1536'
d='1280'
e='1024'
f='0768'
g='0512'
h='0256'
i='0000'
j='-0256'
k='-0512'
l='-0768'
m='-1024'
n='-1280'
o='-1536'
p='-1792'
q='-2048'

# teleporting sequence

echo "Setting player into spectator mode"
screen -Rd ${servername} -X stuff "gamemode spectator ${playername}$(printf '\r')"

echo "Prerendering started"
sleep 20s
echo "Progress: [0/289]"

# Sequence A
screen -Rd ${servername} -X stuff "tp ${playername} ${a} ${x} ${a}$(printf '\r')"
echo "Progress: [001/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${b} ${x} ${a}$(printf '\r')"
echo "Progress: [002/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${c} ${x} ${a}$(printf '\r')"
echo "Progress: [003/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${d} ${x} ${a}$(printf '\r')"
echo "Progress: [004/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${e} ${x} ${a}$(printf '\r')"
echo "Progress: [005/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${f} ${x} ${a}$(printf '\r')"
echo "Progress: [006/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${g} ${x} ${a}$(printf '\r')"
echo "Progress: [007/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${h} ${x} ${a}$(printf '\r')"
echo "Progress: [008/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${i} ${x} ${a}$(printf '\r')"
echo "Progress: [009/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${j} ${x} ${a}$(printf '\r')"
echo "Progress: [010/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${k} ${x} ${a}$(printf '\r')"
echo "Progress: [011/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${l} ${x} ${a}$(printf '\r')"
echo "Progress: [012/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${m} ${x} ${a}$(printf '\r')"
echo "Progress: [013/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${n} ${x} ${a}$(printf '\r')"
echo "Progress: [014/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${o} ${x} ${a}$(printf '\r')"
echo "Progress: [015/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${p} ${x} ${a}$(printf '\r')"
echo "Progress: [016/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${q} ${x} ${a}$(printf '\r')"
echo "Progress: [017/289]"
${interval}

# Sequence B
screen -Rd ${servername} -X stuff "tp ${playername} ${a} ${x} ${b}$(printf '\r')"
echo "Progress: [018/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${b} ${x} ${b}$(printf '\r')"
echo "Progress: [019/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${c} ${x} ${b}$(printf '\r')"
echo "Progress: [020/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${d} ${x} ${b}$(printf '\r')"
echo "Progress: [021/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${e} ${x} ${b}$(printf '\r')"
echo "Progress: [022/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${f} ${x} ${b}$(printf '\r')"
echo "Progress: [023/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${g} ${x} ${b}$(printf '\r')"
echo "Progress: [024/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${h} ${x} ${b}$(printf '\r')"
echo "Progress: [025/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${i} ${x} ${b}$(printf '\r')"
echo "Progress: [026/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${j} ${x} ${b}$(printf '\r')"
echo "Progress: [027/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${k} ${x} ${b}$(printf '\r')"
echo "Progress: [028/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${l} ${x} ${b}$(printf '\r')"
echo "Progress: [029/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${m} ${x} ${b}$(printf '\r')"
echo "Progress: [030/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${n} ${x} ${b}$(printf '\r')"
echo "Progress: [031/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${o} ${x} ${b}$(printf '\r')"
echo "Progress: [032/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${p} ${x} ${b}$(printf '\r')"
echo "Progress: [033/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${q} ${x} ${b}$(printf '\r')"
echo "Progress: [034/289]"
${interval}

# Sequence C
screen -Rd ${servername} -X stuff "tp ${playername} ${a} ${x} ${c}$(printf '\r')"
echo "Progress: [035/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${b} ${x} ${c}$(printf '\r')"
echo "Progress: [036/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${c} ${x} ${c}$(printf '\r')"
echo "Progress: [037/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${d} ${x} ${c}$(printf '\r')"
echo "Progress: [038/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${e} ${x} ${c}$(printf '\r')"
echo "Progress: [039/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${f} ${x} ${c}$(printf '\r')"
echo "Progress: [040/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${g} ${x} ${c}$(printf '\r')"
echo "Progress: [041/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${h} ${x} ${c}$(printf '\r')"
echo "Progress: [042/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${i} ${x} ${c}$(printf '\r')"
echo "Progress: [043/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${j} ${x} ${c}$(printf '\r')"
echo "Progress: [044/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${k} ${x} ${c}$(printf '\r')"
echo "Progress: [045/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${l} ${x} ${c}$(printf '\r')"
echo "Progress: [046/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${m} ${x} ${c}$(printf '\r')"
echo "Progress: [047/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${n} ${x} ${c}$(printf '\r')"
echo "Progress: [048/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${o} ${x} ${c}$(printf '\r')"
echo "Progress: [049/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${p} ${x} ${c}$(printf '\r')"
echo "Progress: [050/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${q} ${x} ${c}$(printf '\r')"
echo "Progress: [051/289]"
${interval}

# Sequence D
screen -Rd ${servername} -X stuff "tp ${playername} ${a} ${x} ${d}$(printf '\r')"
echo "Progress: [052/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${b} ${x} ${d}$(printf '\r')"
echo "Progress: [053/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${c} ${x} ${d}$(printf '\r')"
echo "Progress: [054/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${d} ${x} ${d}$(printf '\r')"
echo "Progress: [055/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${e} ${x} ${d}$(printf '\r')"
echo "Progress: [056/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${f} ${x} ${d}$(printf '\r')"
echo "Progress: [057/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${g} ${x} ${d}$(printf '\r')"
echo "Progress: [058/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${h} ${x} ${d}$(printf '\r')"
echo "Progress: [059/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${i} ${x} ${d}$(printf '\r')"
echo "Progress: [060/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${j} ${x} ${d}$(printf '\r')"
echo "Progress: [061/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${k} ${x} ${d}$(printf '\r')"
echo "Progress: [062/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${l} ${x} ${d}$(printf '\r')"
echo "Progress: [063/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${m} ${x} ${d}$(printf '\r')"
echo "Progress: [064/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${n} ${x} ${d}$(printf '\r')"
echo "Progress: [065/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${o} ${x} ${d}$(printf '\r')"
echo "Progress: [066/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${p} ${x} ${d}$(printf '\r')"
echo "Progress: [067/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${q} ${x} ${d}$(printf '\r')"
echo "Progress: [068/289]"
${interval}

# Sequence E
screen -Rd ${servername} -X stuff "tp ${playername} ${a} ${x} ${e}$(printf '\r')"
echo "Progress: [069/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${b} ${x} ${e}$(printf '\r')"
echo "Progress: [070/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${c} ${x} ${e}$(printf '\r')"
echo "Progress: [071/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${d} ${x} ${e}$(printf '\r')"
echo "Progress: [072/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${e} ${x} ${e}$(printf '\r')"
echo "Progress: [073/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${f} ${x} ${e}$(printf '\r')"
echo "Progress: [074/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${g} ${x} ${e}$(printf '\r')"
echo "Progress: [075/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${h} ${x} ${e}$(printf '\r')"
echo "Progress: [076/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${i} ${x} ${e}$(printf '\r')"
echo "Progress: [077/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${j} ${x} ${e}$(printf '\r')"
echo "Progress: [078/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${k} ${x} ${e}$(printf '\r')"
echo "Progress: [079/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${l} ${x} ${e}$(printf '\r')"
echo "Progress: [080/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${m} ${x} ${e}$(printf '\r')"
echo "Progress: [081/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${n} ${x} ${e}$(printf '\r')"
echo "Progress: [082/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${o} ${x} ${e}$(printf '\r')"
echo "Progress: [083/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${p} ${x} ${e}$(printf '\r')"
echo "Progress: [084/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${q} ${x} ${e}$(printf '\r')"
echo "Progress: [085/289]"
${interval}

# Sequence F
screen -Rd ${servername} -X stuff "tp ${playername} ${a} ${x} ${f}$(printf '\r')"
echo "Progress: [086/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${b} ${x} ${f}$(printf '\r')"
echo "Progress: [087/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${c} ${x} ${f}$(printf '\r')"
echo "Progress: [088/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${d} ${x} ${f}$(printf '\r')"
echo "Progress: [089/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${e} ${x} ${f}$(printf '\r')"
echo "Progress: [090/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${f} ${x} ${f}$(printf '\r')"
echo "Progress: [091/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${g} ${x} ${f}$(printf '\r')"
echo "Progress: [092/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${h} ${x} ${f}$(printf '\r')"
echo "Progress: [093/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${i} ${x} ${f}$(printf '\r')"
echo "Progress: [094/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${j} ${x} ${f}$(printf '\r')"
echo "Progress: [095/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${k} ${x} ${f}$(printf '\r')"
echo "Progress: [096/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${l} ${x} ${f}$(printf '\r')"
echo "Progress: [097/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${m} ${x} ${f}$(printf '\r')"
echo "Progress: [098/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${n} ${x} ${f}$(printf '\r')"
echo "Progress: [099/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${o} ${x} ${f}$(printf '\r')"
echo "Progress: [100/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${p} ${x} ${f}$(printf '\r')"
echo "Progress: [101/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${q} ${x} ${f}$(printf '\r')"
echo "Progress: [102/289]"
${interval}

# Sequence G
screen -Rd ${servername} -X stuff "tp ${playername} ${a} ${x} ${g}$(printf '\r')"
echo "Progress: [103/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${b} ${x} ${g}$(printf '\r')"
echo "Progress: [104/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${c} ${x} ${g}$(printf '\r')"
echo "Progress: [105/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${d} ${x} ${g}$(printf '\r')"
echo "Progress: [106/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${e} ${x} ${g}$(printf '\r')"
echo "Progress: [107/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${f} ${x} ${g}$(printf '\r')"
echo "Progress: [108/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${g} ${x} ${g}$(printf '\r')"
echo "Progress: [109/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${h} ${x} ${g}$(printf '\r')"
echo "Progress: [110/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${i} ${x} ${g}$(printf '\r')"
echo "Progress: [111/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${j} ${x} ${g}$(printf '\r')"
echo "Progress: [112/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${k} ${x} ${g}$(printf '\r')"
echo "Progress: [113/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${l} ${x} ${g}$(printf '\r')"
echo "Progress: [114/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${m} ${x} ${g}$(printf '\r')"
echo "Progress: [115/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${n} ${x} ${g}$(printf '\r')"
echo "Progress: [116/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${o} ${x} ${g}$(printf '\r')"
echo "Progress: [117/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${p} ${x} ${g}$(printf '\r')"
echo "Progress: [118/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${q} ${x} ${g}$(printf '\r')"
echo "Progress: [119/289]"
${interval}

# Sequence H
screen -Rd ${servername} -X stuff "tp ${playername} ${a} ${x} ${h}$(printf '\r')"
echo "Progress: [120/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${b} ${x} ${h}$(printf '\r')"
echo "Progress: [121/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${c} ${x} ${h}$(printf '\r')"
echo "Progress: [122/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${d} ${x} ${h}$(printf '\r')"
echo "Progress: [123/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${e} ${x} ${h}$(printf '\r')"
echo "Progress: [124/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${f} ${x} ${h}$(printf '\r')"
echo "Progress: [125/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${g} ${x} ${h}$(printf '\r')"
echo "Progress: [126/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${h} ${x} ${h}$(printf '\r')"
echo "Progress: [127/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${i} ${x} ${h}$(printf '\r')"
echo "Progress: [128/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${j} ${x} ${h}$(printf '\r')"
echo "Progress: [129/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${k} ${x} ${h}$(printf '\r')"
echo "Progress: [130/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${l} ${x} ${h}$(printf '\r')"
echo "Progress: [131/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${m} ${x} ${h}$(printf '\r')"
echo "Progress: [132/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${n} ${x} ${h}$(printf '\r')"
echo "Progress: [133/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${o} ${x} ${h}$(printf '\r')"
echo "Progress: [134/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${p} ${x} ${h}$(printf '\r')"
echo "Progress: [135/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${q} ${x} ${h}$(printf '\r')"
echo "Progress: [136/289]"
${interval}

# Sequence I
screen -Rd ${servername} -X stuff "tp ${playername} ${a} ${x} ${i}$(printf '\r')"
echo "Progress: [137/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${b} ${x} ${i}$(printf '\r')"
echo "Progress: [138/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${c} ${x} ${i}$(printf '\r')"
echo "Progress: [139/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${d} ${x} ${i}$(printf '\r')"
echo "Progress: [140/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${e} ${x} ${i}$(printf '\r')"
echo "Progress: [141/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${f} ${x} ${i}$(printf '\r')"
echo "Progress: [142/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${g} ${x} ${i}$(printf '\r')"
echo "Progress: [143/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${h} ${x} ${i}$(printf '\r')"
echo "Progress: [144/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${i} ${x} ${i}$(printf '\r')"
echo "Progress: [145/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${j} ${x} ${i}$(printf '\r')"
echo "Progress: [146/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${k} ${x} ${i}$(printf '\r')"
echo "Progress: [147/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${l} ${x} ${i}$(printf '\r')"
echo "Progress: [148/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${m} ${x} ${i}$(printf '\r')"
echo "Progress: [149/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${n} ${x} ${i}$(printf '\r')"
echo "Progress: [150/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${o} ${x} ${i}$(printf '\r')"
echo "Progress: [151/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${p} ${x} ${i}$(printf '\r')"
echo "Progress: [152/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${q} ${x} ${i}$(printf '\r')"
echo "Progress: [153/289]"
${interval}

# Sequence J
screen -Rd ${servername} -X stuff "tp ${playername} ${a} ${x} ${j}$(printf '\r')"
echo "Progress: [154/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${b} ${x} ${j}$(printf '\r')"
echo "Progress: [155/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${c} ${x} ${j}$(printf '\r')"
echo "Progress: [156/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${d} ${x} ${j}$(printf '\r')"
echo "Progress: [157/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${e} ${x} ${j}$(printf '\r')"
echo "Progress: [158/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${f} ${x} ${j}$(printf '\r')"
echo "Progress: [159/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${g} ${x} ${j}$(printf '\r')"
echo "Progress: [160/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${h} ${x} ${j}$(printf '\r')"
echo "Progress: [161/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${i} ${x} ${j}$(printf '\r')"
echo "Progress: [162/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${j} ${x} ${j}$(printf '\r')"
echo "Progress: [163/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${k} ${x} ${j}$(printf '\r')"
echo "Progress: [164/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${l} ${x} ${j}$(printf '\r')"
echo "Progress: [165/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${m} ${x} ${j}$(printf '\r')"
echo "Progress: [166/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${n} ${x} ${j}$(printf '\r')"
echo "Progress: [167/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${o} ${x} ${j}$(printf '\r')"
echo "Progress: [168/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${p} ${x} ${j}$(printf '\r')"
echo "Progress: [169/289]"
${interval}
screen -Rd ${servername} -X stuff "tp ${playername} ${q} ${x} ${j}$(printf '\r')"
echo "Progress: [170/289]"
${interval}



screen -Rd ${servername} -X stuff "Prerendering of your world has finished$(printf '\r')"
echo "Prerendering of your world has finished"
screen -Rd ${servername} -X stuff "Rendered 4096 blocks of area$(printf '\r')"
echo "Rendered 16777216 [4096 times 4096] blocks of area"

screen -Rd ${servername} -X stuff "kick ${playername} prerender has finished$(printf '\r')"
echo "script is done"