export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/Users/Morris/Downloads/adt-bundle-mac-x86_64-20131030/sdk/platform-tools:$PATH
export PATH=/Users/Morris/Downloads/adt-bundle-mac-x86_64-20131030/sdk/tools:$PATH
export PATH=/Users/Morris/Downloads/adt-bundle-mac-x86_64-20131030/sdk/build-tools:$PATH
alias vim="mvim -v"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
