return {
	{
		"stevearc/oil.nvim",
		opts = {
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
			view_options = {
				show_hidden = true,
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>e", "<cmd>Oil --float<cr>" },
		},
	},
	{
		"nvim-pack/nvim-spectre",
		build = false,
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
          -- stylua: ignore
          keys = {
            { "<leader>sr", function() require("spectre").open() end, desc = "Replace in Files (Spectre)" },
          },
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		vscode = true,
		opts = {},
		  -- stylua: ignore
		  keys = {
		    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		  },
	},
	-- { "tpope/vim-sleuth" },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		keys = {
			{ "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>' },
			{ "<leader>fk", '<cmd>lua require("telescope.builtin").keymaps()<cr>' },
			{ "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>' },
			{ "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>' },
			{ "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>' },
		},
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-x>"] = actions.delete_buffer,
						},
					},
					file_ignore_patterns = {
						"node_modules",
						"yarn.lock",
						".git",
						".sl",
						"_build",
						".next",
						".idea",
						".terraform",
					},
					hidden = true,
				},
			})
			-- pickers = {}
			extensions =
				{
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
				-- Enable telescope fzf native, if installed
				pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
		end,
	},
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			require("mini.pairs").setup()
			require("mini.bufremove").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "TodoTrouble", "TodoTelescope" },
		opts = {
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
		},
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next Todo Comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous Todo Comment",
			},
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
			{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		keys = {
			{
				"zR",
				function()
					require("ufo").openAllFolds()
				end,
				desc = "Open All Folds",
			},
			{
				"zM",
				function()
					require("ufo").closeAllFolds()
				end,
				desc = "Close All Folds",
			},
			{
				"zr",
				function()
					require("ufo").openFoldsExceptKinds()
				end,
				desc = "Open Except Kids",
			},
			{
				"zm",
				function()
					require("ufo").closeFoldsWith()
				end,
				desc = "Close Folds",
			},
		},
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		keys = {
			{
				"<leader>cp",
				ft = "markdown",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
			},
		},
		config = function()
			vim.cmd([[do FileType]])
		end,
	},
	{
		"lukas-reineke/headlines.nvim",
		opts = function()
			local opts = {}
			for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
				opts[ft] = {
					headline_highlights = {},
					-- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
					bullets = {},
				}
				for i = 1, 6 do
					local hl = "Headline" .. i
					vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
					table.insert(opts[ft].headline_highlights, hl)
				end
			end
			return opts
		end,
		ft = { "markdown", "norg", "rmd", "org" },
		config = function(_, opts)
			-- PERF: schedule to prevent headlines slowing down opening a file
			vim.schedule(function()
				require("headlines").setup(opts)
				require("headlines").refresh()
			end)
		end,
	},
}
