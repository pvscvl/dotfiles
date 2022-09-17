#!/usr/bin/env bash
    COL_NC='\e[0m' # No Color
    COL_LIGHT_GREEN='\e[1;32m'
    COL_LIGHT_RED='\e[1;31m'
    COL_LIGHT_GREY='\e[0;37m'
    COL_DARK_GREY='\e[1;30m'
    COL_PURPLE='\e[0;35m'
    COL_BLUE='\e[0;34m'
    TICK="[${COL_LIGHT_GREEN}✓${COL_NC}]\\t"
    QUEST="[${COL_PURPLE}?${COL_NC}]\\t"
    CROSS="[${COL_LIGHT_RED}✗${COL_NC}]\\t"
    INFO="[i]\\t"
    DONE="${COL_LIGHT_GREEN} done!${COL_NC}"
    OVER="\\r\\033[K"
    detected_os=$(grep '^ID=' /etc/os-release | cut -d '=' -f2 | tr -d '"')
    detected_version=$(grep VERSION_ID /etc/os-release | cut -d '=' -f2 | tr -d '"')
RD=`echo "\033[01;32m"`
CL=`echo "\033[m"`

function msg_info() {
    local msg="$1"
    printf "%b ${msg}\\n" "${INFO}"
}

function msg_quest() {
    local msg="$1"
    printf "%b ${msg}" "${QUEST}"
}

function msg_ok() {
    local msg="$1"
    printf "%b ${msg}\\n" "${TICK}"
}
function msg_no() {
    local msg="$1"
    printf "%b ${msg}\\n" "${CROSS}"
}




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

msg_info "This script will perform post-installation routines."
while true; do
    msg_quest "Start the script? "; read -p "<y/n> " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * )  msg_ok "Please answer yes or no";echo "";
    esac
done
if [[ "${EUID}" -ne 0 ]]; then
    printf "\\n\\n"
    printf "%b%b Can't execute script\\n" "${OVER}" "${CROSS}"
    printf "%b Root privileges are needed for this script\\n" "${INFO}"
    printf "%b %bPlease re-run this script as root${COL_NC}\\n" "${INFO}" "${COL_LIGHT_RED}"
    exit 1
fi

clear
YW=`echo "\033[33m"`
header_info
sleep 1


msg_quest "Load .bashrc? <y/N> "; read -r -p "" prompt
#printf "%b %b Load .bashrc? <y/N> " "${QUEST}"; read -r -p "" prompt
    if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
    then
        wget -q -O /root/.bashrc https://raw.githubusercontent.com/pvscvl/dotfiles/main/.bashrc 
        msg_ok ".bashrc loaded"
        sleep 1
    else
        msg_info ".bashrc unchanged"
        sleep 1
    fi


if  grep -q "KVM processor" /proc/cpuinfo ; then
    msg_quest "Install qemu-guest-agent? <y/N> " ; read -r -p "" prompt
        if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
            then
            msg_info "Installing qemu-guest-agent"
            apt update &>/dev/null
           apt install qemu-guest-agent -y &>/dev/null
           msg_ok "Installed qemu-guest-agent"
            sleep 1
            else
             msg_no "qemu-guest-agent not installed"
            if [[ $detected_os == "ubuntu" ]]
            then
            msg_info "Installing linux-virtual packages"
                apt update &>/dev/null
                apt install --install-recommends linux-virtual -y &>/dev/null
                apt install linux-tools-virtual linux-cloud-tools-virtual -y &>/dev/null
                msg_ok "Installed linux-virtual packages"
                sleep 1
            else
                msg_info "Linux-virtual packages not compatible with OS"
                msg_info "Only installed qemu-guest-agent"
                sleep 1
            fi
        fi
fi

if [[ $detected_os == "ubuntu" &&  $detected_version == "22.04" ]]
    then
    msg_quest "Apply workaround for ubuntu booting bug? <y/N> "; read -r -p "" prompt
    if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
    then
    msg_info "Applying ubuntu boot workaround"
    sed -i "s/^After=.*/After=systemd-remount-fs.service/" /etc/systemd/system/multi-user.target.wants/hv-kvp-daemon.service
    systemctl daemon-reload
    sleep 1
    msg_ok "Ubuntu boot workaround applied"
    sleep 1
    else
    msg_no "Ubuntu boot workaround not applied"
    sleep 1
    fi
fi