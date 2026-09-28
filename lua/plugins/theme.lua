-- Dynamic Omarchy theme with fallback for standalone/portable use
local omarchy_theme = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")

if vim.fn.filereadable(omarchy_theme) == 1 then
  local ok, spec = pcall(dofile, omarchy_theme)
  if ok and type(spec) == "table" then
    return spec
  end
end

-- Fallback theme when outside Omarchy or when file is unavailable
return {
  { "tahayvr/matteblack.nvim", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "matteblack",
    },
  },
}
