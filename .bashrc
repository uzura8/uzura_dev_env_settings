alias V='vim -R -'
alias G='grep'
alias P='pbcopy'
alias UD='nkf --url-input'
export TERM=dtterm
export EDITOR=vi
alias vim=vi
#alias git='/opt/local/bin/git'
export PS1="[\u@\h \W]\\$ "
#PS1="\[\033[0;36m\][\u \W]$\[\033[0m\] "
#export PS1="[\u \W]\\$ "
#export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/xx:$PATH
#export TERM='vt100'
#export TERM=xterm-color
#export TERMINFO=/home/myname/.terminfo
export LSCOLORS=gxfxcxdxbxegedabagacad
export LANG='ja_JP.UTF-8'
export HISTCONTROL='ignoreboth'
alias less='less -M'
export D=`date +%Y%m%d`
export DT=`date +%Y%m%d%H%M%S`
#export T='/Users/shingo/Desktop/'

#export SCREENDIR="/Users/shingo/.screen"

export LS_COLORS="no=00;31:fi=00;37:di=00;36:ln=00;31:ex=00;31"
alias ls='ls -FGhal'
alias ll='ls -FGhal'
#alias op='open'
#alias ls='ls --color'

#alias mysql='mysql5 -u root'
#alias mysqldump='mysqldump5 -u root'
#alias ap_start="sudo /opt/local/apache2/bin/apachectl start"
#alias ap_stop="sudo /opt/local/apache2/bin/apachectl stop"
#alias ap_restart="sudo /opt/local/apache2/bin/apachectl restart"
#
#alias mysql_start="sudo /opt/local/lib/mysql5/bin/mysqld_safe &"
#alias mysql_stop="sudo /opt/local/bin/mysqladmin5 -u root shutdown"

# svn
alias svn_all_add="svn st | grep \"^?\" | awk '{ print $2 }' | xargs svn add"

# git
alias git_log_all='git rev-list --all | head -100 | xargs git log'

#alias hosts="sudo vim /etc/hosts"
alias vi_bash="vim ~/.bashrc"
alias sc_bash="source ~/.bashrc"

#alias mvim="/Applications/MacVim.app/Contents/MacOS/Vim -g --remote-tab-silent"
