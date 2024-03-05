vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("edit_text", { clear = true }),
  pattern = { "gitcommit", "markdown", "txt" },
  desc = "Enable spell checking and text wrapping for certain filetypes",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("WinResize", { clear = true }),
  pattern = "*",
  command = "wincmd =",
  desc = "Auto-resize windows on terminal buffer resize.",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("vertical_help", { clear = true }),
  pattern = "help",
  callback = function()
    vim.bo.bufhidden = "unload"
    vim.cmd.wincmd("L")
    vim.cmd.wincmd("=")
  end,
})
