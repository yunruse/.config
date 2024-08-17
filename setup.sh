# Mia yun Ruse's `.config`
## Setup script (macOS)

# hide "last login"
touch ~/.hushlogin

# macOS symlinks
ln -fs "~/Library/Mobile Documents/com~apple~CloudDocs" ~/iCloud
ln -fs ~/iCloud/Projects ~/Projects

# .config symlinks

ln -fs ~/.config/zsh/.zlogin ~/.zlogin
ln -fs ~/.config/zsh/.zshrc ~/.zshrc
ln -fs ~/.config/ssh ~/.ssh
ln -fs ~/.config/vscode ~/Library/Application Support/Code/User

# macOS defaults
# always open TextEdit in new file
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
