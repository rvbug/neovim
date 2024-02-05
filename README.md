

<p align="center"> <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png"> </p>

<p align="center"> <img src="https://img.shields.io/badge/License-GPLv3-blue.svg"> <img height=21  src="https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white"> </p>


# Introduction
A fork of VIM, Neovim is brilliant, blazingly fast, highly configurable modal editor.
This repo helps you get started with using Neovim, giving you practical tips and provide necessary instructions to customise your IDE way you want it.

I have tried configuring Neovim using Package Managers like with Packer & Vim Plug beofe but have recently migrated to Lazy which seems to be more structured. 

Here's the snapshot of my configuration in action.

< My Neovim IDE - Screenshot/Video goes here - Using Screecast>

### Note
* This is going to be challenging .. but what's the fun if it's easy  
* You need to have lot of patience.. so take small steps  
* Give yourself enough time to learn as Vi/Vim has a steep learning curve   
* Finally, read..read...read lots of documentation  

# Learning Path
Before you go down this path, there are few things to keep in mind :


1. Understand Vi/Vim motion, objects
2. Learn Lua - A lightweight scripting language
3. Get basic understanding of VimScript and Lua structure 
4. Understand relationship between Vim & NeoVim 

---

# Neovim Installation

| os | command | config file location|  
| --- | --- | ---|
| mac | *`brew install neovim`* | **`~/.config/nvim/`** | 
| arch  | *`sudo pacman -S neovim`* | **`~/.config/nvim/`** | 
| debian | *`sudo apt-get install neovim`* | **`~/.config/nvim/`** | 

---

# Other Prerequisities
Some additional installations are required on your machine. LSP & DAP servers, linter and formatter can all be installed using `Mason` neovim plugin :

| tools | command | description |  
| --- | --- | ---|
| fd |*`brew install fd`* | Alternative to find command |
| ripgrep |*`brew install ripgrep`* | Real time grep |
| lazygit | *`brew install lazygit`* | amazing UI for git |
| tmux | *`brew install tmux`*| Terminal Multiplexer|
| npm | *`brew install npm`*| To install tsserver via Mason + Markdown |
| python | *`brew install python`* | Install python |
| rust | *`brew install rust`*| Rust compilers and toolchain|
| yarn | *`brew install yarn`* | For Markdown preview |

---

# Folder Structure

This is how the folder structure looks like. All the folders should be under `$HOME/.config/nvim` 

<p align="center"> <img src="https://github.com/rvbug/neovim/assets/10928536/01503db1-418b-422c-b8d1-c363e3bd61c0" height=500 width="500" /> </p>

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

---

# Notes
This section will help you understand the structure of the neovim config. 

*`Language Server Protocol`* - LSP Config is the most challenging part of the configration. It uses open json rpc standard to communicate with IDE.   
*`Autocompletion engine`* - Uses 3rd party sources for completion, snippets, suggestions etc.  

## *Lua Table*
Lua is a very simple scripting language. It has one important data structure called table. Knowing how it works helps understand the structure of neovim packages and setup. 

Look at the tree structure below. You will see `ns` as a table with a global namespace.
It contains `config`, `functions` as sub table.  "Language" is an option under global_ns.config table

![image](https://github.com/rvbug/neovim/assets/10928536/c229c4be-0fc5-4cd2-be4b-5b1c71b57eb8)

```lua

ns = {}

--sub tables
ns.config = {
    language = "Lua",
}

ns.functions = {
   square = function(x) return x * x end
}

ns.message = "this is global variable"

-- dictionary
ns.external_data = {
   key_one = "value_one",
   key_two = 123
} 

ns.coroutine = coroutine.create(function()
   ...
end)

-- Example usage:
print(ns.config.language)  
print(ns.functions.square(5))  
print(ns.message)  
print(ns.external_data.key2) 


```


## *Additional info*
| command | description 
| --- | --- | 
| :h or :help | shows all help options inside of neovim |
| `:h <command name>` | displays help for that command or function | 
| :option | displays all options available |
| :h vim. | This is a neovim global table   | 
| :InspectTree | Shows the AST for the languge opened in the buffer |

## *Vim - Neovim Mapping*
|vim cmd | vim option | Nvim| Description |
|  --- | --- | --- | --- |
| :set  | vim.o is variable | vim.opt is table | difference between vim & lua| 
| :set nu | vim.o.number <br>vim.cmd("set number") | vim.opt.number<br>vim.api.nvim_set_option('number', true) | multiple ways to set number  |
  

---

# Packages 

Here are the list of packages that is being used to get you started. 

| file name| Package | Type | Description |
| --- |--- | --- | ---| 
|*init.lua*| lazy.nvim  | Package Manager | Helps install other packages and extends your IDE |
|*themes.lua*| tokyodark.nvim | Color Theme | It's personal choice. I use 'tokyodark' theme. |
|*nvim-tree.lua*| nvim-tree | Packages | This is a file explorer tree package. It has dependency on nvim-web-devicons |
|*telescope.lua*| telescope.nvim | Package |  Fuzzy Finder |
|*treesitter*| nvim-treesitter | Package |A parser generator tool, I have configured for Lua, JS, Rust, Python, HTML, CSS, Markdown. |
|*lualine.lua*| lualine.nvim | Package | Status line theme and configuration |
|*autopairs.lua*| autopairs | Package | Autocompletion of brackets  |
|*gitsigns.lua*| git-signs | Package | Git integration for buffers  |
|*gitblame.lua*| Git Blame | Package | Shows Git changes & owner |
|*comments.lua*| comments | Package | smart block commenting |
|*floating-help.lua*| |Package | Floaing help |
|*neorg.lua*| neorg | Package | Emacs Org more equivalent for Neovim  |
|*greetings.lua* | alpha-nvim | Package | Dashboard or Welcome page |
|*noice.lua* | noice | Package | UI for commandline, popup and messages |
|*toggleterm.lua*| toggle term | Package | terminal for neovim |  
|*markdown.lua*| Markdown  | Package | Show Markdown preview |
|*quarto.lua*| Quarto | Package | Support for Quarto files |
|*iron.lua* | Iron | Package | Interactive REPL on neovim | 
|*db.lua*| vim-dadbod | DB | Plugin to interact with the DB|
|*db.lua*| vim-dadbod-ui| DB UI | UI plugin for DB |
|*db.lua*| vim-dadbod-completion | DB | Completion engine for DB |
|*completions.lua*| cmp-path <br> cmp-cmdline|Package| helps in autocomplete <tab> on commandline|
|*lspconfig.lua*| Mason| LSP Plugin |Allows to manage external tools like LSP & DAP servers, linters & formatters through its UI |
|completions|mason-tool-installer | LSP | Helps installing 3rd party tools |
|*completions.lua*| nvim-cmp | LSP | A snippet engine which is used as a source and also for snippet "expansion" for nvim-cmp|
|*completions.lua*| luasnip | LSP  | used as a luasnip completion source for nvim-cmp, it supplies info to nvim-cmp to display and luasnip will expand it|
|*completions.lua*| cmp.luasnip | LSP | used as a luasnip completion source for nvim-cmp, it supplies info to nvim-cmp to display and luasnip will expand it|
|completions| friendly-snippets | LSP | Collection of snippets for all programming languages loaded by luasnip|
|completions| cmp-nvim-lsp | LSP | A completion source for nvim-cmp to display whatever lsp is attached to the buffer|
|completions| none-ls| LSP | fork of null-ls, it helps in LSP diagnostics, code-actions and much more|


---

# Basic Editor Configuration 
This is the basic configuration I use in **`keymaps.lua`**. 

| Commands | Description |
| --- | ---|
| `:set number` | show line numbers | 
| `:set relativenumber` | show line number relative to the cursor| 
| `:set tabstop=2` | number of space for <tab> | 
| `:set expandtab` | number of space for <tab> in insert mode| 
| `:set shiftwidth` | number of space for (auto) indent | 
| `vim.opt.ignorecase = true`|  switch off case sensitive | 
| `vim.opt.wrap = false` | set line wraps off | 
| `vim.opt.splitbelow` | always split below by default | 
| `vim.opt.splitright` | slipt wiondow to right by default| 
| `:checkhealth` | check the status of your neovim, LSP, linters etc| 




# Keymaps
The keyboard shortcut for specific commands used in **`keymaps.lua`**. 
> *I am planning to switch to tmux shortly for window and tile*

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
|`<leader>tt` | `:ToggleTerm<cr>`| toggle terminal | 

---

# Telescope     
Description: A nice Fuzzy finder package. It internally uses fd, ripgrep for finding files. As prequisties you have to install fd, ripgrep as mentioned on the "Other Prerequisities" section above.  

## *Telescope Key Mapping*
| keyboard mapping | mapped to |Description |
| --- | ---| --- |
| `<leader>ff` | `:Telescope find_files<cr>` |find files |
| `<leader>fg` | `:Telescope live_grep<cr>` |live grep | 
| `<leader>fc` | `:Telescope grep_string<cr>` |find string under cursor | 
| `<leader>fb` | `:Telescope buffers<cr>` |list all open buffers | 
| `<leader>fh` | `:Telescope help_tags<cr>` |list all help tags | 

---

# Comments
Description: Comments a line or block of code using the below keystrokes. Extremely helpful!
You can find more shortcuts on their [github repo](https://github.com/numToStr/Comment.nvim) 

| keystroke | action | 
| --- | --- | 
| `gcc` | Toggles the current line using linewise comment |
| `gbc` | Toggles the current line using blockwise comment | 
| `[count]gcc` | Toggles the number of line given as a prefix-count using linewise | 
| `[count]gbc`  | Toggles the number of line given as a prefix-count using blockwise |

---

# Completions
Description: A completion engine plugin for neovim written in Lua. 

| keystroke | action | 
| --- | --- | 
| `<C-b>` |  Sroll backward | 
| `<C-f>` |  Sroll forward | 
| `<C-Space>` | Completion | 

---

# Nvim-Tree
Description: By default, Neovim uses Netrw for file explorer. nvim-tree is a nice replacement for that. 

| keystroke | action | 
| --- | --- | 
| `<c-n>` | Toggle File explorer| 


# Treesitter 
Description: Parser generator tool and an incremental parsing library.

| keystroke | action | 
| --- | --- | 
| `<leader>gi` | Init selection | 
| `<leader>ni` | node incremement | 
| `<leader>nd` | node decrement | 
| `<leader>si` | scope increment | 

# Floating Help 
Description: Show help in a floating window

| keystroke | action | 
| --- | --- | 
| `<leader>f` | FloatingHelpToggle |
| `<leader>h` | FloatingHelp <variable> |

# Nvim-Tree
Description: By default, Neovim uses Netrw for file explorer. nvim-tree is a nice replacement for that. 

| keystroke | action | 
| --- | --- | 
| `<leader>gb` | :GitBlameToggle | 



# Python Setup
To setup neovim for python and datascience, here are some of the steps to be followed
- In your virtual env , install *neovim* & *debugpy* along with other datascience/ML libraries  
- Ensure you install *pyright* python LSP in your *`lspconfig.lua`* file  

# Markdown & Quarto 
Neovim has extension to edit .md and .qmd files. For this to run following should be installed on your machine along with [iron.nvim](https://github.com/Vigemus/iron.nvim).  
First you need to enable virtual env if you are working on any Data Science or ML project. Here's my [Cookie-ml](https://github.com/rvbug/cookie-ml) setup.
After you have enabled you need to install the following libraries
* *`pip3 install Ipython`*
* *`pip3 install quarto`*

| keystroke | action | 
| --- | --- | 
| `<leader>sc` | visual_send | 
| `<leader>if` | send_file | 
| `<leader>il` | send_line | 
| `<leader>iq` | exit | 
| `<leader>ii` | start repl | 
| `<leader>ir` | iron restart | 
| `<leader>ii` | iron focus | 
| `<leader>ih` | iron hide | 




# Tmux
Tmux is a terminal
multiplexer which helps you create multiple terminals at once.
| keystroke | action | 
| --- | --- | 
| c-b | Leader key |
| c-b<c> | create a new tab |


---
# Future
* DAP Setup
* Vim Pencil

