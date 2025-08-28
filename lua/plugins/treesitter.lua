require("nvim-treesitter.configs").setup({
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to install (excluding problematic ones)
  ensure_installed = {
    "yaml",
    "lua",
    "javascript",
    "typescript",
    "python",
    "rust",
    "go",
    "json",
    "markdown",
    "html",
    "css",
    "bash",
    "dockerfile",
    "toml",
    "sql"
  },

  -- Install parsers for all filetypes (false recommended)  
  ignore_install = { "vim", "vimdoc" }, -- Skip problematic parsers

  highlight = {
    enable = true,
    -- Disable slow treesitter highlight for large files
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
    -- Disable for yaml as it can be problematic
    disable = { "yaml" }
  },

  -- Text objects for better code navigation
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
  },
})
