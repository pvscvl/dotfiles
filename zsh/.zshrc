export PATH="/usr/local/sbin:$PATH"

export PROMPT="%B%n%F{243}@$(scutil --get ComputerName) %f%1~%f %#%b "
#export PROMPT='%B%n%F{243}@%m %f%1~%f %#%b '
#export PROMPT="%B%n%F %b%f%1~ "

export RPROMPT=%D{%H:%M:%S}
#export RPROMPT=%D{%H:%M}

#export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
#export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
#colorflag="-G"


DOTFILESHOME=$HOME
source $DOTFILESHOME/_dotfiles/.export
source $DOTFILESHOME/_dotfiles/.aliases
source $DOTFILESHOME/_dotfiles/.funtions
#alias backuprc='cp .zshrc ./dotfiles/zshrc-$(date +\%Y-\%m-\%d_\%H\%M).txt'
#alias o="open ."
#alias genpasswd='echo `env LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 20`'
#alias ping="command ping --apple-time"


#alias lss="command gls -lhFX --color=always --group-directories-first"
#alias ls="command ls -lhF ${colorflag}"
#alias ls="command ls  ${colorflag}"
#alias ls="command gls -lhFX --color=always"
#alias ls="command gls -lhFX --color=always --sort=size" 

#alias _time="printf '$(date +\%Y-\%m-\%d) \t$(date +\%H:\%M)\t'"  

#alias cbdl='noglob youtube-dl -o "/Users/pascal/_cb/%(id)s/%(title)s.%(ext)s" --ignore-config --restrict-filenames --no-warnings --no-part '

#alias pdl='noglob youtube-dl -o "/Users/pascal/_pr0n/%(uploader)s/%(height)sp_%(duration)s_%(title)s.%(ext)s" --ignore-config --write-info-json --no-warnings '

#alias scdl='noglob youtube-dl -o "/Users/pascal/youtube-dl_tmp/%(uploader)s/%(title)s.%(ext)s" --ignore-config --restrict-filenames --write-description --write-info-json --write-thumbnail --add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --audio-quality 0 '


#alias brewupdate='brew update && brew upgrade && brew cleanup'
#alias masupdate="mas upgrade"
#alias _update='brew update && brew upgrade && brew cleanup && mas upgrade && softwareupdate -l'
#alias macupdate='sudo softwareupdate -i -a'



#alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print \$1' ; dig @resolver4.opendns.com myip.opendns.com +short "
#alias ips='printf "Internal IP:\t"; ipconfig getifaddr en0; printf "External IP:\t"; dig @resolver4.opendns.com myip.opendns.com +short' 
#alias ipinfo='echo WiFi:; printf "Internal IP:\t"; localipwifi ;printf "MAC address:\t" ; _macwifi ; printf "Gateway:\t"; _gwwifi ;  printf "Nameserver:\t";_dnswifi ; echo LAN:;printf "Internal IP:\t"; localiplan ;printf "MAC address:\t" ; _maclan ; printf "Gateway:\t"; _gwlan ;  printf "Nameserver:\t";_dnslan;  printf "\nExternal IP:\t"; externalip' 
#alias localipwifi="ipconfig getifaddr en0"
#alias localips="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2  "
#alias externalip="dig @resolver4.opendns.com myip.opendns.com +short"
#alias _dnswifi="ipconfig getsummary en0 | grep siaddr | cut -c 10- "
#alias _macwifi="ipconfig getsummary en0 | grep chaddr | cut -c 10- "
#alias _gwwifi="route -n get default | grep 'gateway' | awk '{print \$2}'"
#alias localiplan="ipconfig getifaddr en6"
#alias _dnslan="ipconfig getsummary en6 | grep siaddr | cut -c 10- "
#alias _maclan="ipconfig getsummary en6 | grep chaddr | cut -c 10- "
#alias _gwlan="route -n get default | grep 'gateway' | awk '{print \$2}'"


#alias mkdirtime='mkdir $(date +\%Y-\%m-\%d_\%H\%M)'   

#alias iperf3t="echo '############################################\niperf3 -c 10.0.0.10 -t 10 -i 1 -R\n############################################\n\n'; iperf3 -c 10.0.0.10 -t 10 -i 1 -R"
#alias iperf3u="echo '############################################\niperf3 -c 10.0.0.10 -t 10 -i 1 -R -u\n############################################\n\n'; iperf3 -c 10.0.0.10 -t 10 -i 1 -R -u"
#alias iperft="echo '############################################\niperf -c 10.0.0.10 -t 10 -i 1\n############################################\n\n'; iperf -c 10.0.0.10 -t 10 -i 1" 
#alias iperfu="echo '############################################\niperf -c 10.0.0.10 -u -t 10 -i 1\n############################################\n\n'; iperf -c 10.0.0.10 -u -t 10 -i 1"  
#alias iperftcp='iperf -c 10.0.0.10'
#alias iperftcp1='iperf -c 10.0.0.10 -t 30 -i 5'
#alias iperfudp='iperf -c 10.0.0.10 -u -b 1300m'
#alias iperfudp1='iperf -c 10.0.0.10 -u -b 1300m -t 30 -i 5'

#### Functions
#md5sum filename


https://github.com/pvscvl/dotfiles/blob/main/zsh/.zshrc
alias dotupdate='cd && mkdir dotfiles; cp .zshrc ./dotfiles/zshrc-$(date +\%Y-\%m-\%d_\%H\%M).txt && sudo curl https://raw.githubusercontent.com/pvscvl/dotfiles/main/zsh/.zshrc > tmpzshrc.txt && sudo cp tmpzshrc.txt .zshrc && rm tmpzshrc.txt; cd ./.dotfiles && curl https://raw.githubusercontent.com/pvscvl/dotfiles/main/zsh/.dotfiles/.exports > ./_dotfiles/.exports; curl https://raw.githubusercontent.com/pvscvl/dotfiles/main/zsh/.dotfiles/.aliases > ./_dotfiles/.aliases; curl https://raw.githubusercontent.com/pvscvl/dotfiles/main/zsh/.dotfiles/.functions > ./_dotfiles/.functions;'

#function md5sum() {
#        md5 "$@" || return $?
#}

# Copy w/ progress
#cp_p (){
#        rsync -WavP --human-readable --progress $1 $2
#        }

#creates a pw in this pattern XXXX-XXXX-XXXX-XXXX and copies it to clipboard
#pwg () {
#        pwgvar1=$(pwgen  -Bc -1 4)
#        pwgvar2=$(pwgen  -BA -1 4)
#        pwgvar3=$(pwgen  -BA -1 4)
#        pwgvar4=$(pwgen  -BA -1 4)
#        pwgvar5=$(echo $pwgvar1 $pwgvar2 $pwgvar3 $pwgvar4)
#            echo -n  ${pwgvar5// /-}  | pbcopy
#            echo ${pwgvar5// /-} 
#       }

#creates a pw in this pattern XXXXXX-XXXXXX-XXXXXX and copies it to clipboard
#pwg2 () {
#        pwg2var1=$(pwgen  -Bc -1 6)
#        pwg2var2=$(pwgen  -BA -1 6)
#        pwg2var3=$(pwgen  -BA -1 6)
#        pwg2var4=$(echo $pwg2var1 $pwg2var2 $pwg2var3)
#            echo -n  ${pwg2var4// /-}  | pbcopy
#            echo ${pwg2var4// /-} 
#        }

#details about timemachine backup status
#tmstatus () {
#            eval $(tmutil status | grep -E '[^}];$' | perl -p -e 's/^\s+[\"]*//g;' -e 's/[\"]*\s+\=\s+/=/g') || (echo "Something get wrong..." && return 1)#
#
#                if [[ $Running -eq 1 ]]
#                    then export LC_NUMERIC="en_US.UTF-8"
#                    [[ $BackupPhase == "Copying" ]] && Percent=$(printf '%0.2f%%' `bc <<< $Percent*100`) && echo "${DateOfStateChange}\n${BackupPhase} backup to ${DestinationMountPoint}\n${files} files backed up. $((${bytes:-0}/1000000000)) GB\n${totalFiles} files in total. $((${totalBytes:-0}/1000000000)) GB\nProgress: ${Percent} \tETA: ~$((${TimeRemaining:-0}/60)) min." || echo "${DateOfStateChange} ${BackupPhase} (Destination ${DestinationID})."                                
#                    else echo "TimeMachine backup is not running."
#                fi
#            }


#has to be at the end of the file
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh