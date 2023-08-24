# Mia yun Ruse's `.config`
## Fancy login banner

# go away, "last login" message
clear

w1=12
w2=$(bc -e "$COLUMNS - $w1 - 1")
alias countdown="countdown ~/.config/zsh/calendar.txt -n10"

hcat <(
  viu -t -w $w1 ~/.config/zsh/.zlogin.png \
) <(\
  echo "$(countdown -d 'Draft 1 deadline')" days |\
    figlet -k -w$w2 |\
    lolcat -fp 2 \
) -w $w1 $w2

countdown $* -n10

# unset w1
# unset w2
