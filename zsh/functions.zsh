# Mia yun Ruse's `.config`
## Functions and aliases


# Editor aliases
export EDITOR=micro
export VISUAL=$EDITOR
alias nano="micro"
alias cat="bat -p"


function zedit {
  nano ~/.config/zsh/functions.zsh
  source ~/.config/zsh/functions.zsh
}
alias zclear="zsh ~/.zlogin"

source ~/Git/transmission-control/aliases.sh

# Filesystem
alias ls="eza -hbF --git --no-user -s type"
alias l="ls -l"
alias f="fzf --preview 'bat --style=numbers --color=always --line-range :100 {}'"
function mkcd { mkdir $1 && cd $1 }
function mvself {
	mv "$(pwd)" $*
	cd .
}

# CLI to GUI
alias preview="open -a preview"
alias finder="open -a finder ."
alias vscode="open -a 'Visual Studio Code' ."
alias safari="open -a safari"
alias vlc="open -a vlc"

function menubar {
	ID=$(osascript -e "id of app \"$1\"")
	if (($# > 1)); then
		defaults write $ID AppleMenuBarVisibleInFullscreen -bool $2
	else
		defaults read $ID AppleMenuBarVisibleInFullscreen
	fi
}


# python
function import { python -ic "import $*" }
function from { python -ic "from $*"}
function pyprint {
	python -c "print($*)" | tee /dev/stderr | perl -pe 'chomp if eof' | pbcopy
}
alias noether="python -im noether"
