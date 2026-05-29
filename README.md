# 💻 Neovim config

```shell
# 👾 Install a nerd font (and set it in the terminal emulator) 
brew install --cask font-jetbrains-mono-nerd-font

# 🔭 Install ripgrep for telescope 
brew install ripgrep

# 📦 Install LSPs
brew install --cask copilot-language-server
brew install hashicorp/tap/terraform-ls
brew install helm-ls
brew install ty
brew install basedpyright
brew install lua-language-server

rm -r .config/nvim/
rm -r ~/.local/share/nvim
rm -r ~/.local/state/nvim
rm -r ~/.cache/nvim 

git clone --depth 1 https://github.com/bence-the-great/neovim-config.git ~/.config/nvim
nvim
```

