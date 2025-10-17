# How to use

```bash
# Add all configs
stow *
# Add see package  e.g. stow Nvim
stow <package>
```

# Fedora Atomic Quirks

```bash
# For vim default editor
sudo rpm-ostree override remove nano nano-default-editor --install=vim-default-editor
# For kitty terminal
rpm-ostree install kitty
```
