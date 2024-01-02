
NeoVim as IDE
---

# Pre-requisites 
Before you go down this path, there are few things to keep in mind :

1. This is going to be challenging .. but what's the fun if it's easy.
2. You need to have lot of patience so take small steps.
3. Give yourself enough time to learn as Vi/Vim has a steep learning curve.

## Learning Path

1. Understand Vi motion 
2. Learn `lua` - lightweight scripting language
3. Learn how vim commands are mapped to the nvim
4. Start configuring your IDE


# Installation

* `Mac OS` 

  - `brew install neovim` - This will install NeoVim
  - `brew install fd` - Alternative to *find* command
  - `brew install ripgrep` - Real time grep
  - `brew upgrade nvim` - If you want to upgrade to the latest stable version of neovim  


# Packages 
  - Lazy - We will be using Lazy as our package manager. This is much more efficient 
  - Color Scheme - This is personal preference, you can install the package you like 



# Folder Structure

- `~/.config/nvim/init.lua` - Is where nvim looks for the 1st file
- If we have a folder lua and create plugins.lua `~/.config/nvim/lua/plugins.lua` then we can just call
  ```lua
    require("lazy").setup("plugins") -- this will point to plugins.lua file 
  ```


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
