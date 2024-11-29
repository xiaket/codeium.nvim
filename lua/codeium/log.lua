local p_debug = "debug" -- vim.env.DEBUG_CODEIUM

return require("plenary.log").new({
  plugin = "codeium/codeium",
  level = p_debug or "info",
})
