local pid = vim.fn.getpid()

local omnisharp_bin = "/opt/homebrew/bin/omnisharp"

return {
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}
