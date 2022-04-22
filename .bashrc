export PS1="\[\e]0;\u@\h: \w\a\]\t ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] " 

export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
export colorflag="-G"


alias ls="command ls -lhFX --color=always" 
#alias localip="ipconfig getifaddr en0"

alias internalip="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
#alias externalip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com"

alias externalip="dig +short myip.opendns.com @resolver1.opendns.com"
alias piupdate="sudo apt-get update && sudo apt-get upgrade -y"

alias pitemp="echo -n  $(date +\%Y-\%m-\%d) $(date +\%H:\%M) \ \ \ \ ; vcgencmd measure_temp | cut -c 6- "
alias dotupdate='cd && mkdir dotfiles; cp .bashrc ./dotfiles/bashrc-$(date +\%Y-\%m-\%d_\%H\%M).txt && curl https://raw.githubusercontent.com/pvscvl/dotfiles/main/.bashrc > .bashrc'
