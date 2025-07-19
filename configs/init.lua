--using packer as package manager
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
    set nu rnu
    set cursorline
]]
