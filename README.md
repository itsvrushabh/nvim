# 💤 Neovim Configuration

A modern, fast, and feature-rich Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim), customized for high productivity, seamless terminal integration, and deep desktop theming.

---

## ✨ Features

- **⚡ Fast & Modular**: Structured on LazyVim with lazy-loading powered by `lazy.nvim`.
- **🎨 Dynamic Desktop Theming**: Native synchronization with [Omarchy](https://github.com/omacom-io/omarchy) theme changes via hot-reloading, with a standalone fallback to `matteblack` for portability.
- **🪟 Persistent Transparency**: Background transparency applied automatically across editor buffers, floating windows, file trees, completion menus, and Snacks pickers—persisting seamlessly across colorscheme changes.
- **🔄 Seamless Tmux Navigation**: Shared `Ctrl-h/j/k/l` split navigation across Neovim windows and tmux panes via `vim-tmux-navigator`.
- **📋 Smart Remote Clipboard**: Multi-environment clipboard supporting native Wayland (`wl-clipboard`), shared tmux buffers, and OSC 52 terminal sequences without hang or latency.
- **🛠️ Built-in Language Support**: Out-of-the-box LSP, Treesitter syntax highlighting, and formatting for **Rust** (`rustaceanvim`, `crates.nvim`), **TypeScript/JavaScript**, **JSON** (`SchemaStore.nvim`), and **Lua**.
- **🎯 Enhanced Editing Ergonomics**: Text object surrounding (`mini.surround`), persistent visual indentation (`<` / `>`), visual line dragging (`J` / `K`), and fast window picking (`<leader>wp`).

---

## 📁 Repository Structure

```
~/.config/nvim
├── init.lua                             # Configuration entry point
├── lazy-lock.json                       # Exact commit lockfile for all plugins
├── lazyvim.json                         # LazyVim state & enabled language extras
├── stylua.toml                          # Lua formatting rules (StyLua)
├── lua/
│   ├── config/
│   │   ├── autocmds.lua                 # Custom autocommands
│   │   ├── keymaps.lua                  # Custom keymaps & window controls
│   │   ├── lazy.lua                     # lazy.nvim bootstrapper & options
│   │   ├── options.lua                  # General Neovim options & settings
│   │   └── remote_clipboard.lua         # Wayland, tmux buffer, & OSC 52 clipboard logic
│   └── plugins/
│       ├── all-themes.lua               # Pre-registered colorschemes for fast switching
│       ├── disable-news-alert.lua       # Disables release notification popups
│       ├── omarchy-theme-hotreload.lua  # Hot-reloads Neovim theme on desktop theme events
│       ├── snacks-animated-scrolling-off.lua # Disables animated scroll for maximum snappiness
│       ├── theme.lua                    # Dynamic theme loader with portable fallback
│       └── tmux.lua                     # vim-tmux-navigator keymaps & integration
└── after/
    └── plugin/
        └── transparency.lua             # Global background transparency & ColorScheme hook
```

---

## 📦 Requirements & Dependencies

### Required
- **Neovim** $\ge$ `0.10.0`
- **Git**
- **A Nerd Font** (e.g., [JetBrainsMono Nerd Font](https://www.nerdfonts.com/))
- **C Compiler** (`gcc` or `clang`) for Treesitter parsers

### Recommended Tools
- **ripgrep** & **fd** (for ultra-fast file finding and grepping)
- **wl-clipboard** (if running Wayland)
- **tmux** (for terminal multiplexing)
- **Node.js** & **Rust toolchain** (`rustc`, `cargo`) for respective language servers

#### Arch Linux / CachyOS Installation
```bash
sudo pacman -S neovim git ripgrep fd fzf clang wl-clipboard tmux
```

---

## 🚀 Installation

1. **Back up existing configuration (if any)**:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   mv ~/.local/state/nvim ~/.local/state/nvim.bak
   mv ~/.cache/nvim ~/.cache/nvim.bak
   ```

2. **Clone the repository**:
   ```bash
   git clone https://github.com/itsvrushabh/nvim.git ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```
   *Lazy.nvim will automatically clone and install all plugins, Treesitter parsers, and Mason LSP servers on first run.*

---

## ⌨️ Essential Keymaps

The leader key is set to `Space` (`<leader>`).

### Navigation & Splits (Tmux Compatible)
| Keybinding | Action |
|---|---|
| `Ctrl + h` | Navigate to Left Window / Tmux Pane |
| `Ctrl + j` | Navigate to Lower Window / Tmux Pane |
| `Ctrl + k` | Navigate to Upper Window / Tmux Pane |
| `Ctrl + l` | Navigate to Right Window / Tmux Pane |
| `<leader>wq` | Close current window split |
| `<leader>wp` | Interactive window picker |
| `<leader>ws` | Split window horizontally |
| `<leader>wv` | Split window vertically |

### Visual Mode Editing
| Keybinding | Mode | Action |
|---|---|---|
| `J` | Visual | Move selected lines down (line bubbling) |
| `K` | Visual | Move selected lines up (line bubbling) |
| `<` | Visual | Indent left while retaining visual selection |
| `>` | Visual | Indent right while retaining visual selection |

### Finding & Searching (Snacks Picker)
| Keybinding | Action |
|---|---|
| `<leader><space>` | Find Files in project |
| `<leader>/` | Live Grep across project files |
| `<leader>,` | Switch Buffer |
| `<leader>e` | Toggle File Explorer |
| `<leader>uC` | Browse & switch colorschemes interactively |

### LSP & Code Navigation
| Keybinding | Action |
|---|---|
| `gd` | Go to Definition |
| `gD` | Go to Declaration |
| `gr` | Show References |
| `gI` | Show Implementations |
| `gy` | Show Type Definition |
| `K` | Hover Documentation |
| `<leader>cr` | Rename symbol |
| `<leader>ca` | Code Actions |
| `<leader>cd` | Line Diagnostics |

### Surrounding (`mini.surround`)
| Keybinding | Action | Example |
|---|---|---|
| `sa<motion><char>` | Add surrounding character | `saiw"` wraps inner word in quotes |
| `sd<char>` | Delete surrounding character | `sd"` removes surrounding quotes |
| `sr<old><new>` | Replace surrounding character | `sr"'` replaces double quotes with single |

---

## 🎨 Theming & Transparency

- **Dynamic Omarchy Theme**: By default, `lua/plugins/theme.lua` loads the active desktop theme generated by Omarchy (`~/.local/state/omarchy/current/theme/neovim.lua`).
- **Offline / Portable Fallback**: If running on another distribution or outside Omarchy, it automatically falls back to `matteblack`.
- **Transparency**: Managed in `after/plugin/transparency.lua`. An event listener on `ColorScheme` ensures transparency is maintained even when you switch themes at runtime via `<leader>uC`.

---

## 🧩 Managing LazyVim Extras

You can enable or disable additional language packs, formatters, and tools by pressing `<leader>ux` inside Neovim to open the **LazyExtras** interface, or by modifying `lazyvim.json`.
