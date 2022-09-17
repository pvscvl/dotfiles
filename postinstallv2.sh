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
YW=`echo "\033[33m"`
CL=`echo "\033[m"`
function header_info {
    echo -e "${YW}
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


printf "%b This script will perform post-installation routines.\\n" "${INFO}"
while true; do
   printf "%b%b Start the script? " "${QUEST}"; read -p "<y/n> " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * )  printf "%b Please answer yes or no\\n\\n" "${INFO}";;
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
header_info

   printf "%b %b Load .bashrc? <y/N> " "${QUEST}"; read -r -p "" prompt
    if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
        then
    #    msg_info "Moving existing .bashrc in ./dotfiles and load .bashrc from github"
    #    [ ! -d "/root/dotfiles" ] && mkdir -p "root/dotfiles"
    #    cp /root/.bashrc /root/dotfiles/bashrc-$(date +\%Y-\%m-\%d_\%H\%M).txt
        wget -q -O /root/.bashrc https://raw.githubusercontent.com/pvscvl/dotfiles/main/.bashrc 
        printf "%b .bashrc loaded\\n" "${TICK}"
        else
        printf "%b .bashrc unchanged\\n" "${INFO}"
fi



