-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Quick window controls
map("n", "<leader>wq", "<C-w>c", { desc = "Close Window" })
map("n", "<leader>wp", function()
  if Snacks and Snacks.picker and Snacks.picker.util then
    local win = Snacks.picker.util.pick_win()
    if win and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_set_current_win(win)
    end
  else
    vim.cmd("wincmd w")
  end
end, { desc = "Pick Window" })
