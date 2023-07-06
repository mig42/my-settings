-- Move highlighted lines with J (up) and K (down)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep cursor in place when joining lines
--vim.keymap.set('n', 'J', 'mzJ`z')

-- Keep cursor in place when moving half page
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Keep cursor in the middle when browsing search results
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste while keeping the yanked text in the buffer
vim.keymap.set('x', '<leader>p', '"_dP')

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Delete to void registry (don't keep deleted contents in buffer)
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')
vim.keymap.set('n', '<leader>x', '"_x')
vim.keymap.set('v', '<leader>x', '"_x')

-- Disable Q
vim.keymap.set('n', 'Q', '<nop>')

-- Format (to investigate)
vim.keymap.set('n', '<leader>f', function ()
    vim.lsp.buf.format()
end)

-- To investigate
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- Start replacing the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- BarBar remaps
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', 'gT', '<Cmd>BufferPrevious<CR>', opts)
map('n', 'gt', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<leader>mtl', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<leader>mtr', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader>t1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>t2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>t3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>t4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>t5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>t6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>t7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<leader>t8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<leader>t9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<leader>t0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<leader>tp', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<leader>ct', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
map('n', '<leader>cat', '<Cmd>BufferWipeout<CR>', opts)
-- Close commands
map('n', '<leader>tcc', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
map('n', '<leader>tcp', '<Cmd>BufferCloseAllButPinned<CR>', opts)
map('n', '<leader>tcl', '<Cmd>BufferCloseBuffersLeft<CR>', opts)
map('n', '<leader>tcr', '<Cmd>BufferCloseBuffersRight<CR>', opts)

-- monaqa/dial.nvim remaps
local dial = require('dial.map')

vim.keymap.set("n", "<C-a>",  dial.inc_normal(), { noremap = true })
vim.keymap.set("n", "<C-x>",  dial.dec_normal(), { noremap = true })
vim.keymap.set("n", "g<C-a>",  dial.inc_gnormal(), { noremap = true })
vim.keymap.set("n", "g<C-x>",  dial.dec_gnormal(), { noremap = true })
vim.keymap.set("v", "<C-a>",  dial.inc_visual(), { noremap = true })
vim.keymap.set("v", "<C-x>",  dial.dec_visual(), { noremap = true })
vim.keymap.set("v", "g<C-a>", dial.inc_gvisual(), { noremap = true })
vim.keymap.set("v", "g<C-x>", dial.dec_gvisual(), { noremap = true })

-- inc-rename
vim.keymap.set('n', '<leader>rn', function()
  return ':IncRename ' .. vim.fn.expand('<cword>')
end, { expr = true })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>pc', builtin.commands, {})

vim.keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>wd', builtin.diagnostics, {})

vim.api.nvim_set_keymap(
  "n",
  "<leader>pv",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

