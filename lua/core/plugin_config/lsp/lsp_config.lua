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

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
  -- Enable reformat on save
  require('lsp-format').on_attach(client)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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
}
require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
-- require("lspconfig").hls.setup {
-- on_attach = on_attach,
-- capabilities = capabilities,
-- }
require("lspconfig").tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
require("lspconfig").ocamllsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
require("lspconfig").pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
require("lspconfig").jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}