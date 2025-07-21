--To setup the ruff
--
return {
    'stevearc/conform.nvim',
    event = {
        'BufWritePre'
    },
    cmd = {
        "ConformInfo"
    },
    keys = {
        {
        "<leader>F",
        function()
            require('conform').format({ async = true })
        end,
        mode = '',
        desc = 'Format Buffer',
    },
    },
    opts = {
    formatters_by_ft = {
        python = {
          -- To fix auto-fixable lint errors.
          "ruff_fix",
          -- To run the Ruff formatter.
          "ruff_format",
          -- To organize the imports.
          "ruff_organize_imports",
        },
        lua = {
            "stylua",
            }
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500 },
    --[[
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
    --]]
  },
--[[
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
--]]
}
