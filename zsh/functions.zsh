# Mia yun Ruse's `.config`
## Functions and aliases


# Editor aliases
export EDITOR=micro
export VISUAL=$EDITOR
alias edit="$EDITOR"
alias nano="micro"


function zedit {
  nano ~/.config/zsh/functions.zsh
  source ~/.config/zsh/functions.zsh
}
alias zclear="zsh ~/.zlogin"

source ~/Projects/transmission-control/aliases.sh

# Filesystem
alias ls="eza -hbF --git --no-user -s type"
alias l="ls -l"
alias f="fzf --preview 'bat --style=numbers --color=always --line-range :100 {}'"
function mkcd { mkdir $1 && cd $1 }
function mvself {
	mv "$(pwd)" $*
	cd .
}

function transmog {
	ffmpeg -i ~/Downloads/$1.mov ~/Downloads/$1.mp4
	rm ~/Downloads/$1.mov
}


# CLI to GUI
alias preview="open -a preview"
alias finder="open -a finder ."
alias vscode="open -a 'Visual Studio Code' ."
alias safari="open -a safari"
alias vlc="open -a vlc"


# python
alias python="python3.12"
alias python3="python3.12"
function pip { python -m pip $* --break-system-packages }
function import { python -ic "import $*" }
alias noether="python -im noether"


