--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "horizon"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.open_on_setup = true
lvim.builtin.nvimtree.setup.filters.dotfiles = false
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.format_on_save = false
lvim.lint_on_save = true

lvim.builtin.which_key.mappings["q"] = {
    "<cmd>:quitall<CR>", "Quit"
}

lvim.builtin.which_key.mappings["r"] = {
    "<cmd>:NvimTreeRefresh<CR>", "Refresh explorer"
}

lvim.builtin.which_key.mappings["t"] = {
    "<cmd>:FloatermToggle<CR>", "Toggle Terminal"
}



-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}


-- Neovim API aliases
local cmd = vim.cmd     		-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       		-- call Vim functions
local g = vim.g         		-- global variables
local opt = vim.opt         	-- global/buffer/windows-scoped options

-- General
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile
opt.wrap = true               -- line wrapping
opt.linebreak = true          -- don't split words

-- Neovim UI
opt.syntax = 'enable'         -- enable syntax highlighting
opt.number = true             -- show line number
opt.showmatch = true          -- highlight matching parenthesis
opt.relativenumber = true     -- show relative distance between rows
opt.scrolloff = 10            -- keep 10 row buffer on screen edges
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
opt.colorcolumn = '120'        -- line length marker at 80 columns
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- horizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.hlsearch = false          -- remove highlighting after search

-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = false     -- use tabs instead of spaces
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 3           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)



-- load required null-ls references
local h = require("null-ls.helpers")
local cmd_resolver = require("null-ls.helpers.command_resolver")
local methods = require("null-ls.methods")
local u = require("null-ls.utils")
local FORMATTING = methods.internal.FORMATTING

-- Define the new javascript formatter
local pe = h.make_builtin({
  name = "prettier_eslint",
  meta = {
    url = "https://github.com/prettier/prettier-eslint-cli",
    description = "Eslint + Prettier",
  },
  method = FORMATTING,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "jsx"
  },
  factory = h.formatter_factory,
  generator_opts = {
    command = "prettier-eslint",
    args = { "--stdin", "--parser", "babel", "--resolve-plugins-relative-to", "~/.nvm/versions/node/v16.16.0/lib" },
    to_stdin = true,
  },
})

-- optional: Define a second formatter for JSON
local pejson = h.make_builtin({
  name = "prettier_eslint_json",
  meta = {
    url = "https://github.com/prettier/prettier-eslint-cli",
    description = "Eslint + Prettier",
  },
  method = FORMATTING,
  filetypes = {
    "json",
    "cjson",
  },
  factory = h.formatter_factory,
  generator_opts = {
    command = "prettier-eslint",
    args = { "--stdin", "--parser", "json" },
    to_stdin = true,
  },
})

-- Enable the the defined formatters
-- if you are using vanilla NeoVim + null-ls please
-- read how to install/enable on
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md 
local nls = require("null-ls")
nls.setup {
  on_attach = require("lvim.lsp").common_on_attach,
  sources = {
    pe,
    pejson
  }
}

-- optional: LunarVim related step. Here we enable eslint as linter for Javascript.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    filetypes = { "javascript" }
  }
}

-- Additional Plugins
lvim.plugins = {
    {
      {"lunarvim/horizon.nvim"},
      {"echasnovski/mini.nvim"},
      {"voldikss/vim-floaterm"},
      {'neovim/nvim-lspconfig'},
      {'jose-elias-alvarez/null-ls.nvim'},
      {'MunifTanjim/eslint.nvim'},
    }
}


require('mini.map').setup()
require("eslint").setup()


