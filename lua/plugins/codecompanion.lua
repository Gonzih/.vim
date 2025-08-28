-- CodeCompanion configuration with Gemini CLI
require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "gemini",
    },
    inline = {
      adapter = "gemini",
    },
    agent = {
      adapter = "gemini",
    },
  },
  adapters = {
    http = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            -- Gemini CLI is already authenticated (credentials cached)
            -- Using Flash model to avoid quota issues
          },
          schema = {
            model = {
              default = "gemini-2.0-flash-exp",
            },
          },
        })
      end,
    },
  },
  display = {
    action_palette = {
      width = 95,
      height = 10,
    },
    chat = {
      window = {
        layout = "vertical", -- float|vertical|horizontal|buffer
        border = "rounded",
        height = 0.8,
        width = 0.45,
      },
    },
  },
  opts = {
    log_level = "DEBUG", -- TRACE|DEBUG|ERROR|INFO
  },
  -- Key mappings
  keymaps = {
    ["<C-s>"] = "keymaps.send",
    ["<C-c>"] = "keymaps.close",
    ["q"] = "keymaps.cancel_request",
  },
})

-- Key mappings for CodeCompanion
vim.keymap.set("n", "<Leader>cc", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true, desc = "CodeCompanion Actions" })
vim.keymap.set("v", "<Leader>cc", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true, desc = "CodeCompanion Actions" })
vim.keymap.set("n", "<Leader>ch", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true, desc = "CodeCompanion Chat" })
vim.keymap.set("v", "<Leader>ca", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true, desc = "Add to CodeCompanion" })

-- Inline assistant
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true, desc = "Add to chat" })
vim.keymap.set("v", "gs", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true, desc = "Toggle chat" })