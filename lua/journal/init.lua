local config = require("journal.config")
local open = require("journal.open")

local M = {}

M.setup = config.setup
M.open = open.main

return M
