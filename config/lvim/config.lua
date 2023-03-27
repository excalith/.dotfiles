-- Neovim API aliases
local exec = vim.api.nvim_exec 	-- execute Vimscript
local cmd = vim.cmd     		    -- execute Vim commands
local opt = vim.opt         	  -- global/buffer/windows-scoped options
local fn = vim.fn       		    -- call Vim functions
local g = vim.g         		    -- global variables

-- Requires
require("eslint").setup()
require('mini.map').setup()

-- General
lvim.log.level = "info"

-- Generic settings
lvim.colorscheme = "horizon"
lvim.lint_on_save = true
lvim.format_on_save = false
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.lualine.style = "lvim"
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.highlight.enable = true

-- General
opt.shell = "/bin/sh"
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false           -- don't use swapfile
opt.wrap = true               -- line wrapping
opt.linebreak = false         -- don't split words

-- Neovim UI
opt.syntax = 'enable'       -- enable syntax highlighting
opt.number = true           -- show line number
opt.showmatch = true        -- highlight matching parenthesis
opt.relativenumber = false  -- show relative distance between rows
opt.scrolloff = 100         -- keep 10 row buffer on screen edges
opt.foldmethod = 'marker'   -- enable folding (default 'foldmarker')
opt.colorcolumn = '120'     -- line length marker at 80 columns
opt.splitright = true       -- vertical split to the right
opt.splitbelow = true       -- horizontal split to the bottom
opt.ignorecase = true       -- ignore case letters when search
opt.smartcase = true        -- ignore lowercase for the whole pattern
opt.hlsearch = false        -- remove highlighting after search

-- Tabs, indent
opt.expandtab = true     -- use tabs instead of spaces
opt.shiftwidth = 3       -- shift 3 spaces when tab
opt.tabstop = 3          -- 1 tab == 3 spaces
opt.smartindent = true   -- autoindent new lines

-- Keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.which_key.mappings["q"] = {
    "<cmd>:quitall<CR>", "Quit"
}

lvim.builtin.which_key.mappings["r"] = {
    "<cmd>:NvimTreeRefresh<CR>", "Refresh explorer"
}

lvim.builtin.which_key.mappings["t"] = {
    "<cmd>:FloatermToggle<CR>", "Toggle Terminal"
}

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  h = { "<cmd>Telescope help_tags<cr>", "Help" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  l = { "<cmd>Telescope resume<cr>", "Last Search" },
  r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  f = { "<cmd>Telescope find_files<cr>", "Find files" },
  t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  s = { "<cmd>Telescope grep_string<cr>", "Find String" },
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  H = { "<cmd>Telescope highlights<cr>", "Highlights" },
  c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  R = { "<cmd>Telescope registers<cr>", "Registers" },
}

-- Telescope settings
lvim.builtin.telescope = {
  active = true,
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.85,
      height = 0.80,
      preview_cutoff = 120,
    },
    winblend = 0,
    path_display = { "truncate" },
    file_ignore_patterns = { "node_modules" },
    color_devicons = true,
    border = {},
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  }
}

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- Treesitter settings
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

-- Linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua" },
  {
    command = "prettier",
    extra_args = { "--print-width", "100" },
    filetypes = { "typescript", "typescriptreact" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    args = { "--severity", "warning" },
  },
}

lvim.builtin.nvimtree.setup.filters.custom = { "node_modules", ".git", ".next", ".DS_Store"}

lvim.builtin.telescope.defaults.file_ignore_patterns = {
  ".git/",
  "vendor/*",
  "%.lock",
  "__pycache__/*",
  "%.sqlite3",
  "%.ipynb",
  "node_modules/*",
  "%.jpg",
  "%.jpeg",
  "%.png",
  "%.svg",
  "%.otf",
  "%.ttf",
  "%.webp",
  ".dart_tool/",
  ".github/",
  ".gradle/",
  ".idea/",
  ".settings/",
  ".vscode/",
  "__pycache__/",
  "build/",
  "env/",
  "gradle/",
  "node_modules/",
  "%.pdb",
  "%.dll",
  "%.class",
  "%.exe",
  "%.cache",
  "%.ico",
  "%.pdf",
  "%.dylib",
  "%.jar",
  "%.docx",
  "%.met",
  "smalljre_*/*",
  ".vale/",
  "%.burp",
  "%.mp4",
  "%.mkv",
  "%.rar",
  "%.zip",
  "%.7z",
  "%.tar",
  "%.bz2",
  "%.epub",
  "%.flac",
  "%.tar.gz",
}

-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
      {"lunarvim/horizon.nvim"},
      {"echasnovski/mini.nvim"},
      {"voldikss/vim-floaterm"},
      {'neovim/nvim-lspconfig'},
      {'jose-elias-alvarez/null-ls.nvim'},
      {'MunifTanjim/eslint.nvim'}
}
