return {
  -- Dashboard branding
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
██████╗  ██████╗ ██████╗  ██████╗ ██╗   ██╗██╗███╗   ███╗
██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗██║   ██║██║████╗ ████║
██████╔╝██║   ██║██████╔╝██║   ██║██║   ██║██║██╔████╔██║
██╔══██╗██║   ██║██╔══██╗██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██████╔╝╚██████╔╝██████╔╝╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═════╝  ╚═════╝ ╚═════╝  ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
        },
      },
    },
  },

  -- Auto save
  {
    "pocco81/auto-save.nvim",
    enabled = false,
  },

  -- ChatGPT
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },

  -- Colorscheme
  {
    "Mofiqul/vscode.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup({
        transparent = false,
        italic_comments = true,
      })
      require("vscode").load("dark")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "retrobox" },
  },

  -- Copilot chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    cmd = { "CopilotChat", "CopilotChatOpen", "CopilotChatClose" },
    opts = {
      debug = false,
      window = {
        layout = "float",
      },
    },
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
    },
  },
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    opts = {},
  },

  -- gp.nvim
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup({
        providers = {
          openai = {
            endpoint = "https://api.openai.com/v1/chat/completions",
            model = "gpt-4.1",
            api_key = os.getenv("OPENAI_API_KEY"),
          },
        },
      })
    end,
    cmd = { "GpChatNew", "GpChatToggle" },
  },

  -- Treesitter language support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "lua",
        "vim",
        "vimdoc",
        "regex",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "jsonc",
        "yaml",
        "toml",
        "c",
        "cpp",
        "cmake",
        "make",
        "asm",
        "python",
        "go",
        "rust",
        "java",
        "kotlin",
        "c_sharp",
        "php",
        "ruby",
        "dockerfile",
        "gitignore",
        "gitattributes",
        "gitcommit",
        "diff",
        "sql",
      })

      opts.auto_install = true
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
      opts.indent = opts.indent or {}
      opts.indent.enable = true
    end,
  },

  -- Mason tools and servers
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "lua-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "json-lsp",
        "html-lsp",
        "css-lsp",
        "pyright",
        "gopls",
        "rust-analyzer",
        "clangd",
        "bash-language-server",
        "yaml-language-server",
        "dockerfile-language-server",
        "stylua",
        "prettier",
        "ruff",
      })
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.lua = { "stylua" }
      opts.formatters_by_ft.python = { "ruff_format" }
      opts.formatters_by_ft.javascript = { "prettier" }
      opts.formatters_by_ft.typescript = { "prettier" }
      opts.formatters_by_ft.json = { "prettier" }
      opts.formatters_by_ft.yaml = { "prettier" }
      opts.formatters_by_ft.html = { "prettier" }
      opts.formatters_by_ft.css = { "prettier" }
      opts.formatters_by_ft.markdown = {}
    end,
  },

  -- Multi-cursor
  {
    "mg979/vim-visual-multi",
    init = function()
      vim.g.VM_default_mappings = 0
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = function()
      local builtin = require("telescope.builtin")

      return {
        {
          "<leader>ff",
          function()
            builtin.find_files({
              hidden = true,
              no_ignore = true,
              file_ignore_patterns = {
                "%.venv/",
                "%.git/",
                "%.ruff_cache/",
                "%.pytest_cache/",
                "%__pycache__/",
              },
            })
          end,
          desc = "Find files (incl. dotfiles, hide .venv)",
        },
        { "<leader>fg", builtin.live_grep, desc = "Search in files" },
        { "<leader>fb", builtin.buffers, desc = "Find buffers" },
        { "<leader>fh", builtin.help_tags, desc = "Help" },
        { "<leader>ct", builtin.colorscheme, desc = "Choose colorscheme" },
      }
    end,
  },

  -- Toggleterm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
      { "<leader>ft", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Open horizontal terminal" },
      { "<leader>fT", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Open vertical terminal" },
    },
    opts = {
      open_mapping = [[<leader>t]],
      direction = "horizontal",
      size = 20,
    },
  },

  -- Visuals
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      cursor_color = "#ffffff",
      smear_color = "#5A9CFD",
      width = 10,
      delay_ms = 15,
      stiffness = 0.9,
    },
  },
  {
    "yamatsum/nvim-cursorline",
    event = "VeryLazy",
    config = function()
      require("nvim-cursorline").setup({
        cursorline = {
          enable = true,
          timeout = 0,
          number = true,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        },
      })
    end,
  },
  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require("illuminate").configure({
        providers = { "lsp", "treesitter", "regex" },
        delay = 100,
        under_cursor = true,
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
    opts = {
      indent = { char = "│" },
      scope = { enabled = true, show_start = false, show_end = false },
    },
  },
}
