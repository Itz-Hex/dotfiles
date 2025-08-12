return { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "javascript", "php", "html", "json", "python", "scss", "sql", "css", "markdown", "markdown_inline" },
            highlight = { enabled = true },
            indent = { enabled = true }
        })
    end
}
