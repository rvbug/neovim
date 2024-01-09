
Neovim as IDE

# Introduction
Neovim is brilliant, blazingly fast, highly configurable modal editor! It is fork of VIM 
This repo helps you get started with using Neovim and provide flexibilty to customise it the way you want.

Here's the snapshot of my configuration in action.

< My Neovim IDE - Screenshot/Video goes here >

 
Before you go down this path, there are few things to keep in mind :

1. This is going to be challenging .. but what's the fun if it's easy.
2. You need to have lot of patience.. so take small steps.
3. Give yourself enough time to learn as Vi/Vim has a steep learning curve.
4. Finally, read..read...read lots of documentation
   

## Learning Path

1. Understand Vi/Vim motion, objects
2. Lua - A lightweight scripting language
3. Understand mapping of Vim & NeoVim 
4. Start configuring your IDE


# Installation

* `brew install neovim`             - Mac OS  
* `sudo pacman -S neovim`           - Arch Linux  
* `sudo apt-get install neovim`     - Debian   

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

## Telescope     
Description: A nice Fuzzy finder package. It internally uses fd, ripgrep for finding files. 


### Telescope Mapping
| Package | keyboard mapping | mapped to |Description |
|--- | --- | ---| --- |
| Telescope | `<C-p>` | `:Telescope find_files<cr>` |find files |
| Telescope | `<leader>fg` | `:Telescope live_grep<cr>` |live grep | 
| Telescope | `<leader>fc` | `:Telescope grep_string<cr>` |find string under cursor | 
| Telescope | `<leader>fb` | `:Telescope buffers<cr>` |list all open buffers | 
| Telescope | `<leader>fb` | `:Telescope help_tags<cr>` |list all help tags | 


Prequisties : Install fd, ripgrep on your machine
`brew install fd`   
```bash
➜  ~ fd --help
A program to find entries in your filesystem

Usage: fd [OPTIONS] [pattern] [path]...

```

`brew install ripgrep`  
```bash
➜  ~ rg --help 
ripgrep 13.0.0
Andrew Gallant <jamslam@gmail.com>

ripgrep (rg) recursively searches the current directory for a regex pattern.
By default, ripgrep will respect gitignore rules and automatically skip hidden
files/directories and binary files.

Use -h for short descriptions and --help for more details.

Project home page: https://github.com/BurntSushi/ripgrep

USAGE:
    rg [OPTIONS] PATTERN [PATH ...]
...

```


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
This is the basic configuration I use. 

| Commands | Description |
| --- | ---|
| `:h <command name>` | displays help | 
| `:set number` | show line numbers | 
| `:set relativenumber` | show line number relative to the cursor| 
| `:set tabstop=2` | number of space for <tab> | 
| `:set expandtab` | number of space for <tab> in insert mode| 
| `:set shiftwidth` | number of space for (auto) indent | 
| `` | | 


# Keymaps
The keyboard shortcut for specific commands used. 
Basic mapping for splitting window is provided below but we will be using tmux shortly.
"Mapped

| Command | Mapped to | Description |
| --- | ---| --- |
| `"  "`| <space> | space is the leader Key  |
|  `<leader>jk` | | change from insert to cmd mode |
| `<leader>sv`  |`<C-w>v` |  split window vertically |
| `<leader>sh`   |`<C-w>h` | split window horizontally |
| `<leader>sx`   |`<C-w>x` | close currrent window |
| `<leader>sm`|`:MaximizerToggle<cr>` | toggle window  |
| `<leader>to`|`:tabnew<cr>`    | create new tab |
| `<leader>tx`|`:tabclose<cr>` | close the current tab |
| `<leader>tn`| `:tn<cr>`| move to the next tab |
| `<leader>tp`|`:tp<cr>` | go to previous tab |



# Package Keymaps
 
| Package | keyboard mapping | mapped to |Description |
|--- | --- | ---|
| Telescope | `<C-p>` | `:Telescope find_files<cr>` |find files |
| Telescope | `<leader>fg` | `:Telescope live_grep<cr>` |live grep | 
| Telescope | `<leader>fc` | `:Telescope grep_string<cr>` |find string under cursor | 
| Telescope | `<leader>fb` | `:Telescope buffers<cr>` |list all open buffers | 
| Telescope | `<leader>fb` | `:Telescope help_tags<cr>` |list all help tags | 



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
