require('base')
require('highlight')
require('maps')
require('plugins')
require('lualine').setup()

vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
vim.cmd [[silent! colorscheme tokyonight]]
vim.cmd [[highlight Normal ctermbg=NONE guibg=NONE]]
local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('macos')
end
if is_win then
end

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "cuda" },
  sync_install = true,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
