# Mia yun Ruse's `.config`
## Functions and aliases



# Editor
export EDITOR=micro
export VISUAL=$EDITOR
alias edit="$EDITOR"
alias nano="micro"


# Filesystem
alias ls="exa -hbF"
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
function zclear {
  clear
  zsh ~/.zlogin $*
}
function noe {
  # Development dashboard for Noether
  pushd ~/Projects/Noether >/dev/null
  make type --silent
  make test --silent 
  python3 ~/.config/zsh/noether_units.py
}
alias dash="zclear -n; noe; cd"


# Misc
function yt {
  pushd ~/Media > /dev/null;
  yt-dlp $*;
  popd > /dev/null;
}