# Mia yun Ruse's `.config`
## .zshrc

autoload -U colors && colors
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PS1="$fg[cyan]mia$reset_color %1~ ↦ "

for x (path path_device functions fzf); do
    x="${HOME}/.config/zsh/${x}.zsh"
    [ -f $x ] && source $x
done; unset x
