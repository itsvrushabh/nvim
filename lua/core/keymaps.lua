-- ============================================================================
-- Leader Keys
-- ============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================================
-- Disable Built-in Plugins
-- ============================================================================
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- ============================================================================
-- Disable Providers (silence health check warnings)
-- ============================================================================
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
