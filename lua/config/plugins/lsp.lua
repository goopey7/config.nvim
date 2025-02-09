local mason = {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end,
}

local mason_auto_installer = {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { mason },
  config = function()
    local languages = require("config.languages")
    local language_servers = {}
    local formatters = {}
    for _, language in ipairs(languages) do
      if language.lsp then
        table.insert(language_servers, language.lsp)
      end
      if language.formatter then
        table.insert(formatters, language.formatter)
      end
    end
    require("mason-tool-installer").setup({
      ensure_installed = vim.iter({ language_servers, formatters }):flatten():totable(),
      auto_update = false,
      run_on_start = true,
    })
  end,
}

local mason_lspconfig = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { mason, mason_auto_installer },
  config = function()
    require("mason-lspconfig").setup()
  end,
}

local lazydev = {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}

local lspconfig = {
  "neovim/nvim-lspconfig",
  dependencies = { mason_lspconfig, mason, mason_auto_installer, lazydev },
  config = function()

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
    })

  end,
}

return { mason, mason_auto_installer, mason_lspconfig, lspconfig, lazydev }
