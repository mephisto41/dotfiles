#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
autoload -U colors; colors
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

alias watch='watch -n1 '
alias kc='kubectl'
alias kf='kc port-forward'
alias kw='kubectl config use-context'
alias kl='kc logs --all-containers -f'
alias nfs='kc exec -it `kc get pods --template "{{range .items}}{{.metadata.name}}{{end}}" -n nfs-server -l app=nfs-server` -n nfs-server -- bash'
alias vim="mvim -v"
alias grep='grep --color=auto'
alias vs="code -r"
alias nocors='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security'

source "/Users/Morris/Downloads/google-cloud-sdk/path.zsh.inc"
source "/Users/Morris/Downloads/google-cloud-sdk/completion.zsh.inc"

unsetopt nomatch

export PATH="/Users/Morris/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
