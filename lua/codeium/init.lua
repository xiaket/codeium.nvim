local M = {}

function M.setup(options)
  local Server = require("codeium.api")
  local update = require("codeium.update")
  local health = require("codeium.health")
  require("codeium.config").setup(options)

  M.s = Server.new()
  update.download(function(err)
    if err then
      vim.api.nvim_err_writeln("Codeium: Failed to download updates: " .. err)
      return
    end

    Server.load_api_key()
    M.s:start()
  end)
  health.register(M.s)

  vim.api.nvim_create_user_command("Codeium", function(opts)
    local args = opts.fargs
    if args[1] == "Auth" then
      Server.authenticate()
    end
  end, {
    nargs = 1,
    complete = function()
      local commands = { "Auth" }
      return commands
    end,
  })

  require("codeium.virtual_text").setup(M.s)
end

return M
