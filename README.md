# Neovim config

## Install
```shell
# Install a nerd font (and set it in the terminal emulator)
brew install --cask font-jetbrains-mono-nerd-font

# Install pynvim for semshi
pip install -U pynvim

# Install Node for github copilot
brew install node

rm -r .config/nvim/
rm -r ~/.local/share/nvim
rm -r ~/.local/state/nvim
rm -r ~/.cache/nvim 

git clone --depth 1 https://github.com/bence-the-great/neovim-config.git ~/.config/nvim
nvim
```

