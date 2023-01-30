if vim.g.vscode then
else
  -- ordinary Neovim
  vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end
