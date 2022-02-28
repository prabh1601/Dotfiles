export PS1="\n[\[\e[01;31m\]\u\[\e[01;00m\]@\[\e[m\]\[\e[01;34m\]\h\[\e[01;00m\]:\[\e[m\]\[\e[01;35m\]\w\[\e[m\]] "

export TERM=kitty
export FILE=thunar

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

alias dotfiles='/usr/bin/git --git-dir=/home/prabh/.dotfiles/ --work-tree=/home/prabh'
alias vim=nvim

