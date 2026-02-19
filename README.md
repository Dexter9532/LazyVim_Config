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
