# Mia yun Ruse's `.config`
## PATH: environment (portable... for now)

# Looking for Python pathing?
alias pypath="nano /opt/homebrew/lib/python3.14/site-packages/yunruse.pth"

alias python="python3.14"
alias python3="python3.14"
alias pip="python3.14 -m pip"

# Pathing

# default system
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# prefer homebrew
PATH="/opt/local/bin:/opt/local/sbin:$PATH"
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
# prefer user
PATH="${HOME}/.config/bin:${HOME}/.config/bin_device:$PATH"

export PLAYDATE_SDK_PATH="${HOME}/Developer/PlaydateSDK"

# echo $PATH
export PATH
