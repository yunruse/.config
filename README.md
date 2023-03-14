# Mia yun Ruse's `.config`

![The terminal in use.](README.png)

Hey hi howdy! These are my personal configuration files and bash scripts for the terminal.

Includes shell scripts:
- `hcat`, `countdown`, `greeting` (see above for them in use!)
- `json2toml` (convert between formats)
- `rich` (format text using Python's `rich`)
- `roll` (quick `d20` roller)

This repo is mostly just so I can track changes and keep `.config` clean (would recommend) but **if anything looks useful please use it!** It's totally public domain, yo.

## Miscellaneous todo

- [ ] Use a symlink manager (gnu stow)

## Thoughts

I tend to use macOS, [`zsh`](https://zsh.sourceforge.io), [`micro`](https://micro-editor.github.io) and VS code, because they all have the principle of "good for power users, amazing defaults." I think terminals and GUIs are both neat and elitism either way is Silly.

I think [XDG Base Directory spec](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) is really dang neat, so this repository is my `~/.config` directory. Anything which doesn't support this is symlinked in.
