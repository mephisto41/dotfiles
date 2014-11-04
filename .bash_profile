export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/Users/Morris/Downloads/adt-bundle-mac-x86_64-20131030/sdk/platform-tools:$PATH
export PATH=/Users/Morris/Downloads/adt-bundle-mac-x86_64-20131030/sdk/tools:$PATH
export PATH=/Users/Morris/Downloads/adt-bundle-mac-x86_64-20131030/sdk/build-tools:$PATH
export PATH=/Users/Morris/mozilla/moz-git-tools:$PATH
alias vim="mvim -v"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export POWERLINE_COMMAND=/Users/Morris/mozilla/powerline/scripts/powerline

# Get the current git branch name.
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Get currently applied mq name.
parse_mq_qapplied() {
  hg qapplied 2> /dev/null | sed -n '$p'
}

# Set a fancy prompt.
prompt_command () {
  # Reference:
  # https://makandracards.com/makandra/1090-customize-your-bash-prompt
  # http://stackoverflow.com/q/103857
  EXITSTATUS="$?"
  LINE="`eval printf "%.s_" {1..$COLUMNS}`"
  OFF="\[\e[0m\]"
  BOLD="\[\e[1m\]"
  BLACK="\[\e[30m\]"
  RED="\[\e[31m\]"
  GREEN="\[\e[32m\]"
  YELLOW="\[\e[33m\]"
  BLUE="\[\e[34m\]"
  MAGENTA="\[\e[35m\]"
  CYAN="\[\e[36m\]"
  WHITE="\[\e[37m\]"
  # Print a line to separate the previous command.
  # PS1="${LINE}\n"
  PS1=""
  # Print user name, host name, working directory.
  PS1+="${BOLD}${BLUE}\u@\h: ${MAGENTA}\w"
  # Print git branch name by __git_ps1 if available.
  if [ -n "`declare -F __git_ps1`" ]; then
    PS1+="${GREEN}`__git_ps1`"
  else
    PS1+="${GREEN}`parse_git_branch`"
  fi

  PS1+="${GREEN} `parse_mq_qapplied`"

  PS1+="\n"
  # Finally, reset the face, and print a prompt sign.
  PS1+="${OFF}\$ "
}

PROMPT_COMMAND=prompt_command
