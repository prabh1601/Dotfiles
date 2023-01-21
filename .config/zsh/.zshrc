# Enable colors and change prompt
autoload -U colors && colors
PS1=$'\n'"[%f%B%F{red}%n%f%b@%B%F{blue}%m%f%b:%B%F{magenta}%~%f%b] "

setopt correct

autoload -Uz compinit
compinit

#History 
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/history

# VI Mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#ENV VARIABLES
path+=('/home/prabh/.cargo/bin')

#Aliases
alias vim=nvim
alias dotfiles='/usr/bin/git --git-dir=/home/prabh/.dotfiles/ --work-tree=/home/prabh'
alias ls='exa --group-directories-first'
alias grep='grep --color=auto'
alias magnet='grep -Po "magnet:\?xt=urn:btih:[a-zA-Z0-9]*" | head -n 1'
alias pdir='cd /mnt/Drive1/CP/Practice'
alias oslab='cd /mnt/Drive1/LearningStuff/Labs/xv6-labs-2021/ && make qemu'

#Loading plugins
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
