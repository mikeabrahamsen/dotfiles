local servers = require('ma.lspconfig.servers')
local keymaps = require('ma.lspconfig.keymaps')

local M = {}

M.setup = function ()
  for server,config in pairs(servers) do
    if type(config) == 'boolean' then
      config = {}
    end

    config.on_attach = keymaps.setup

    config.capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('lspconfig')[server].setup(config)
  end
end

return M
