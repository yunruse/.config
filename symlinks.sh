# Mia yun Ruse's `.config`
## Symlinks for dotfiles

# macOS
ln -fs "~/Library/Mobile Documents/com~apple~CloudDocs" ~/iCloud
ln -fs ~/iCloud/Projects ~/Projects
ln -fs ~/.config/vscode ~/Library/Application Support/Code/User

# .config
touch ~/.hushlogin  # hide "last login"
ln -fs ~/.config/zsh/.zlogin ~/.zlogin
ln -fs ~/.config/zsh/.zshrc ~/.zshrc
ln -fs ~/.config/ssh ~/.ssh
