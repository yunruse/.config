# Mia yun Ruse's `.config`
## Symlinks for dotfiles

# macOS
ln -fs "~/Library/Mobile Documents/com~apple~CloudDoc" ~/iCloud

# .config
touch ~/.hushlogin  # hide "last login"
ln -fs ~/.config/zsh/.zlogin ~/.zlogin
ln -fs ~/.config/zsh/.zshrc ~/.zshrc
ln -fs ~/.config/ssh ~/.ssh
