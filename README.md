
# Introduction
A fork of VIM, Neovim is brilliant, blazingly fast, highly configurable modal editor.
This repo helps you get started with using Neovim, give you practical tips and provide necessary instructions to customise the way you want it.

Here's the snapshot of my configuration in action.

< My Neovim IDE - Screenshot/Video goes here >

* This is going to be challenging .. but what's the fun if it's easy  
* You need to have lot of patience.. so take small steps  
* Give yourself enough time to learn as Vi/Vim has a steep learning curve   
* Finally, read..read...read lots of documentation  

   

# Learning Path
Before you go down this path, there are few things to keep in mind :

1. Understand Vi/Vim motion, objects
2. Lua - A lightweight scripting language
3. Understand mapping relationship between Vim & NeoVim 
4. Start configuring your IDE


# Installation

* `brew install neovim`             - Mac OS  
* `sudo pacman -S neovim`           - Arch Linux  
* `sudo apt-get install neovim`     - Debian   

# Folder Structure

This is how the folder structure looks like. All the folders should be under `$HOME/.config/nvim`  

* `init.lua` - This is where nvim looks for the 1st file  

* If we create a folder lua and add a file called plugins.lua  then we can just call
  ```lua
    require("lazy").setup("plugins") -- this will point to plugins.lua file 
  ```

* To require lazy we will use the following command
   ```vim
    require("lazy").setup(plugins, opt)
   ```
* Setup loads plugins and also aditional options using opts. Both Plugins and opts can be kept as separete table. 
Plugins will only fetch the and add options. For activating , a specific commands (using vim) or nvim api needs to be called to activate it.

* Ideally to keep it modularise, split your plugings into their own files and add it under this directory  `~/.config/nvim/lua/plugins/`.
 Lazy will detect any changes on this folder and auto loads it. You also need to add a "require" in your main file as long as you return a table.

* `lua/keymaps.lua`   - All your key bindings are stored here   
* `lua/options.lua`   - Helps set editor settings   


![image](https://github.com/rvbug/nvim/assets/10928536/9dc8e3a4-4ab7-4ff6-b34c-63c5ecbbfc02)


- Any lua file added under `plugin` folders gets autoloaded so you do not need to require them explicitly.
- Under this plugin folder, you need to return a table
- declare a function and add all the additional settings for that plugins.



# Notes

## Additional Installation
Some additional installation required on your machine:

`brew install fd` - Alternative to *find* command  
`brew install ripgrep` - Real time grep  
`brew install tmux` - installing tmux   
`brew install npm` - to install tsserver  
`brew install rust` - rust compilers and toolchain  
`brew install tmux` - terminal multiplexer



**Notes**: 


# Packages 

Here are the list of packages that is being used till now, I will be adding more based on my usage. 

**`Language Server Protocol`** - LSP Config is the most challenging part of the configration which uses open json rpc standard.   

**`Autocompletion engine`** - Uses 3rd party sources for completion, snippets suggestions.  

| Package | Type | Description |
|--- | --- | ---| 
| lazy.nvim  | Package Manager | Helps install other packages and themes |
| nightfox.nvim | Color Theme | It's personal choice. I use 'egde' theme |
| nvim-tree | Packages | File explorer |
| telescope.nvim | Package |  Fuzzy Finder |
| nvim-treesitter | Package |syntax highlighting, parsing and much more |
| lualine.nvim | Package | Status line theme and format |
| autopairs | Package | helps generate special character pairs like  [, { , ( |
| git-signs | Package | buffer git decoration  |
| neorg | Packages | Emacs Org more equivalent for Neovim  |
| nvim-cmp | LSP | A snippet engine which is used as a source and also for snippet "expansion" for nvim-cmp|
| luasnip | LSP  | used as a luasnip completion source for nvim-cmp, it supplies info to nvim-cmp to display and luasnip will expand it|
| cmp.luasnip | LSP | used as a luasnip completion source for nvim-cmp, it supplies info to nvim-cmp to display and luasnip will expand it|
| friendly-snippets | LSP | Collection of snippets for all programming languages loaded by luasnip|
| cmp-nvim-lsp | LSP | A completion source for nvim-cmp to display whatever lsp is attached to the buffer|
| none-ls| LSP | fork of null-ls, it helps in LSP diagnostics, code-actions and much more|




# Packages 




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






# Pending
- tmux
- Learn & organize Neorg
- Learn vim movements
- Update Github content (Recording, Update tables)
- Find a way to link .config with nvim (shell script)
- Cleanup Notion documentation (Explore to move to Neorg, gitbook?) [We will link it to my personal site]





## 
