local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_select = { behaviour = cmp.SelectBehavior.Select }
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<Tab>'] = cmp_action.tab_complete(),
		['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
		['<C-Space'] = cmp.mapping.complete()
	}),
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	  'tsserver',
	  'rust_analyzer',
	  'eslint',
	  'lua_ls'
  },
  handlers = {
    lsp_zero.default_setup,
  }
})

