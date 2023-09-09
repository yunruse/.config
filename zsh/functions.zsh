# Mia yun Ruse's `.config`
## Functions and aliases



# Editor
export EDITOR=micro
export VISUAL=$EDITOR
alias edit="$EDITOR"
alias nano="micro"


# Filesystem
alias ls="eza -hbF --git --no-user -s type"
alias l="ls -l"
alias f="fzf --preview 'bat --style=numbers --color=always --line-range :100 {} | viu {} | lolcat -f {}'"
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


# python
alias python="python3.11"
alias pip="python3.11 -m pip"
function import { python -ic "import $*" }
alias noether="python3 -im noether"


# Recursion!
function zedit {
  nano ~/.config/zsh/functions.zsh
  source ~/.config/zsh/functions.zsh
}


# Dashboard
alias zclear="zsh ~/.zlogin"

alias dash="zclear -n; noe; cd"
function noe {
  # Development dashboard for Noether
  pushd ~/Projects/Noether >/dev/null
  make type --silent
  make test --silent 
  python3 ~/.config/zsh/noether_units.py
}


# Misc
function duration-dir {
  # List total duration of all videos (recursive) in this directory
  # https://news.ycombinator.com/item?id=37384212
  find . -type f -print0 | \
      xargs -0 -P 10 -I {} ffprobe -v quiet -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 {} | \
      awk '{s += $1} END {printf "%dh%.2dm%.2ds\n", s/3600, s%3600/60, s%3600%60}'
}

alias valeveno="~/Projects/duskbreak/languages/translate"
source ~/Projects/transmission-control/aliases.sh
