require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    "sumneko_lua",
    "clangd",
    -- "hls",
    "tsserver",
    "ocamllsp",
    "pyright",
    "jdtls",
  },

  automatic_installation = true,
})
local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable virtual_text
    virtual_text = false,
    severity_sort = true,
  }
  ),
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
  -- Enable reformat on save
  require('lsp-format').on_attach(client)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require("lspconfig").sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
}
require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
}
-- require("lspconfig").hls.setup {
-- on_attach = on_attach,
-- capabilities = capabilities,
-- }
require("lspconfig").tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
}
require("lspconfig").ocamllsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
}
require("lspconfig").pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
}
require("lspconfig").jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
