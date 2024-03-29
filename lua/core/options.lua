vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.mouse = "a"
opt.showmode = false
opt.clipboard = "unnamed,unnamedplus"

opt.breakindent = true

opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"

opt.timeoutlen = 5000

opt.splitright = true
opt.splitbelow = true

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.cursorline = true

opt.scrolloff = 10

opt.hlsearch = true

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.softtabstop = 2
opt.autoindent = true

opt.spelllang = { "ru_ru", "en_us" }
opt.spell = true

opt.termguicolors = true

opt.wrap = false

opt.completeopt = { "menu", "menuone", "noselect" }

opt.cursorline = true
opt.colorcolumn = "120"

opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true

opt.swapfile = false
