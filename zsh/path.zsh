# Mia yun Ruse's `.config`
## PATH env (portable)

#echo $PYTHONPATH
PYTHONPATH="$PYTHONPATH:${HOME}/iCloud/Projects/Noether/"
export PYTHONPATH

#echo $PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"  # this is the default
PATH="/opt/local/bin:/opt/local/sbin:$PATH:${HOME}/.zfunc"
PATH="$PATH:${HOME}/.config/bin"
export PATH

