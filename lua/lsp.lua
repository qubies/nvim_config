local nvim_lsp = require("lspconfig")

require("lspconfig").sumneko_lua.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").jedi_language_server.setup {}
require("lspconfig").spectral_language_server.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- require("lspconfig").ltex.setup({})
-- require("lspconfig").texlab.setup({})
-- local on_attach = function(client, bufnr)
-- 	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
-- 	-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
-- 	-- if client.resolved_capabilities.document_formatting then
-- 	--   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
-- 	-- end
-- end

-- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
-- require'lspconfig'.sumneko_lua.setup {
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = runtime_path,
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--
--     },
--   },
--        cmd = { "lua-language-server" },
-- }

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- local servers = { 'clangd', 'gopls', 'rust_analyzer', 'tsserver', 'pylsp',}
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     init_options = {
--       provideFormatter = true
--     }
--   }
-- end

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- luasnip setup
local luasnip = require("luasnip")

-- nvim-cmp setup
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})

local utils = require("utils")
local M = {}

local format_disabled_var = function()
	return string.format("format_disabled_%s", vim.bo.filetype)
end
local format_options_var = function()
	return string.format("format_options_%s", vim.bo.filetype)
end

local format_options_prettier = {
	tabWidth = 4,
	singleQuote = true,
	trailingComma = "all",
	configPrecedence = "prefer-file",
}
vim.g.format_options_typescript = format_options_prettier
vim.g.format_options_javascript = format_options_prettier
vim.g.format_options_typescriptreact = format_options_prettier
vim.g.format_options_javascriptreact = format_options_prettier
vim.g.format_options_json = format_options_prettier
vim.g.format_options_css = format_options_prettier
vim.g.format_options_scss = format_options_prettier
vim.g.format_options_html = format_options_prettier
vim.g.format_options_python = format_options_prettier
vim.g.format_options_yaml = format_options_prettier
vim.g.format_options_yaml = {
	tabWidth = 2,
	singleQuote = true,
	trailingComma = "all",
	configPrecedence = "prefer-file",
}
vim.g.format_options_markdown = format_options_prettier
vim.g.format_options_sh = {
	tabWidth = 4,
}

M.formatToggle = function(value)
	local var = format_disabled_var()
	vim.g[var] = utils._if(value ~= nil, value, not vim.g[var])
end
-- vim.cmd [[command! FormatDisable lua require'lsp.formatting'.formatToggle(true)]]
-- vim.cmd [[command! FormatEnable lua require'lsp.formatting'.formatToggle(false)]]
vim.cmd([[autocmd BufWritePre FileType go, python, rust, tex, latex lua vim.lsp.buf.formatting_sync(nil, 1000)]])

M.format = function()
	if not vim.b.saving_format and not vim.g[format_disabled_var()] then
		vim.b.init_changedtick = vim.b.changedtick
		vim.lsp.buf.formatting(vim.g[format_options_var()] or {})
	end
end

return M
