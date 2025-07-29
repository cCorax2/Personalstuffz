-------------------------
-- BASE EDITOR CONFIG   |
-- ----------------------

--variables
local o = vim.o
local g = vim.g
local cmd = vim.cmd
local keybind = vim.keymap.set

--line options
o.number = true
o.relativenumber = true
o.cursorline = true

--tab to space and other indent options
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.swapfile = false
o.wrap = false
o.signcolumn = "yes"
o.winborder = "rounded"
o.termguicolors = true

--keybinds
g.mapleader = " "
keybind('n', '<leader>o', ':update<CR> :source<CR>')
keybind('n', '<leader>w', ':w<CR>')
keybind('n', '<leader>q', ':q<CR>')
keybind('n', '<leader>lf', vim.lsp.buf.format)
keybind('n', '<leader>f', ':Pick files<CR>')
keybind('n', '<leader>e', ':Oil<CR>')
keybind('i','<C-space>',vim.lsp.completion.get)
--keybind('n', '','')
------------------------------
---      PACK MANANER        |
--- --------------------------
vim.pack.add({
  --Colorscheme
  { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/echasnovski/mini.pick' },
  { src = 'https://github.com/neovim/nvim-lspconfig' }
  --{ src = 'https://github.com/'}
})

require "mini.pick".setup()
require "oil".setup()
------------------------------
---       COLORSCHEME        |
------------------------------

--Check gruvbox is installed
local status, _ = pcall(cmd, "colorscheme gruvbox")
if not status then
  print("!!!!  GRUVBOX NOT INSTALLED !!!!")
else
  cmd("colorscheme gruvbox")
end

--visual things like transparent bg and remove the gray bg under statusline
cmd [[
hi statusline guibg=none
hi statusline ctermbg=none
hi Normal guibg=none
hi Normal ctermbg=none
hi NonText guibg=none
hi NonText ctermbg=none

set clipboard+=unnamed
]]

------------------------------
---    LSP CONFIG            |
------------------------------
vim.lsp.config['lua_ls'] = {
  cmd = { '/home/shino/lua-language-server/bin/lua-language-server' },
}


vim.lsp.enable({ "lua_ls" })

vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    print("LspAttach fired, client id:", ev.data.client_id, "buf:", ev.buf)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      print("Completion enabled for client:", client.name)
    else
      print("No client found")
    end
  end,
})
