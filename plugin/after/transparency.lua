-- Make highlight groups transparent while preserving their other attributes
local function make_transparent(name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if ok and hl then
    hl.bg = nil
    vim.api.nvim_set_hl(0, name, hl)
  end
end

local groups = {
  -- General UI backgrounds
  "Normal",
  "NormalFloat",
  "FloatBorder",
  "Pmenu",
  "Terminal",
  "EndOfBuffer",
  "FoldColumn",
  "Folded",
  "SignColumn",
  "LineNr",
  "CursorLineNr",
  "NormalNC",
  "WhichKeyFloat",

  -- Telescope
  "TelescopeBorder",
  "TelescopeNormal",
  "TelescopePromptBorder",
  "TelescopePromptTitle",

  -- NeoTree / NvimTree
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeVertSplit",
  "NeoTreeWinSeparator",
  "NeoTreeEndOfBuffer",
  "NvimTreeNormal",
  "NvimTreeVertSplit",
  "NvimTreeEndOfBuffer",

  -- Snacks (Picker, Explorer, Dashboard, Terminal)
  "SnacksPicker",
  "SnacksPickerBorder",
  "SnacksNormal",
  "SnacksNormalNC",

  -- Blink completion
  "BlinkCmpMenu",
  "BlinkCmpMenuBorder",
  "BlinkCmpDoc",
  "BlinkCmpDocBorder",

  -- Notify
  "NotifyINFOBody",
  "NotifyERRORBody",
  "NotifyWARNBody",
  "NotifyTRACEBody",
  "NotifyDEBUGBody",
  "NotifyINFOTitle",
  "NotifyERRORTitle",
  "NotifyWARNTitle",
  "NotifyTRACETitle",
  "NotifyDEBUGTitle",
  "NotifyINFOBorder",
  "NotifyERRORBorder",
  "NotifyWARNBorder",
  "NotifyTRACEBorder",
  "NotifyDEBUGBorder",
}

local function apply_transparency()
  for _, name in ipairs(groups) do
    make_transparent(name)
  end
end

local group = vim.api.nvim_create_augroup("TransparentWindow", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  callback = apply_transparency,
})

apply_transparency()
