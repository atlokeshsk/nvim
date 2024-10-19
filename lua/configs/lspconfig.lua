-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- EXAMPLE
local servers = {
  gopls = {
    cmd = { "gopls" },
    filetyes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  },
  golangci_lint_ls = {
    cmd = { "golangci-lint-langserver" },
    filetypes = { "go", "gomod" },
    root_dir = util.root_pattern(
      ".golangci.yml",
      ".golangci.yaml",
      ".golangci.toml",
      ".golangci.json",
      "go.work",
      "go.mod",
      ".git"
    ),
    init_options = {
      command = { "golangci-lint", "run", "--out-format", "json" },
    },
  },
  yamlls = {
    settings = {
      yaml = {
        -- Add basic YAML settings here
        format = {
          enable = true, -- enable YAML formatting
          singleQuote = true, -- use single quotes instead of double quotes
          bracketSpacing = true,
        },
        validate = true, -- validate the YAML files
        hover = true, -- enable hover documentation
        completion = true, -- enable auto-completion
        schemaStore = {
          enable = true, -- automatically fetch schemas from SchemaStore
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        -- This will associate schemas based on file match patterns
        schemaDownload = {
          enable = true, -- allow downloading schemas for validation
        },
        customTags = { -- specify any custom YAML tags if used
          "!Ref",
          "!Sub",
        },
      },
    },
  },
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
