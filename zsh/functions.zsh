# Mia yun Ruse's `.config`
## Aliases and functions
EDITOR=micro
alias edit="$EDITOR"
alias nano="micro"

# cli to gui
alias preview="open -a preview"
alias finder="open -a finder ."
alias vscode="open -a 'Visual Studio Code' ."
alias safari="open -a safari"

function zedit {
  vscode ~/.config/zsh
  source ~/.zshrc
}
alias zclear="clear; zsh ~/.zlogin"

# helpful tools
export VISUAL="nano"
alias ls="exa -hbF"
function mkcd { mkdir $1 && cd $1 }
alias f="fzf --preview 'bat --style=numbers --color=always --line-range :100 {} | viu {} | lolcat -f {}'"


# python
alias python="python3.11"
alias pip="python3.11 -m pip"
function import { python -ic "import $*" }
function noether { python3 -im noether "$*" }
function noe {
  clear
  pushd ~/iCloud/Projects/Noether >/dev/null
  python3 tests/auto_catalogue.py
  gh issue list --milestone v1.0
  python3 ~/.config/zsh/noether_units.py
}

# misc
function yt {
  pushd ~/Media > /dev/null;
  yt-dlp $*;
  popd > /dev/null;
}
