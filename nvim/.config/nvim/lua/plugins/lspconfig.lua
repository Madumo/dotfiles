return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    inlay_hints = { enabled = false },

    ---@type table<string, lazyvim.lsp.Config|boolean>
    servers = {
      elixirls = {
        cmd_env = {
          TENANT_KEY = "TV5",
        },
        -- Configure ElixirLS settings
        settings = {
          elixirLS = {
            -- Enable dialyzer for better code analysis
            dialyzerEnabled = false,
            -- -- Don't fetch deps automatically (can cause issues with env vars)
            -- fetchDeps = false,
            -- -- Enable test lenses
            -- enableTestLenses = true,
            -- -- Set Mix environment
            -- mixEnv = "dev",
            -- Pass environment variables to Mix tasks
            mixEnvVars = {
              TENANT_KEY = "TV5",
            },
          },
        },
      },
    },
  },
}
