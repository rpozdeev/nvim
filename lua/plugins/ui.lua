return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			theme = "catppuccin",
			options = {
				component_separators = " ",
				section_separators = { left = "", right = "" },
			},
		},
	},
	{ "MunifTanjim/nui.nvim", lazy = true },
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		main = "ibl",
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- 	opts = {
	-- 		presets = {
	-- 			bottom_search = true,
	-- 			command_palette = true,
	-- 			long_message_to_split = true,
	-- 			inc_rename = true,
	-- 		},
	-- 	},
	--
	-- 	keys = {
	-- 		{
	-- 			"<leader>nl",
	-- 			function()
	-- 				require("noice").cmd("last")
	-- 			end,
	-- 			desc = "Noice Last Message",
	-- 		},
	-- 		{
	-- 			"<leader>nh",
	-- 			function()
	-- 				require("noice").cmd("history")
	-- 			end,
	-- 			desc = "Noice History",
	-- 		},
	-- 		{
	-- 			"<leader>na",
	-- 			function()
	-- 				require("noice").cmd("all")
	-- 			end,
	-- 			desc = "Noice All",
	-- 		},
	-- 		{
	-- 			"<leader>nd",
	-- 			function()
	-- 				require("noice").cmd("dismiss")
	-- 			end,
	-- 			desc = "Dismiss All",
	-- 		},
	-- 	},
	-- },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
			{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		},
		opts = {
			options = {
	      -- stylua: ignore
	      close_command = function(n) require("mini.bufremove").delete(n, false) end,
	      -- stylua: ignore
	      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd("BufAdd", {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},
}
