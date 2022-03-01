# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dawid/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='[%n@%m %1d] $ '