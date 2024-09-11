# Mia yun Ruse's `.config`
## Fancy login banner

# go away, "last login" message
clear

w1=25
w2=$(bc -e "$COLUMNS - $w1 - 1")
hcat <(
	viu -t -w $w1 ~/.config/zsh/zelda2.png \
) <(\
	echo "enjoy ur" $(greeting) |\
	figlet -k -w$w2 |\
	lolcat -fp 0.6 \
) -w $w1 $w2 --sep " "

alias countdown="~/Projects/countdown/countdown ~/.config/zsh/calendar.txt -N10"
countdown $*