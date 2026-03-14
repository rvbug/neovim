<p align="center"> < <img width="150" height="150" alt="Neovim-Vector" src="https://github.com/user-attachments/assets/33027080-fb46-4b09-963e-2ed58671fe33" /> </p>
 
<p align="center"> <img src="https://img.shields.io/badge/License-GPLv3-blue.svg"> <img height=21  src="https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white"> </p>


# Introduction

Neovim is fork of VI/VIM. It is brilliant, blazingly fast, highly configurable modal editor released in 2014.
This repo helps you get started with using Neovim, giving you practical tips and providing necessary instructions to customise your IDE the way you want it.

*`Note: Vim/Neovim are called modal editors because their behavior changes depending on the working mode (Normal mode, Command mode, Visual mode, Visual Block mode etc)`*


# History
Here's the history of editors for the last 50 years. If you look at VI/VIM, it was release more than 4 decades ago and still used widely.
VIM uses "VimL" or VimScript as scripting language where as Neovim uses a light weight, simple language called Lua.
<p align="Center"> <img height="600" width="300" src="https://github.com/rvbug/neovim/assets/10928536/782c4a8e-5def-451c-8884-a53c5a47ad18"> </p>


# Advantages
There are many IDEs like VSCode, Pycharm which just works out of the box then why Neovim? Some of the advantages are:-

- Faster Navigation by eliminating the need of a mouse
- Significantly improves your editing speed
- Macros to automate repetitive tasks
- Configure to your specific needs and preferences and stremline your workflow
- You can have custom keybindings mapped to your frequently used commands
- Enhance your productivity by providing features like split windows, quick search & replace and distraction-free mode too


# Folder Structure
This is how the folder structure looks like. All the folders should be under `$HOME/.config/nvim` 

```md
~/.config/nvim/
├── init.lua              # Entry point: requires options, keymaps, and lazy
├── lazy-lock.json        # Auto-generated (DO NOT EDIT)
├── after/
│   └── ftplugin/
│       └── rust.lua      # Buffer-local settings for Rust
└── lua/
    ├── config/
    │   └── options.lua   # Core Neovim settings
    ├── keymaps.lua       # Global keymaps and .rsl detection
    └── plugins/
        ├── autopairs.lua # windwp/nvim-autopairs
        ├── gitsigns.lua  # lewis6991/gitsigns.nvim
        ├── lsp.lua       # Mason & non-Rust LSP configs
        ├── lualine.lua   # Project-aware Status Line (RUSTIMATE/COPE)
        ├── markdown.lua  # iamcco/markdown-preview.nvim
        ├── neogit.lua    # NeogitOrg/neogit (The Magit experience)
        ├── oil.lua       # stevearc/oil.nvim (Floating text-based explorer)
        ├── rustsetup.lua # mrcjkb/rustaceanvim (Deep Rust integration)
        ├── telescope.lua # nvim-telescope/telescope.nvim
        ├── theme.lua     # aliqyan-21/darkvoid.nvim
        └── ui.lua        # Undotree & toggleterm.nvim

```

#### `init.lua` 
This is where nvim looks at everytime it starts so the lazy plugin manager is configured here.  <br>

#### `lazy-lock.json`
This lock file helps you to configure neovim and the version quickly.

####  `lua/plugins/`

The best way to keep everything modularize is to split plugings into their own separate files and add it under this plugins directory. 
Lazy will automatically detect any changes on this folder and loads it.  

Any/All plugin file should always return a table. Additional configuration/settings for that plugins should be inside a callback function. 
See the sample setup for `lua/plugins/themes.lua`. Same approach is used for most of the plugins unless specified differently in their documentation. 

`config = function() ` is a call back function. Look at the themes.lua file where the plugin is called and then colorscheme is setup.

```lua
return {
   "tiagovla/tokyodark.nvim",
   :
   :
   config = function()
      vim.cmd("colorscheme tokyodark")
   end
}
```





## Configuration

## Keymaps

| Command | Action | Description |
| :--- | :--- | :--- |
| `<leader>sv` | **Split Vertical** | Split window vertically |
| `<leader>sh` | **Split Horizontal** | Split window horizontally |
| `<leader>sx` | **Close Window** | Close the current window |
| `<leader>to` | **New Tab** | Create a new tab |
| `<leader>tx` | **Close Tab** | Close the current tab |
| `<leader>tn` | **Next Tab** | Move to the next tab |
| `<leader>tp` | **Prev Tab** | Go to the previous tab |
| `<leader>zm` | **Zen Mode** | Toggle distraction-free mode |
| `<leader>gf` | **Format** | Format the current buffer |



## Git

| Command | Action | Description |
| :--- | :--- | :--- |
| `<leader>gs` | **Neogit** | Full Magit-style status and staging UI |
| `]c` | **Next Hunk** | Jump to next Git change in the gutter |
| `[c` | **Prev Hunk** | Jump to previous Git change in the gutter |
| `<leader>mp` | **Preview** | Preview Markdown/Quarto in browser |
| `[d` / `]d` | **Diagnostics** | Navigate between editor errors |


## Global Navigation 

| Command | Action | Description |
| :--- | :--- | :--- |
| `-` | **Oil.nvim** | Open floating file explorer (Edit FS as text) |
| `Ctrl + p` | **Find Files** | Fuzzy search all files in project |
| `<leader>fg` | **Live Grep** | Search text across the entire codebase |
| `<leader>fh` | **Help Tags** | Search Neovim documentation |
| `Ctrl + \` | **ToggleTerm** | Toggle floating terminal popup |
| `<leader>u` | **Undotree** | Visualize the undo history branches |


## LSP

| Command | Action | Description |
| :--- | :--- | :--- |
| `K` | **Hover** | Show documentation and type information |
| `gd` | **Definition** | Jump to source code definition |
| `gr` | **References** | List all usages of a symbol |
| `<leader>lr` | **Rename** | Project-wide symbol renaming |
| `<leader>ca` | **Code Action** | LSP Quick-fixes (via Telescope UI) |
| `<leader>e` | **Diagnostic** | Open diagnostic error in a float |
| `<leader>rd` | **Debug** | Launch Rustaceanvim debuggables |
| `<leader>re` | **Expand** | Expand Rust macros (view RSL output) |


## Dependecies

### Install Font 

#### Mac 

```bash 
 # 1. Tap the Nerd Fonts cask
brew tap homebrew/cask-fonts

# 2. Install the Iosevka Nerd Font
brew install --cask font-iosevka-nerd-font

# 3. Verify the installation
# Open "Font Book" and search for "Iosevka Nerd Font"
```

#### Linux

```
# 1. Create the local font directory if it doesn't exist
mkdir -p ~/.local/share/fonts

# 2. Download the Iosevka Nerd Font package
curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Iosevka.tar.xz

# 3. Unzip the font files into the directory
tar -xvf Iosevka.tar.xz -C ~/.local/share/fonts

# 4. Update the system font cache
fc-cache -fv

# 5. Confirm the font is recognized by the system
fc-list :family | grep -i "Iosevka"

```
# Keymap References

![image](https://github.com/user-attachments/assets/77711218-6494-4193-90db-92bd411a1f77)

| Note: Motivation is from Viemu


# Dotfiles
Have a look my [.dotfile](https://github.com/rvbug/.dotfiles) repo if you want to setup and configure a new machine.

---
# Future Plans  
* DAP support for Rust
* Update Neovim 0.10+ since it has support for LSP out-of-the-box.
---
# References
[Neovim](https://neovim.io/)  
[Vim](https://www.vim.org/)  
[Lua](https://www.lua.org/)  
[Neovim Learning Path](https://www.sherpa.guide/paths/neovim)  
[Tmux](https://github.com/tmux/tmux/wiki)  
[Wezterm](https://wezfurlong.org/wezterm/index.html)  
[Neorg](https://github.com/nvim-neorg/neorg)  
[What is DAP](https://microsoft.github.io/debug-adapter-protocol/)  
[DAP Adapter Installation Instructions](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)  
[Learn Neovim the smart way](https://ofirgall.github.io/learn-nvim/chapters/00-why-should-i-learn.html)  
[Learn Vim the smart way](https://learnvim.irian.to/)  
[Vim Galore](https://github.com/mhinz/vim-galore)  
[Comprehensive Vim Guide](https://thevaluable.dev/vim-commands-beginner/)    
[Learn Vim Progressively](https://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)   
[Vim Tutorials](https://vimschool.netlify.app/basics/vimmodes/)  
[Neovim Tutorials](https://neovim.io/doc/user/usr_toc.html#usr_toc.txt)  
[Rust Setup on Neovim](https://neovim.io/doc/user/ft_rust.html)    
[Vim/Neovim Cheat sheet](http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html)  


