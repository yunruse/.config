# Mia yun Ruse's `.config`
## Aliases and functions

function zedit {
  vscode ~/.config/zsh
  source ~/.zshrc
}

# helpful tools
export VISUAL="nano"
alias ls="exa -hbF"
function mkcd { mkdir $1 && cd $1 }
alias f="fzf --preview 'bat --style=numbers --color=always --line-range :100 {} | viu {} | lolcat -f {}'"

# cli to gui
alias preview="open -a preview"
alias finder="open -a finder ."
alias vscode="open -a 'Visual Studio Code' ."
alias safari="open -a safari"

# python
function noether { python3 -im noether }
function import { python -ic "import $*" }

# misc
function yt {
  pushd ~/Media > /dev/null;
  yt-dlp $*;
  popd > /dev/null;
}
