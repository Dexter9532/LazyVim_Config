return {
  -- Dashboard branding
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = true,
      },
      picker = {
        sources = {
          explorer = {
            auto_close = false,
            focus = "list",
            jump = { close = false },
            layout = {
              preset = "sidebar",
              preview = false,
              layout = {
                position = "left",
                width = 40,
              },
            },
          },
        },
      },
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
    keys = {
      {
        "<leader>e",
        function()
          local picker = Snacks.picker.get({ source = "explorer" })[1]
          if picker then
            local current = vim.api.nvim_get_current_win()
            local list = picker.list and picker.list.win and picker.list.win.win

            if current == list then
              local main = picker.main
              if main and vim.api.nvim_win_is_valid(main) and main ~= current then
                vim.api.nvim_set_current_win(main)
              else
                vim.cmd("wincmd p")
              end
              return
            end

            picker:focus("list", { show = true })
            return
          end

          picker = Snacks.explorer.reveal()
          if picker then
            vim.schedule(function()
              picker:focus("list", { show = true })
            end)
          end
        end,
        desc = "Explorer Snacks (reveal)",
      },
      {
        "<leader>E",
        function()
          local picker = Snacks.picker.get({ source = "explorer" })[1]
          if picker then
            local current = vim.api.nvim_get_current_win()
            local list = picker.list and picker.list.win and picker.list.win.win

            if current == list then
              local main = picker.main
              if main and vim.api.nvim_win_is_valid(main) and main ~= current then
                vim.api.nvim_set_current_win(main)
              else
                vim.cmd("wincmd p")
              end
              return
            end

            picker:focus("list", { show = true })
            return
          end

          picker = Snacks.explorer()
          if picker then
            vim.schedule(function()
              picker:focus("list", { show = true })
            end)
          end
        end,
        desc = "Explorer Snacks (cwd)",
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

  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      local function find_compile_commands(root)
        local candidates = {
          "compile_commands.json",
          "build/compile_commands.json",
          "build/*/compile_commands.json",
          "build/*/*/compile_commands.json",
          "tests/build/compile_commands.json",
          "tests/build/*/compile_commands.json",
          "tests/build/*/*/compile_commands.json",
        }

        for _, pattern in ipairs(candidates) do
          local matches = vim.fn.glob(root .. "/" .. pattern, false, true)
          if #matches > 0 then
            return vim.fn.fnamemodify(matches[1], ":h")
          end
        end
      end

      opts.servers.clangd = vim.tbl_deep_extend("force", opts.servers.clangd or {}, {
        cmd = {
          "clangd",
          "--background-index",
          "--completion-style=detailed",
          "--header-insertion=never",
          "--query-driver=/home/bobo/ncs/toolchains/**",
        },
        on_new_config = function(config, root_dir)
          local compile_dir = find_compile_commands(root_dir)
          if compile_dir then
            table.insert(config.cmd, "--compile-commands-dir=" .. compile_dir)
          end
        end,
        handlers = {
          ["textDocument/publishDiagnostics"] = function() end,
        },
      })

      vim.diagnostic.config({
        severity_sort = true,
        virtual_text = {
          spacing = 2,
          source = "if_many",
        },
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
      opts.formatters_by_ft.markdown = { "prettier" }
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


  -- Project search and replace
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      { "<leader>sr", "<cmd>GrugFar<cr>", desc = "Search and Replace" },
    },
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
