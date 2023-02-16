vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Shift selection in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Yank from the cursor until the end
vim.keymap.set("n", "Y", "yg$")

-- Lift line below without moving the cursor
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Clipboard copy/paste
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>p", "\"+p")

-- Smart paste
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Quick semicolon/comma
vim.keymap.set("i", "<A-;>", "<Esc>A;<Esc>")
vim.keymap.set("n", "<A-;>", "A;<Esc>")
vim.keymap.set("i", "<A-,>", "<Esc>A,<Esc>")
vim.keymap.set("n", "<A-,>", "A,<Esc>")
vim.keymap.set("x", "<A-,>", "$A,<Esc>")

vim.keymap.set("n", "<leader>'", "i''<Esc>i")
vim.keymap.set("n", "<leader>\"", "i\"\"<Esc>i")

if vim.g.vscode then
  -- VSCode Neovim
  vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

  -- Go over folds
  vim.keymap.set("n", "j", "gj")
  vim.keymap.set("n", "k", "gk")

  vim.cmd([[
    nnoremap <silent> <Tab> <Cmd>call VSCodeNotify('editor.action.indentLines')<CR>
    nnoremap <silent> <S-Tab> <Cmd>call VSCodeNotify('editor.action.outdentLines')<CR>
    xnoremap <silent> <S-Tab> <Cmd>call VSCodeNotifyVisual('editor.action.outdentLines', 1)<CR>
    xnoremap <silent> <Tab> <Cmd>call VSCodeNotifyVisual('editor.action.indentLines', 1)<CR>
  ]])
else
  -- ordinary Neovim

  -- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
  vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)


  -- easier indents
  vim.keymap.set("v", "<", "<gv")
  vim.keymap.set("v", ">", ">gv")

  -- Preserve jump to [n]ewer before it gets remapped
  local ci_key = vim.api.nvim_replace_termcodes('<C-i>', true, false, true)
  vim.keymap.set('n', '<C-n>', function() 
    vim.api.nvim_feedkeys(ci_key, 'n', false) 
  end,
  { desc = 'Jump to [n]ewer' })

  vim.keymap.set('n', '<Tab>', '>>')
  vim.keymap.set("n", "<S-tab>", "<<")
  vim.keymap.set("x", "<Tab>", ">gv")
  vim.keymap.set("x", "<S-tab>", "<gv")
  vim.keymap.set("i", "<S-tab>", "<Esc><<i")

  -- Auto-center on page move
  vim.keymap.set("n", "<C-d>", "<C-d>zz")
  vim.keymap.set("n", "<C-u>", "<C-u>zz")

  -- Quick format
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
  end)

  -- replace all under cursor
  vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

  -- Quick fold
  vim.keymap.set("n", "<C-K>", "zc")
  vim.keymap.set("n", "<C-J>", "zo")

end

-- Smart cut
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<Nop>")
