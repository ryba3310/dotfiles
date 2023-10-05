#   parse and count WORDS in input
function getcommands() {
	awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
}

#   add ip route rules for sshuttle with TPROXY
function tproxy() {
    sudo ip route add local default dev lo table 100
    sudo ip rule add fwmark 0x01 lookup 100
    sudo ip -6 route add local default dev lo table 100
    sudo ip -6 rule add fwmark 0x01 lookup 100
}

#   del ip route rules for sshuttle with TPROXY
function rmtproxy() {
    sudo ip route del local default dev lo table 100
    sudo ip rule del fwmark 0x01 lookup 100
    sudo ip -6 route del local default dev lo table 100
    sudo ip -6 rule del fwmark 0x01 lookup 100
}

#   make separator
function separator() {
	printf '%*s\n' "$(tput cols)" '' | tr ' ' -
}

#   make .bak of a file
function bak() {
	cp -a "$1{,.$(date "+%y%m%d%H%M")"}
}

#   show ssl_cert
function ssl_showcert() {
	openssl s_client -connect "$1":443 -servername "$1"
}

#   mkdir and cd
function mkcd() {
	command mkdir -p "$1" && cd "$1"
}

#   weather
function meteo() {
	curl http://wttr.in/"${1}"?lang=pl

	curl http://v2.wttr.in/"${1}"?lang=pl
}

#   quick file upload
function transfer() {
	curl --progress-bar --upload-file "$1" https://transfer.sh/"$(basename "$1")" | tee /dev/null
	echo
}

#   bluetooth fn to edit and customize
blt_pair() {
	sudo rfkill unblock bluetooth
	bluetoothctl power on
	bluetoothctl scan on
	DEVICE=$(printf "Soundcore Life Q30 AC:12:2F:9B:3B:6B\nSoundcore Life Q35 AC:12:2F:5D:A5:E6" | fzf)
	DEV=$(echo "$DEVICE" | awk '{print $NF}')
	bluetoothctl trust "$DEV"
	bluetoothctl pair "$DEV"
}

blt_c() {
	bluetoothctl power on
	DEVICE=$(bluetoothctl devices | fzf)
	DEV=$(echo "$DEVICE" | awk '{print $2}')
	bluetoothctl connect "$DEV"
}

blt_d() {
	bluetoothctl disconnect
	bluetoothctl power off
}

#   show ip on IFace
ipshow() {
	if [ $# -eq 0 ]; then
		IF="wlp2s0"
	else
		IF=$1
	fi

	ip a s "$IF" | grep 'inet ' | awk '{print $2}' | awk -F '/' '{print $1}'
}

complete -W "$(find /sys/class/net/ -mindepth 1 -printf '%f ')" ipshow


pastebin() {
    nc termbin.com 9999
}

#   get default gateway
gateway() {
ip route show default | grep default | awk {'print $3'}
}

