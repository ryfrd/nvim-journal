local M = {}

local defaults = {
    journal_directory = "~/journal/",
    file_name_format = "%Y-%m-%d",
    file_extension = ".md",
    horizontal_split = false,
    vertical_split = false,
}

M.options = {}

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

M.setup()

return M
