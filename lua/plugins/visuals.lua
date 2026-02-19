return {
  ---------------------------------------------------------------------------
  -- 🌀 Smooth Cursor (riktig flytande markör)
  ---------------------------------------------------------------------------
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      cursor_color = "#ffffff", -- markörfärg
      smear_color = "#5A9CFD", -- trailfärg (ändra till #00ff88 för grön hacker-style)
      width = 10,
      delay_ms = 15,
      stiffness = 0.9,
    },
  },

  ---------------------------------------------------------------------------
  -- 💡 Highlight raden och ordet du står på
  ---------------------------------------------------------------------------
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

  ---------------------------------------------------------------------------
  -- 🎯 Highlighta funktionsargument (via Treesitter)
  ---------------------------------------------------------------------------
  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    config = true,
  },

  ---------------------------------------------------------------------------
  -- 🔦 Highlighta alla instanser av samma ord
  ---------------------------------------------------------------------------
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

  ---------------------------------------------------------------------------
  -- 🧱 Indent guides (vertikala linjer för kodstruktur)
  ---------------------------------------------------------------------------
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
