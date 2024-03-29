function fn_docker_compose()
	local filename = vim.fn.expand("%:t")

	if filename == "docker-compose.yaml" then
		vim.bo.filetype = "yaml.docker-compose"
	end
end

vim.cmd([[au BufRead * lua fn_docker_compose()]])


-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("rip_highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("rip_wrap_spell", { clear = true }),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
