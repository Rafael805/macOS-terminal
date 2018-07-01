#if [ -f  ~/.bashrc ]; then
#        source ~/.bashrc
#fi

# =========================================================================================================================
#  ------------------------------------------------------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  Web Development
#  9.  Reminders & Notes
#
#  ------------------------------------------------------------------------------------------------------------------------
# =========================================================================================================================

# Enable colors for the bash -ls command
export CLICOLOR=1
export LSCOLORS="ExfxcxdxExegDxabagacDx"

# Configure terminal formatting colors & styles
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
undblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
orange=$(tput setaf 166); # Orange
yellow=$(tput setaf 288); # Yellow
green=$(tput setaf 33); # Green
white=$(tput setaf 15); # White
bold=$(tput setaf bold); # Bold
reset='\e[0m'    # Text Reset
# reset=$(tput setaf sgr0);


#   ------------------------------------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   ------------------------------------------------------------

# Set Paths
export PATH="$PATH:/usr/local/bin/"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#   ----------------------------------------------------------
#   2. MAKE TERMINAL BETTER
#   ----------------------------------------------------------

# Colorized aliases
# Basic log
alias log="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative"

# Basic log with graph
alias logg="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --graph --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative"

# Verbose log
alias logv="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an %Creset%ce%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative"

# Verbose log with graph
alias loggv="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --graph --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an %Creset%ce%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative"

# Log with full commit messages
alias logm="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --format=format:'%Creset%Cgreen%h%Creset | %C(white)%an | %C(yellow)%cr%n%Creset%s%n%n%b%n'"

# Show refs
alias refs="printf '$bldcyn' && git show-ref --abbrev && printf '$txtrst'"

# Show remote refs and urls
alias remotes="printf '$txtpur' && git remote -v && printf '$bldcyn\n' && git branch -r --no-color && printf '$txtrst'"


alias ls='ls -Gp'                           # Alias for colorized -ls command

alias cl='clear'                             # Clear terminal display

alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"                              # Go Home

alias status='git status'                  # Check status of git repo

#   ----------------------------------------------------------
#   3. CUSTOM COMMAND PROMPT
#   ----------------------------------------------------------

# First printed line in terminal. This only prints once, each time you log into a session on the command line.
#printf "\n$txtblu%s @ $txtblu%s $txtpur%s\n$txtrst" "$USER" "$PWD"

PS1="\n🦁 "; # New line w/ emoji
PS1+="\[${orange}\]\u"; # User
PS1+="\[${white}\] in "; # in
PS1+="\[${green}\]\W"; # Working directory
PS1+="\n"; # New line
PS1+="\[${white}\]\$ \[${reset}\]"; # Money sign

#PS1=' \[\e[1;33m\]~~ \[\e[1;31m\]'

# This function will run before any command is executed. Since we're colorizing various
# commands, we're using this function to set the text color back to default before every prompt.
function PreCommand() {
  if [ -z "$AT_PROMPT" ]; then
    return
  fi
  unset AT_PROMPT

  # Set color back to default (aka: reset)
  echo "$(tput sgr0)"
}
trap "PreCommand" DEBUG

# This will run after the execution of the previous full command line.
FIRST_PROMPT=1

function PostCommand() {
  #Set terminal tab titles.
  echo -n -e "\033]0;${PWD##*/}\007"

  AT_PROMPT=1

  if [ -n "$FIRST_PROMPT" ]; then
    unset FIRST_PROMPT
    return
  fi

  # This prints the line of info that appears before each actual prompt.
  # printf "\n$txtblu%s @ $txtblu%s $txtpur%s\n$txtrst" "$USER" "$PWD"
}
PROMPT_COMMAND="PostCommand"
