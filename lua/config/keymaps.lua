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

-- Visual mode line bubbling (drag selected lines up/down)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

-- Keep visual selection when indenting
map("v", "<", "<gv", { desc = "Indent left and keep selection" })
map("v", ">", ">gv", { desc = "Indent right and keep selection" })
