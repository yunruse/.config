# Mia yun Ruse's `.config`
## Fancy login banner

w1=24
w2=$(bc -e "$COLUMNS - $w1 - 1")

hcat <(
  viu -t -w $w1 ~/.config/zsh/.zlogin.png \
) <(\
  echo "$(greeting), $(isoweek)" |\
    figlet -k -w$w2 |\
    lolcat -fp 2 \
) -w $w1 $w2


countdown ~/.config/zsh/calendar.txt

# unset w1
# unset w2