# Mia yun Ruse's `.config`
## Fancy login banner

# go away, "last login" message
clear

# TODO: Truncate the countdown based on terminal height!

w1=12
w2=$(bc -e "$COLUMNS - $w1 - 1")
alias countdown="~/Projects/countdown/countdown ~/.config/zsh/calendar.txt -N10 --clean"

hcat <(
  viu -t -w $w1 ~/.config/zsh/.zlogin.png \
) <(\
    echo Keep writing! |\
#  echo $(countdown -1dC 'Book progress') days |\
    figlet -k -w$w2 |\
    lolcat -fp 2 \
) -w $w1 $w2

countdown $*

# unset w1
# unset w2
