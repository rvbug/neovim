
# Introduction
A fork of VIM, Neovim is brilliant, blazingly fast, highly configurable modal editor.
This repo helps you get started with using Neovim, give you practical tips and provide necessary instructions to customise the way you want it.

Here's the snapshot of my configuration in action.

< My Neovim IDE - Screenshot/Video goes here >

### Note
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

---

# Installation

| os | command | config file|  
| --- | --- | ---|
| mac | *`brew install neovim`* | **`~/.config/nvim/`** | 
| arch  | *`sudo pacman -S neovim`* | **`~/.config/nvim/`** | 
| debian | *`sudo apt-get install neovim`* | **`~/.config/nvim/`** | 


---

# Folder Structure

This is how the folder structure looks like. All the folders should be under `$HOME/.config/nvim` 

![image](https://github.com/rvbug/nvim/assets/10928536/9dc8e3a4-4ab7-4ff6-b34c-63c5ecbbfc02)

#### `init.lua` 
This is where nvim looks everytime it loads. The lazy package manager is installed and setup here <br>


####  `lua/plugins/`

The best way to keep everything modularize is to split your plugings into their own separate files and add it under this directory.Lazy will automatically detect any changes on this folder and loads it. 

This file should always return a table and ad all the additional settings for that plugins inside the function like shown below. If you are using a different package manager like 'Packer' then the approach is different. 

See the sample setup for `lua/plugins/themes.lua`. This is the same approach for most of the plugins unless specified differently in their documentation. 

> *Note: I am still experimenting with moving all the keybindings to keymaps.lua file versus keeping it under their respective plugin file.*

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

**`Language Server Protocol`** - LSP Config is the most challenging part of the configration which uses open json rpc standard.   
**`Autocompletion engine`** - Uses 3rd party sources for completion, snippets suggestions.  

## Lua Table
Lua is a very simple language and has one important data structure called as table. It is important to know how it works to understand the internals and structure of neovim.

Look at the image below. You will see `global_ns` as a table with global namespace.
It contains `config`, `functions` as sub table.

![image](https://github.com/rvbug/neovim/assets/10928536/c229c4be-0fc5-4cd2-be4b-5b1c71b57eb8)

```lua

-- to understand how lua tables are used, what is vim.opt, vim.bo etc
-- this is one way to understand it 


global_ns = {}

--sub tables
global_ns.config = {

}

global_ns.functions = {
   square = function(x) return x * x end
}

global_ns.message = "this is global variable"

-- dictionary
global_ns.external_data = {
   key_one = "value_one",
   key_two = 123
} 

global_ns.coroutine = coroutine.create(function()
   ...
end)

-- Example usage:
print(global_ns.config.language)  
print(global_ns.functions.square(5))  
print(global_ns.message)  
print(global_ns.external_data.key2) 


```


## Additional info
| command | description 
| --- | --- | 
| :h or :help | shows all help options inside of neovim |
| :option | displays all options available |
| Tables | Lua has tables which are data struc contains elements inside them |
| :h vim. | This is a neovim global table   | 

## Vim - Neovim Mapping 
| Type | vim cmd | vim option | Nvim| Description |
| --- | --- | --- | --- | --- |
| general | :set  | vim.o is variable | vim.opt is table | difference between vim & lua| 
| command | :set nu | vim.o.number <br>vim.cmd("set number") | vim.opt.number<br>vim.api.nvim_set_option('number', true) | multiple ways to set number  |


---

# Additional Installation
Some additional installation required on your machine, the other LSP & DAP servers, linter and formatter can be installed using `Mason` neovim plugin :
 
`brew install tmux` - Installing tmux   
`brew install npm` - To install tsserver via Mason  
`brew install python` - Python   
`brew install rust` - Rust compilers and toolchain    

---

# Packages 

Here are the list of packages that is being used to get you started. 

| Package | Type | Description |
|--- | --- | ---| 
| lazy.nvim  | Package Manager | Helps install other packages and themes |
| nightfox.nvim | Color Theme | It's personal choice. I use 'egde' theme |
| nvim-tree | Packages | This is a file explorer tree package. It has dependency on nvim-web-devicons |
| telescope.nvim | Package |  Fuzzy Finder |
| nvim-treesitter | Package |A parser generator tool, I have configured for Lua, JS, Rust, Python, HTML, CSS, Markdown. |
| lualine.nvim | Package | Status line theme and configuration |
| autopairs | Package | Autocompletion of brackets  |
| git-signs | Package | Git integration for buffers  |
| comments | Package | smart block commenting |
| neorg | Package | Emacs Org more equivalent for Neovim  |
| cmp-path <br> cmp-cmdline|Package| helps in autocomplete <tab> on commandline|
| Mason| LSP Plugin |Allows to manage external tools like LSP & DAP servers, linters & formatters through its UI | 
| nvim-cmp | LSP | A snippet engine which is used as a source and also for snippet "expansion" for nvim-cmp|
| luasnip | LSP  | used as a luasnip completion source for nvim-cmp, it supplies info to nvim-cmp to display and luasnip will expand it|
| cmp.luasnip | LSP | used as a luasnip completion source for nvim-cmp, it supplies info to nvim-cmp to display and luasnip will expand it|
| friendly-snippets | LSP | Collection of snippets for all programming languages loaded by luasnip|
| cmp-nvim-lsp | LSP | A completion source for nvim-cmp to display whatever lsp is attached to the buffer|
| none-ls| LSP | fork of null-ls, it helps in LSP diagnostics, code-actions and much more|

---

---

# Basic Configuration keymaps
This is the basic configuration I use in **`options.lua`**. 

| Commands | Description |
| --- | ---|
| `:h <command name>` | displays help | 
| `:set number` | show line numbers | 
| `:set relativenumber` | show line number relative to the cursor| 
| `:set tabstop=2` | number of space for <tab> | 
| `:set expandtab` | number of space for <tab> in insert mode| 
| `:set shiftwidth` | number of space for (auto) indent | 


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


---

## Telescope     
Description: A nice Fuzzy finder package. It internally uses fd, ripgrep for finding files.   
#### Prequisties 
Install fd, ripgrep on your machine

**`brew install fd`** - Alternative to *find* command  
**`brew install ripgrep`** - Real time grep  

### Telescope Key Mapping
| Package | keyboard mapping | mapped to |Description |
|--- | --- | ---| --- |
| Telescope | `<leader>ff` | `:Telescope find_files<cr>` |find files |
| Telescope | `<leader>fg` | `:Telescope live_grep<cr>` |live grep | 
| Telescope | `<leader>fc` | `:Telescope grep_string<cr>` |find string under cursor | 
| Telescope | `<leader>fb` | `:Telescope buffers<cr>` |list all open buffers | 
| Telescope | `<leader>fh` | `:Telescope help_tags<cr>` |list all help tags | 



# Future
- DAP Setup for Python and Rust




## 
