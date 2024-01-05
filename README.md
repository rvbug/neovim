
Neovim as IDE

# Introduction
Neovim is one of the best modal IDE out there. You have the freedom and flexibilty to customise it the way you want. It is blazingly fast too!!



< My Neovim IDE - Screenshot/Video goes here >




# Pre-requisites 
Before you go down this path, there are few things to keep in mind :

1. This is going to be challenging .. but what's the fun if it's easy.
2. You need to have lot of patience so take small steps.
3. Give yourself enough time to learn as Vi/Vim has a steep learning curve.
4. Finally, read..read...read lots of documentation
   

## Learning Path

1. Understand Vi/Vim motion, objects
2. Learn `lua` - lightweight scripting language
3. Understand how vim commands are mapped to the nvim
4. Start configuring your IDE


# Installation

* Mac OS     - `brew install neovim`
* Arch Linux - `sudo pacman -S neovim`
* Debian     - `sudo apt-get install neovim`

Some additional installation required are :

`brew install fd` - Alternative to *find* command
`brew install ripgrep` - Real time grep

# Structure 
This is folder structure :

`init.lua` - Where the 



# Packages 
  - Lazy - We will be using Lazy as our package manager. This is very efficient 
  - Color Scheme - This is personal preference, you can install the package you like. I am going with nightfox/edge
  - Telescope
  - Tree Sitter
  - LSP Config
  - Lua Line


## LSP
This is the most challenging part of the configration.

### what is LSP
LSP is Language Server Protocol which uses open json rpc standard. This protocol helps us to communicate between Language Server on your machine with text editors

<image>

## Autocompletion
1. nvim-cmp - A completion engine for neovim and shows the completion as you type but it gets help from external 3rd party sources/repo for completion, snippets suggestions or even from your current buffer. It does not provide snippet supports by itself.
2. luasnip - A snippet engine which is used as a source and also for snippet "expansion" for nvim-cmp
3. cmp.luasnip - used as a luasnip completion source for nvim-cmp, it supplies info to nvim-cmp to display and luasnip will expand it
4. friendly-snippets - Collection of snippets for all programming languages loaded by luasnip
5. cmp-nvim-lsp - A completion source for nvim-cmp to display whatever lsp is attached to the buffer


# Folder Structure

- `~/.config/nvim/init.lua` - This is where nvim looks for the 1st file
- If we have a folder lua and create plugins.lua `~/.config/nvim/lua/plugins.lua` then we can just call
  ```lua
    require("lazy").setup("plugins") -- this will point to plugins.lua file 
  ```
- Ideally to keep it modularise, split your plugings into their own files and add it under this directory  `~/.config/nvim/lua/plugins/`.
 Lazy will detect any changes on this folder and auto loads it. You also need to add a "require" in your main file as long as you return a table.



# Beginners

1. To require lazy we will use the following command
   ```vim
    require("lazy").setup(plugins, opt)
   ```
Setup loads plugins and also aditional options using opts. Both Plugins and opts can be kept as separete table. 
Plugins will only fetch the and add options. For activating , a specific commands (using vim) or nvim api needs to be called to activate it.




# Reference Materials

## Videos


## 
