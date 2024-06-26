#!/bin/bash
apt-get -y install sshpass
PS3="Select your timezone please: "

select time in "America/Chicago" "America/New York" Europe/London 
do
    case $time in
        "America/Chicago")
	    timezone=America/Chicago
            break;;
        "America/New York")
	    timezone=America/New_York
            break;;
        "Europe/London")
	    timezone=Europe/London
           break;;
        *)
           echo "please select correct timezone";;
    esac
done

PS3="Select your Keyboard layout please: "

select key in US UK
do
    case $key in
        "US")
            keyboard=us
	    keyboard_locale=en_US.UTF-8
	    keyboard_gen1=en_US
	    keyboard_gen2=en_US.UTF-8
            break;;
        "UK")
            keyboard=gb
	    keyboard_locale=en_GB.UTF-8
	    keyboard_gen1=en_GB
	    keyboard_gen2=en_GB.UTF-8
            break;;
        *)
           echo "Please select correct keyboard layout";;
    esac
done

###########EVE################################
#NAME=("Ldap-VM" "Service-VM" "Backend-VM")
#HOST=("192.168.201.20" "192.168.201.30" "192.168.201.31" "192.168.201.29" "192.168.201.12" "192.168.201.14")
#USER=("root" "root" "root" "leocancercare" "leocc" "ctcs")
#PASS=("LeOcC!2022" "LeOcC!2022" "LeOcC!2022" "LeOcC@Service" "LeOcC@MQTT" "LCC2021")
#SCRIPT="apt-get -y install locales; locale-gen $keyboard_gen1 $keyboard_gen2; timedatectl set-timezone $timezone; localectl set-x11-keymap $keyboard; localectl set-locale LANG=$keyboard_locale; #localectl set-keymap $keyboard"
#HOST=("192.168.201.14")
##########Marie###############################
NAME=("Ldap-VM" "Service-VM" "Backend-VM")
HOST=("192.168.201.14" "192.168.201.29" "192.168.201.20")
USER=("root" "leocc" "ctcs")
PASS=("LCC2021" "LeOcC@Dev" "ctcs12")
SCRIPT="apt-get -y install locales; locale-gen $keyboard_gen1 $keyboard_gen2; timedatectl set-timezone $timezone; localectl set-x11-keymap $keyboard; localectl set-locale LANG=$keyboard_locale; #localectl set-keymap $keyboard"
#Remove the # from the last command in the SCRIPT o run all of these in RHEL/Eve to set the keybpard and timezone
#SCRIPT="touch ssh-test-mubeen.sh;"

for i in ${!HOST[*]} ; do
#	ssh -l ${USER} ${HOST} "${SCRIPT}"
#	echo "timezone is $timezone and keyborard layout is $keyboard"
	sshpass -p ${PASS[i]} ssh -o StrictHostKeyChecking=no -l ${USER[i]} ${HOST[i]} "${SCRIPT}"
	echo "Timezone: $timezone and keyborard layout: $keyboard has been set on ${NAME[i]}"
done
