# Mia yun Ruse's `.config`
## Fancy login banner

# go away, "last login" message
clear

# TODO: Truncate the countdown based on terminal height!

w1=24
w2=$(bc -e "$COLUMNS - $w1 - 1")
alias countdown="~/Projects/countdown/countdown ~/.config/zsh/calendar.txt -N10"

hcat <(
	viu -t -w $w1 ~/.config/zsh/zelda.png \
) <(\
#	python3.12 -c 'from datetime import date;print((date(2024, 9, 26) - date.today()).days, "days")' |\
	echo "enjoy ur" $(greeting) |\
#	echo $(countdown -1dC 'Book progress') days


	figlet -k -w$w2 |\
	lolcat -fp 0.6 \
) -w $w1 $w2 --sep " "

countdown $*

# unset w1
# unset w2
