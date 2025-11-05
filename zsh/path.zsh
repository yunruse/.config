# Mia yun Ruse's `.config`
## PATH: environment (portable... for now)

# Looking for Python pathing?
alias pypath="nano /opt/homebrew/lib/python3.14/site-packages/yunruse.pth"

alias python="python3.14"
alias python3="python3.14"
alias pip="python3.14 -m pip"

# Pathing
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"  # this is the default
# homebrew
PATH="$PATH:/opt/homebrew/bin:/opt/homebrew/sbin"
PATH="/opt/local/bin:/opt/local/sbin:$PATH"


# contents of .config
PATH="$PATH:${HOME}/.zfunc"
PATH="$PATH:${HOME}/.config/bin:${HOME}/.config/bin_device"

# packages

# echo $PATH
export PATH

export MATPLOTLIBRC="${HOME}/.config/matplotlib/matplotlibrc"
