local function bind(op, outer_opts)
  outer_opts = vim.tbl_extend("force", { noremap = true, silent = true }, outer_opts or {})

  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

local map = bind("")
local nmap = bind("n", { noremap = false })
local nnoremap = bind("n")
local vnoremap = bind("v")
local xnoremap = bind("x")
local inoremap = bind("i")
local tnoremap = bind("t")

local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

-- normal
nnoremap("<space>", "<nop>")

-- Map Oil to <leader>e
nnoremap("<leader>e", function()
  require("oil").toggle_float()
end)

-- Save with leader key
nnoremap("<leader>w", "<cmd>w<cr>", { silent = false })
nnoremap("<C-s>", "<cmd>w<cr>", { silent = false })

-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>", { silent = false })

-- Save and Quit with leader key
nnoremap("<leader>z", "<cmd>wq<cr>", { silent = false })

-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")

-- Turn off highlighted results
nnoremap("<leader>no", "<cmd>noh<cr>")

-- Press leader f to format
nnoremap("<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "Format the current buffer" })

-- Press 'S' for quick find/replace for the word under the cursor
nnoremap("S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Open Spectre for global find/replace
nnoremap("<leader>S", function()
  require("spectre").toggle()
end)

-- Press 'C-h', 'C-l' to jump to start/end of a line (first/last char)
nnoremap("<C-l>", "$")
nnoremap("<C-h>", "^")

-- Press gx to open the link under the cursor
nnoremap("gx", ":sil !open <cWORD><cr>", { silent = true })

-- Harpoon keybinds --
-- Open harpoon ui
nnoremap("<leader>ho", function()
  harpoon_ui.toggle_quick_menu()
end)

-- Add current file to harpoon
nnoremap("<leader>ha", function()
  harpoon_mark.add_file()
end)

-- Remove current file from harpoon
nnoremap("<leader>hr", function()
  harpoon_mark.rm_file()
end)

-- Remove all files from harpoon
nnoremap("<leader>hc", function()
  harpoon_mark.clear_all()
end)

-- Quickly jump to harpooned files
nnoremap("<leader>1", function()
  harpoon_ui.nav_file(1)
end)

nnoremap("<leader>2", function()
  harpoon_ui.nav_file(2)
end)

nnoremap("<leader>3", function()
  harpoon_ui.nav_file(3)
end)

nnoremap("<leader>4", function()
  harpoon_ui.nav_file(4)
end)

nnoremap("<leader>5", function()
  harpoon_ui.nav_file(5)
end)

-- Telescope keybinds --
nnoremap("<leader>sf", function()
  require("telescope.builtin").find_files({ hidden = true })
end, { desc = "[S]earch [F]iles" })
nnoremap("<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
nnoremap("<leader>sb", require("telescope.builtin").buffers, { desc = "[S]earch Open [B]uffers" })
nnoremap("<leader>sc", function()
  require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
    previewer = false,
  }))
end, { desc = "[S]earch [C]ommands" })

-- nvim-ufo keybinds
nnoremap("zR", require("ufo").openAllFolds)
nnoremap("zM", require("ufo").closeAllFolds)

-- insert
inoremap("<C-s>", "<cmd>w<cr><esc>", { silent = false })

-- Map jj to <esc>
inoremap("jj", "<esc>")

-- Visual --
-- Disable Space bar since it'll be used as the leader key
vnoremap("<space>", "<nop>")

-- Press 'C-h', 'C-l' to jump to start/end of a line (first/last char)
vnoremap("<C-l>", "$")
vnoremap("<C-h>", "^")

-- Paste without losing the contents of the register
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

-- Reselect the last visual selection
xnoremap("<<", function()
  xnoremap("<leader>p", '"_dP')

  -- Move selected text up/down in visual mode
  vim.cmd("normal! <<")
  vim.cmd("normal! gv")
end)

xnoremap(">>", function()
  vim.cmd("normal! >>")
  vim.cmd("normal! gv")
end)

-- Terminal --
-- Enter normal mode while in a terminal
tnoremap("<esc>", [[<C-\><C-n>]])
tnoremap("jj", [[<C-\><C-n>]])
