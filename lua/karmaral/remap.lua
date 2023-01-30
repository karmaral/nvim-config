vim.g.mapleader = " "

-- shift selection in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- clipboard copy/paste
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>p", "\"+p")

-- smart paste
vim.keymap.set("x", "<leader>p", "\"_dP")

-- quick semicolon/comma
vim.keymap.set("i",  "<A-;>", "<Esc>A;<Esc>")
vim.keymap.set("n",  "<A-;>", "A;<Esc>")
vim.keymap.set("i",  "<A-,>", "<Esc>A,<Esc>")
vim.keymap.set("n",  "<A-,>", "A,<Esc>")
vim.keymap.set("x", "<A-,>", "$A,<Esc>")

vim.keymap.set("n", "<leader>'", "i''<Esc>i")
vim.keymap.set("n", "<leader>\"", "i\"\"<Esc>i")

if vim.g.vscode then
  -- VSCode extension
  vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

  -- go over folds
  vim.keymap.set("n", "j", "gj")
  vim.keymap.set("n", "k", "gk")

  vim.cmd([[
    nnoremap <silent> <Tab> <Cmd>call VSCodeNotify('editor.action.indentLines')<CR>
    nnoremap <silent> <S-Tab> <Cmd>call VSCodeNotify('editor.action.outdentLines')<CR>
    xnoremap <silent> <S-Tab> <Cmd>call VSCodeNotifyVisual('editor.action.outdentLines', 1)<CR>
    xnoremap <silent> <Tab> <Cmd>call VSCodeNotifyVisual('editor.action.indentLines', 1)<CR>
  ]])
  --vim.keymap.set("n", "<Tab>", function() vscode.VSCodeNotify('editor.action.indentLines') end)
  --vim.keymap.set("n", "<S-Tab>", function() vscode.VSCodeNotify('editor.action.outdentLines') end)
  --vim.keymap.set("x", "<Tab>", function() vscode.VSCodeNotifyVisual('editor.action.indentLines', 1) end)
  --vim.keymap.set("x", "<S-Tab>", function() vscode.VSCodeNotifyVisual('editor.action.outdentLines', 1) end)
else
  -- ordinary Neovim

  vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

  -- easier indents
	vim.keymap.set("v", "<", "<gv")
	vim.keymap.set("v", ">", ">gv")
	vim.keymap.set("n", "<Tab>", ">>")
	vim.keymap.set("n", "<S-tab>", "<<")
	vim.keymap.set("x", "<Tab>", ">gv")
	vim.keymap.set("x", "<S-tab>", "<gv")
  vim.keymap.set("i", "<S-tab>", "<Esc><<i")

  vim.keymap.set("n", "<C-d>", "<C-d>zz")
  vim.keymap.set("n", "<C-u>", "<C-u>zz")

  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
  end)

  -- replace all under cursor
  vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

  vim.keymap.set("n", "<C-K>", "zc")
  vim.keymap.set("n", "<C-J>", "zo")

end


vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")


