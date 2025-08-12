vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.wo.number = true
vim.o.clipboard = 'unnamedplus'
vim.o.wrap = false
vim.o.linebreak = true
vim.o.mouse ="" 
vim.o.ignorecase = true
vim.o.smartcase = true

vim.keymap.set("n", "<leader>gp", function()
    local filename = vim.fn.expand("%")
    vim.cmd("!glow \"" .. filename .. "\"")
end, { desc = "Preview with glow" })

vim.keymap.set("n", "<leader>[", function()
    vim.cmd("put! =''")
    vim.cmd("normal! k")
end, { desc = "Insert line above and move to it" })

vim.keymap.set("n", "<leader>]", function()
    vim.cmd("put =''")
    vim.cmd("normal! j")
end, { desc = "Insert line below and move to it" })

