#!/usr/bin/env bash -ex
set -euo pipefail
shopt -s inherit_errexit nullglob
YW=`echo "\033[33m"`
BL=`echo "\033[36m"`
RD=`echo "\033[01;31m"`
BGN=`echo "\033[4;92m"`
GN=`echo "\033[1;92m"`
DGN=`echo "\033[32m"`
CL=`echo "\033[m"`
BFR="\\r\\033[K"
HOLD="-"
CM="${GN}✓${CL}"
CROSS="${RD}✗${CL}"
clear
echo -e "${BL}This script will Perform Zabbix-agent/zabbix-agent2 installation and config.${CL}"
while true; do
    read -p "Start the Script (y/n)?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
if [[ "${UID}" -ne 0 ]]; then
    echo " You need to run this script as root"
    exit 1
fi


function header_info {
echo -e "${RD}
  _           _        _ _            _     _     _                                  _   
 (_)_ __  ___| |_ __ _| | |  ______ _| |__ | |__ (_)_  __      __ _  __ _  ___ _ __ | |_ 
 | | '_ \/ __| __/ _` | | | |_  / _` | '_ \| '_ \| \ \/ /____ / _` |/ _` |/ _ \ '_ \| __|
 | | | | \__ \ || (_| | | |  / / (_| | |_) | |_) | |>  <_____| (_| | (_| |  __/ | | | |_ 
 |_|_| |_|___/\__\__,_|_|_| /___\__,_|_.__/|_.__/|_/_/\_\     \__,_|\__, |\___|_| |_|\__|
                                                                    |___/                      
${CL}"
}

function msg_info() {
    local msg="$1"
    echo -ne " ${HOLD} ${YW}${msg}..."
}

function msg_info2() {
    local msg="$1"
    echo -e " ${HOLD} ${YW}${msg}..."
}

function msg_ok() {
    local msg="$1"
    echo -e "${BFR} ${CM} ${GN}${msg}${CL}"
}

clear
header_info

if test -f /etc/debian_version; then
    debver=`cat /etc/debian_version`
    debianversion=`echo ${debver:0:2}`
    if $debianversion == "10"; then
    msg_info "Prepare package for Debian 10 (Buster)"
        wget https://repo.zabbix.com/zabbix/6.2/debian/pool/main/z/zabbix-release/zabbix-release_6.2-2%2Bdebian10_all.deb
        dpkg -i zabbix-release_6.2-2+debian10_all.deb
    fi
    if $debianversion == "11"; then
            msg_info "Prepare package for Debian 11 (Bullseye)"
            wget https://repo.zabbix.com/zabbix/6.2/debian/pool/main/z/zabbix-release/zabbix-release_6.2-2%2Bdebian11_all.deb
            dpkg -i zabbix-release_6.2-2+debian11_all.deb
    fi
else
    msg_info "Invalid Debian Version"
fi

    if [[ $(lsb_release -rs) == "22.04" ]]; 
        then
        msg_info "Prepare package for Ubuntu 22.04"
	    wget https://repo.zabbix.com/zabbix/6.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.2-2%2Bubuntu22.04_all.deb &>/dev/null
	    dpkg -i zabbix-release_6.2-2+ubuntu22.04_all.deb &>/dev/null
    fi

    if [[ $(lsb_release -rs) == "20.04" ]]; 
        then
        msg_info "Prepare package for Ubuntu 20.04"
	    wget https://repo.zabbix.com/zabbix/6.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.2-2%2Bubuntu20.04_all.deb &>/dev/null
	    dpkg -i zabbix-release_6.2-2+ubuntu20.04_all.deb &>/dev/null
    fi

apt update &>/dev/null
    echo ""
    PS3='Install this Option: '
    options=("zabbix-agent" "zabbix-agent2" "None")
    select opt in "${options[@]}"
    do
        case $opt in
            "zabbix-agent")
                msg_info "Installing zabbix-agent" 
		        apt install zabbix-agent -y &>/dev/null
		        systemctl restart zabbix-agent
		        systemctl enable zabbix-agent
                sed -i "/Server=127.0.0.1/ s//Server=10.0.0.5/g" /etc/zabbix/zabbix_agentd.conf
                sed -i "/# ListenPort=10050/ s//ListenPort=10050/g" /etc/zabbix/zabbix_agentd.conf
                sed -i "/# ListenIP=0.0.0.0/ s//ListenIP=0.0.0.0/g" /etc/zabbix/zabbix_agentd.conf
                sed -i "/# StartAgents=3/ s//StartAgents=5/g" /etc/zabbix/zabbix_agentd.conf
                sed -i "/ServerActive=127.0.0.1/ s//ServerActive=10.0.0.5:10051/g" /etc/zabbix/zabbix_agentd.conf
                sed -i "/Hostname=Zabbix server/ s//Hostname=$HOSTNAME/g" /etc/zabbix/zabbix_agentd.conf
                sed -i "/# RefreshActiveChecks=120/ s//RefreshActiveChecks=60/g" /etc/zabbix/zabbix_agentd.conf
                sed -i "/# HeartbeatFrequency=/ s//HeartbeatFrequency=60/g" /etc/zabbix/zabbix_agentd.conf
                systemctl restart zabbix-agent
                sleep 2
                msg_ok "zabbix-agent installed" 
                break
            ;;
            "zabbix-agent2")
                msg_info "Installing zabbix-agent2"
		        apt install zabbix-agent2 zabbix-agent2-plugin-mongodb -y &>/dev/null
		        systemctl restart zabbix-agent2
		        systemctl enable zabbix-agent2 
                sed -i "/Server=127.0.0.1/ s//Server=10.0.0.5/g" /etc/zabbix/zabbix_agent2.conf
                sed -i "/# ListenPort=10050/ s//ListenPort=10050/g" /etc/zabbix/zabbix_agent2.conf
                sed -i "/# ListenIP=0.0.0.0/ s//ListenIP=0.0.0.0/g" /etc/zabbix/zabbix_agent2.conf
                sed -i "/ServerActive=127.0.0.1/ s//ServerActive=10.0.0.5:10051/g" /etc/zabbix/zabbix_agent2.conf
                sed -i "/Hostname=Zabbix server/ s//Hostname=$HOSTNAME/g" /etc/zabbix/zabbix_agent2.conf
                sed -i "/# RefreshActiveChecks=120/ s//RefreshActiveChecks=60/g" /etc/zabbix/zabbix_agent2.conf
                sed -i "/# HeartbeatFrequency=/ s//HeartbeatFrequency=60/g" /etc/zabbix/zabbix_agent2.conf
                systemctl restart zabbix-agent2
                sleep 2
                msg_ok "zabbix-agent2 installed" 
                break
            ;;
            "None")
                msg_info "No zabbix-agent selected for installation."
		        break
            ;;
            *) msg_info "invalid option $REPLY";;
    esac
    done
sleep 1
fi