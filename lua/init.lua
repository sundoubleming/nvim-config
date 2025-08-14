--require("nvim-treesitter.configs").setup({
	-- 手动指定解析器路径（关键步骤）
	--parser_install_dir = "~/.local/share/nvim/treesitter/parsers",
--	ensure_installed = {}, -- 禁用自动安装
--	highlight = { enable = false },
--	indent = { enable = true, disable = { "c", "cpp" } }, -- 禁用 C/C++ 缩进（避免宏导致缩进异常）[6](@ref)
--	incremental_selection = { enable = true }, -- 增量选择
--	fold = { enable = true }, -- 代码折叠
--})


local on_attach = function(client, bufnr)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = bufnr, desc = "Go to Function Definition"})
end

require'lspconfig'.clangd.setup{
	on_attach = on_attach,
	cmd = {"clangd",
		"--log=verbose",
		"--background-index",
		"--all-scopes-completion",
		"--completion-style=detailed",
		"--cross-file-rename",
		"--limit-references=0",
	}
}

--require("clangd_extensions").setup({
--	server = {  -- 关键：将配置写在 server 字段内
--		on_attach = on_attach,
--		cmd = {"clangd",
--			"--log=verbose",
--			"--background-index",
--			"--all-scopes-completion",
--			"--completion-style=detailed",
--			"--cross-file-rename",
--			"--limit-references=0",
--		}
--	},
--  extensions = { autoSetHints = true }  -- 扩展功能配置
--})

