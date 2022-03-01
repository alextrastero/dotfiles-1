export PATH=/home/dawid/.local/bin:$PATH
export PATH=/usr/local/cuda/bin:$PATH

# default programs
export EDITOR="micro"
export TERMINAL="st"
export BROWSER="firefox"


# aliases
alias ls='ls --color=auto'
alias yadm='LANG=en_US.UTF-8 yadm'

alias ..='cd ..'  
alias ....='cd ../..' 

alias update='sudo xbps-install -Su && sudo xbps-remove -Oo'
alias install='sudo xbps-install'
alias remove='sudo xbps-remove -R'

alias cpv='rsync -ah --info=progress2'
alias archive='tar --create --gzip --verbose --file'

# functions

function mdpdf() {
	pandoc -V geometry:margin=10mm -V mainfont:NeueMontreal -f markdown+implicit_figures -t pdf --pdf-engine=lualatex -s  "$1" -o $(basename -s .md "$1").pdf
}
