# Neovim / LazyVim configuration

This repository contains my personal Neovim (LazyVim) configuration.

## Requirements

- Neovim
- Git

## Installation

Backup any existing Neovim config (safe step):

```bash
mv ~/.config/nvim ~/.config/nvim_backup_$(date +%Y%m%d) 2>/dev/null
```

Clone this repository directly to Neovim’s config directory:

```bash
git clone git@github.com:Dexter9532/Config.git ~/.config/nvim
```

Start Neovim:

```bash
nvim
```

LazyVim will automatically install all plugins on first startup.

## Updating

Pull latest changes:

```bash
cd ~/.config/nvim
git pull
```

## LazyVim Tools

This commandos can be executed from neovim cmd-line using `:`

- Mason (Plugin installer)
- Lazy (See installed plugins, update, turn off plugins)

## Plugin Setup And Disable

All plugin specs are centralized in:

- `lua/plugins/all.lua`

To disable a plugin, set `enabled = false` on that plugin spec.

Example:

```lua
{
  "pocco81/auto-save.nvim",
  enabled = false,
}
```

After changes, restart Neovim and run:

- `:Lazy sync` (apply plugin install/remove changes)
- `:Lazy` (inspect loaded/disabled plugins)

Quick notes:

- Keep one plugin per spec block in `all.lua` for easy toggling.
- Use `enabled = true/false` as your on/off switch.

## Formatting Style

Lua formatting is controlled by:

- `stylua.toml`

So if formatting output changes, check this file first.

## Theme Picker

To change theme quickly inside Neovim, use:

- `<leader>ct` (opens Telescope colorscheme picker)

## Header

To change the startup header text/art, edit:

- `lua/plugins/all.lua`

Look for the `Dashboard branding` block (`folke/snacks.nvim`) and update `dashboard.preset.header`.
