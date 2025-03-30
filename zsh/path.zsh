# Mia yun Ruse's `.config`
## PATH: environment (portable)

# Looking for Python pathing?
alias pypath="nano ~/Library/Python/3.12/lib/python/site-packages/yunruse.pth"

#echo $PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"  # this is the default
PATH="/opt/local/bin:/opt/local/sbin:$PATH:${HOME}/.zfunc"
PATH="$PATH:${HOME}/.config/bin:${HOME}/.config/bin_device"
PATH="$PATH:${HOME}/.config/countdown"
export PATH

export MATPLOTLIBRC="${HOME}/.config/matplotlib/matplotlibrc"
