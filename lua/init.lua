local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

cmp.setup({
	--completion = {
	--	autocomplete = false
	--},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-n>"] = cmp.mapping.select_next_item(), -- 添加导航键
		["<C-p>"] = cmp.mapping.select_prev_item(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 4 },
	})
})

local on_attach = function(client, bufnr)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = bufnr, desc = "Go to Function Definition"})
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = bufnr, desc = "Go to Function Declaration"})
end

require'lspconfig'.clangd.setup{
	on_attach = on_attach,
	cmd = {"clangd",
		"--background-index",
		"--all-scopes-completion",
		"--completion-style=detailed",
		"--cross-file-rename",
		"--limit-references=0",
	},
	capabilities = require("cmp_nvim_lsp").default_capabilities()
}

