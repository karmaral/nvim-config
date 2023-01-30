local gitui = require("gitui")

gitui.setup()


vim.keymap.set("n", "<leader>G", gitui.open)

