local g   = vim.g
local o   = vim.o
local opt = vim.opt
local a   = vim.api
local ok, _ = pcall(vim.cmd, 'colorscheme onedark')

a.nvim_command('filetype plugin indent on')
o.termguicolors = true
o.background = 'dark'
o.timeoutlen = 500
o.updatetime = 200
o.scrolloff = 8
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
o.clipboard = 'unnamedplus'
o.ignorecase = true
o.smartcase = true
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.history = 50
o.splitright = true
o.splitbelow = true
o.foldmethod = 'indent'
o.foldlevelstart = 99
o.foldnestmax = 3
o.foldminlines = 1
opt.mouse = "a"
g.mapleader = ' '
g.maplocalleader = ' '
a.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

-- Mapping Keys
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Load recent sessions
map('n', '<leader>sl', '<CMD>SessionLoad<CR>')

-- Keybindings for telescope
map('n', '<leader>fr', '<CMD>Telescope oldfiles<CR>')
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
map('n', '<leader>fb', '<CMD>Telescope file_browser<CR>')
map('n', '<leader>fw', '<CMD>Telescope live_grep<CR>')
map('n', '<leader>ht', '<CMD>Telescope colorscheme<CR>')
map('n', '<leader>fp',"<CMD>lua require'telescope'.extensions.project.project{}<CR>")

-- Remap splits navigation to just CTRL + hjkl
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Make adjusing split sizes a bit more friendly
map('n', '<C-8>', '<CMD>vertical resize +3<CR>') --some how doesnot work
map('n', '<C-9>', '<CMD>vertical resize -3<CR>')
map('n', '<C-0>', '<CMD>resize +3<CR>')
map('n', '<C-->', '<CMD>resize -3<CR>')

-- Change 2 split windows from vert to horiz or horiz to vert
map('n', '<Leader>th', '<C-w>t<C-w>H')
map('n', '<Leader>tk', '<C-w>t<C-w>K')

-- Bar bar
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
map('n', '<A-.>', '<Cmd>BufferNext<CR>')
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>')
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>')
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
map('n', '<A-0>', '<Cmd>BufferLast<CR>')
map('n', '<A-p>', '<Cmd>BufferPin<CR>')
map('n', '<A-c>', '<Cmd>BufferClose<CR>')
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>')
-- Sort automatically by...
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>')
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>')
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>')
map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>')

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

--NVIM TREE
map('n', '<leader>b', '<Cmd>NvimTreeFocus<CR>')
