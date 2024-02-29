# Fix the Java Problemexport _JAVA_AWT_WM_NONREPARENTING=1
# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
#autoload -Uz compinit
#compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
source ${HOME}/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Manual configuration

# PATH=/root/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat --style plain'
alias vim='nvim'

# alias git_fap = 'git fetch -p && git branch --merged | grep -v "*" | grep -v "master" | xargs git branch -d'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh/zshalias ] && source ~/.zsh/zshalias
[ -f ~/.zsh/zshalias.extras ] && source ~/.zsh/zshalias.extras

# Plugins
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh-sudo/sudo.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# NVM (Node Version Manager)
export NVM_DIR="/home/pontsoul/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Local Scripts
export PATH="$HOME/.local/bin:$PATH"
[ -f ~/.profile ] && source ~/.profile

# Java
export JAVA_HOME=$(update-alternatives --query java | grep 'Value: ' | cut -d' ' -f2 | xargs dirname | xargs dirname)
export PATH=$JAVA_HOME:$PATH

# Alacritty
fpath+=${ZDOTDIR:-~}/.zsh_functions

# FortiClient VPN
export PATH=/opt/forticlient/gui/FortiClient-linux-x64/:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export LC_ALL=en_US.UTF-8

# Setting default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# https://github.com/alacritty/alacritty/issues/1408#issuecomment-467970836
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Switch between NVIM configs
# https://www.youtube.com/watch?v=LkHjJlSgKZY
alias vim="NVIM_APPNAME=MyVim nvim"
alias nvim="NVIM_APPNAME=MyVim nvim"
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
# alias nvim-kick="NVIM_APPNAME=kickstart nvim"
# alias nvim-chad="NVIM_APPNAME=NvChad nvim"
# alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("MyVim" "LazyVim") # "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  "  --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^n "nvims\n"
bindkey -s ^tl "tmux list-session\n"
bindkey -s ^t "tmux a -t CODE_RYANAIR_BOOKING_SERVICE_DESKTOP\n"
#compdef gitlab-ci-local
###-begin-gitlab-ci-local-completions-###
#
# yargs command completion script
#
# Installation: gitlab-ci-local completion >> ~/.zshrc
#    or gitlab-ci-local completion >> ~/.zprofile on OSX.
#
_gitlab-ci-local_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gitlab-ci-local --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gitlab-ci-local_yargs_completions gitlab-ci-local
###-end-gitlab-ci-local-completions-###

# Kubernetes
export KUBECONFIG="${HOME}/.kube/config.blat:${HOME}/.kube/config"

# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=zsh)"
