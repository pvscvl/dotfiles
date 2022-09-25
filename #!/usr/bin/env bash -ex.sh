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

echo -e "${BL}This script will Perform Post Install Routines.${CL}"
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
 ____           _      _           _        _ _ 
|  _ \ ___  ___| |_   (_)_ __  ___| |_ __ _| | |
| |_) / _ \/ __| __|  | | '_ \/ __| __/ _' | | |
|  __/ (_) \__ \ |_   | | | | \__ \ || (_| | | |
|_|   \___/|___/\__|  |_|_| |_|___/\__\__,_|_|_|                                                
 ____                   ____            _       _   
|  _ \ _ __ ___ _ __   / ___|  ___ _ __(_)_ __ | |_ 
| |_) | '__/ _ \ '_ \  \___ \ / __| '__| | '_ \| __|
|  __/| | |  __/ |_) |  ___) | (__| |  | | |_) | |_ 
|_|   |_|  \___| .__/  |____/ \___|_|  |_| .__/ \__|
               |_|                       |_|        
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
function msg_no() {
    local msg="$1"
    echo -e "${BFR} ${CROSS} ${RD}${msg}${CL}"
}

header_info


if command -v Neofetch &> /dev/null
then
    read -r -p "Install Neofetch <y/N> " prompt
        if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
        then
            msg_info "Installing Neofetch"
            apt update &>/dev/null
            apt install neofetch -y &>/dev/null
            echo "neofetch" >> .bashrc
            msg_ok "Neofetch installed"
        else
            msg_no "Neofetch not installed"
        fi
    else
    echo "neofetch already installed"
fi