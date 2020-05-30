#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better
#  3.   File and Folder Management
#  4.   Searching
#  5.   Networking and System Information
#  6.   Data Analytics

#  From this tutorial: https://medium.com/the-data-experience/how-to-bash-de53839f919a

#   --------------------------------------------------------------------
#   --------------------------------------------------------------------



#   1.  ENVIRONMENT CONFIGURATION

# Set PATH
# Python 3.6
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

export PATH=/usr/local/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin

# MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Node js
export PATH="/usr/local/opt/node@8/bin:$PATH"

# added by Miniconda3 installer
export PATH="/Users/milesturpin/miniconda3/bin:$PATH"

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Package Configuration
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib/pkgconfig/gtk+-2.0.pc:/opt/X11/lib/pkgconfig

#   Show wd in tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
export EDITOR='subl'
# \h:\W \u\$(space)
# Base prompt "\u:\W$ "
export PS1="\[\033[1;94m\]\u:\[\033[0m\]\[\033[1;32m\]\w$ \[\033[0m\]"

# VirtualEnv Wrapper
#export WORKON_HOME=$HOME/Dev/.virtualenvs
#export PROJECT_HOME=$HOME/Dev
#source /usr/local/bin/virtualenvwrapper.sh


#   --------------------------------------------------------------------
#   --------------------------------------------------------------------



#   2.  MAKE TERMINAL BETTER

alias f='open -a Finder ./'
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

#   --------------------------------------------------------------------
#   --------------------------------------------------------------------


#   3.  FILE AND FOLDER MANAGEMENT
#   zipf: Create a ZIP archive of a folder
zipf () { zip -r "$1".zip "$1" ; }

#   --------------------------------------------------------------------
#   --------------------------------------------------------------------


#   5.  NETWORKING AND SYSTEM INFORMATION

#   editbash: Open bash_profile in Sublime Text
alias editbash='subl ~/.bash_profile'

backupbash() {
	now=$(date +"%m%d%Y_%H%M%S")
    cp -f ~/.bash_profile ~/.backups/bash_profile_backup_$now
    cp -f ~/.bashrc ~/.backups/bashrc_backup_$now
    echo "Backed up to bash_profile_backup_$now"
    echo "Backed up to bashrc_backup_$now"
}

backup() {
	now=$(date +"%m%d%Y_%H%M%S")
	oldfile=$1
	filename=${oldfile%.*}
	extension=${oldfile##*.}
	newfile="$filename"_"$now"."$extension"

	mkdir backups

    cp "$1" ./backups/"$newfile"
    echo "Backed up to ./backups/$newfile"
}

#   cpu/memhogs: Display top CPU and memory users
alias cpuhogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias memhogs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   --------------------------------------------------------------------
#   --------------------------------------------------------------------


#   6.  DATA ANALYTICS
#   Jupyter/IPython useful commands
alias jp='jupyter lab ./'                   # jp: Open current directory in Jupyter Notebook
alias jptos='jupyter nbconvert --to script' # jptos: Convert given .ipynb to executable python script

#   --------------------------------------------------------------------
#   --------------------------------------------------------------------


# Added because getting pandas error
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
