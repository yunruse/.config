# Mia yun Ruse's `.config`
## Setup script

# hide "last login"
touch ~/.hushlogin

# macOS symlinks
ln -fs "~/Library/Mobile Documents/com~apple~CloudDocs" ~/iCloud
ln -fs ~/iCloud/Projects ~/Projects

# .config symlinks

# TODO: invert these for portability - .config is your source of truth!
ln -fs ~/.config/zsh/.zlogin ~/.zlogin
ln -fs ~/.config/zsh/.zshrc ~/.zshrc
ln -fs ~/.config/ssh ~/.ssh
ln -fs ~/.config/vscode ~/Library/Application Support/Code/User
