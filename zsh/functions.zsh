# Mia yun Ruse's `.config`
## Functions and aliases

source ~/Git/transmission-control/aliases.sh

# Editor aliases
alias ls="eza -bF --git --no-user -s type"
alias _lg="ls -l --group-directories-first -s modified --time-style=relative"

alias l="_lg --git-ignore --no-permissions"
alias la="_lg -a"

# Editors
export EDITOR=micro
export VISUAL=$EDITOR
alias nano="micro"
alias cat="bat -p"

c() {
	# cat but for everything
	case $(file --brief --mime-type $1) in
		image/*)
			viu $@
		;;
		inode/directory)
			ls -la $@
		;;
		text/*)
			bat -p $@
		;;
		*)
			hexyl $@
		;;
	esac
}
function g { cd $1 && l }
function mkcd { mkdir $1 && cd $1 }

# Misc filesystem
alias f="fzf --preview 'bat --style=numbers --color=always --line-range :100 {}'"
alias finder="open -a finder ."

# python
function import { python -ic "import $*" }
function from { python -ic "from $*"}
alias noether="uv --directory ~/git/Noether run noether"


# Meta-editing
function zedit {
  nano ~/.config/zsh/functions.zsh
  source ~/.config/zsh/functions.zsh
}
alias zclear="zsh ~/.zlogin"
