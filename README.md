
Neovim as IDE

# Introduction
Neovim is brilliant modal editor and blazingly fast!
This repo helps you get started with using Neovim and provide flexibilty to customise it the way you want.

Here's the snapshot of my configuration in action.

< My Neovim IDE - Screenshot/Video goes here >




# Pre-requisites 
Before you go down this path, there are few things to keep in mind :

1. This is going to be challenging .. but what's the fun if it's easy.
2. You need to have lot of patience.. so take small steps.
3. Give yourself enough time to learn as Vi/Vim has a steep learning curve.
4. Finally, read..read...read lots of documentation
   

## Learning Path

1. Understand Vi/Vim motion, objects
2. Learn lua - A lightweight scripting language
3. Understand mapping of Vim & NVim 
4. Start configuring your IDE


# Installation
I have provided instructions on mac machine but on the Linux version it should work the same with little changes.

* Mac OS     - `brew install neovim`
* Arch Linux - `sudo pacman -S neovim`
* Debian     - `sudo apt-get install neovim`

Some additional installation required on your machine:

`brew install fd` - Alternative to *find* command  
`brew install ripgrep` - Real time grep  
`brew install tmux` - installing tmux   
`brew install npm` - to install tsserver  
`brew install rust` - rust compilers and toolchain  


# Packages 
  - Lazy - We will be using Lazy as our package manager. This is very efficient 
  - Color Scheme - This is personal preference, you can install the package you like. I am going with nightfox/edge
  - Telescope
  - Tree Sitter
  - LSP Config (LSP is the most challenging part of the configration). LSP is Language Server Protocol which uses open json rpc standard. This protocol helps us to communicate between Language Server on your machine with text editors  
  - Lua Line
   
<image>

## Autocompletion
1. nvim-cmp - A completion engine for neovim and shows the completion as you type but it gets help from external 3rd party sources/repo for completion, snippets suggestions or even from your current buffer. It does not provide snippet supports by itself.
2. luasnip - A snippet engine which is used as a source and also for snippet "expansion" for nvim-cmp
3. cmp.luasnip - used as a luasnip completion source for nvim-cmp, it supplies info to nvim-cmp to display and luasnip will expand it
4. friendly-snippets - Collection of snippets for all programming languages loaded by luasnip
5. cmp-nvim-lsp - A completion source for nvim-cmp to display whatever lsp is attached to the buffer


# Packages 

- `~/.config/nvim/init.lua` - This is where nvim looks for the 1st file
- If we have a folder lua and create plugins.lua `~/.config/nvim/lua/plugins.lua` then we can just call
  ```lua
    require("lazy").setup("plugins") -- this will point to plugins.lua file 
  ```

  To require lazy we will use the following command
   ```vim
    require("lazy").setup(plugins, opt)
   ```
Setup loads plugins and also aditional options using opts. Both Plugins and opts can be kept as separete table. 
Plugins will only fetch the and add options. For activating , a specific commands (using vim) or nvim api needs to be called to activate it.

- Ideally to keep it modularise, split your plugings into their own files and add it under this directory  `~/.config/nvim/lua/plugins/`.
 Lazy will detect any changes on this folder and auto loads it. You also need to add a "require" in your main file as long as you return a table.



`lua/keymaps.lua`   - All your key bindings are stored here  
`lua/options.lua`   - Helps set editor settings  

**Notes**: 
- Any lua file added under `plugin` folders gets autoloaded so you do not need to require them explicitly.
- Under this plugin folder, you need to return a table
- declare a function and add all the additional settings for that plugins.


`treesitter`     - A parser generator tool, I have configured for Lua, JS, Rust, Python, HTML, CSS, Markdown.

`themes`         - I use edge theme for my neovim. There are tons of them out there. You can chose the one which you like.

`telescope`      - A Fuzzy finder. Uses fd, ripgrep for finding files. <C-p> for finding files and <leader>fg for live grep for files

`nvim-tree`      - This is a file explorer tree package. To toggle the tree <C-n> is mapped to :NVimTreeToggle.  It has dependency on nvim-web-devicons

`none-ls`        - Helps in injecting diagnostics and code action for any buffers/files opened. I have included support for all the programming languages. <leader>gf helps in formatting the files

`neorg`          - What orgmode is for emacs, neorg is for nvim.

`lualine`        - Status line configuration

`lspconfig`      - Language Server Protocol configuration lives here. It is configured for all the programming languages I work on. "K" hover, "gd" is go to defintions, <leader>ca is for code actions

`gitsigns`       - Git integration for buffers

`completions`    - Code completion support. <C-b> backward scroll, <C-f> scroll away , <C-Space> complete mapping, <C-e> Abort, <CR> select. It also contains cmd line completion and search completions as well

`autopairs`      - Autocompletion of brackets

`tmux`           - TBD Support for multiplexer


# Basic Configuration
| Commands | Description |
| --- | ---|
|  `" "` | Space as Leader Key |
| `:set tabstop=2` |  | 
| | | 

# Inital Keymaps
| Command | Mapped to | Description |
| --- | ---| --- |
|  `<leader>jk` | | change from insert to cmd mode |
| `<leader>jk`  |  | | 
| `<leader>sv`  | |  |
| `<leader>sh`   | |  |
| `<leader>se`   | |  |
| `<leader>sx`   | |  |
| `<leader>to`| |  |
| `<leader>tx`| |  |
| `<leader>tn`| |  |
| `<leader>tp`| |  |
| `<leader>sm`| |  |
| `<leader>e`| |  |
| `<leader>`| |  |
| `<leader>`| |  |
| `<leader>`| |  |




# Package Keymaps
 
| Package | keyboard Mapping | Description |
|--- | --- | ---|
| Telescope | `<C-p>` | Find Files |
| Telescope | `<leader>fg` | Live Grep | 


# Folder Structure

Finally, this is how the folder structure looks like


# Pending
- tmux
- Learn & organize Neorg
- Learn vim movements
- Update Github content (Recording, Update tables)
- Find a way to link .config with nvim (shell script)
- Cleanup Notion documentation (Explore to move to Neorg, gitbook?) [We will link it to my personal site]





## 
