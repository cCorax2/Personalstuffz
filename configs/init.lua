--using packer as package manager
--require("configs.base_settings")
require('packer').startup(function(use)
  --packer itself
    use 'wbthomason/packer.nvim'

    --some juicy gruvbox colorscheme
    use 'ellisonleao/gruvbox.nvim'
    vim.cmd('colorscheme gruvbox')
    
    --nice ugly statusbar
    use 'datwaft/bubbly.nvim'

end)


--base settings
vim.cmd [[
    "transcparency
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none

    "line numbers
    set relativenumber
    set cursorline
    set nu

    "replace tab two spaces and other options
    set tabstop=2
    set shiftwidth=2
    set expandtab
    set smartindent
    set termguicolors

    "Make space character visible for indention
    set list
    set lcs+=space:.
]]

