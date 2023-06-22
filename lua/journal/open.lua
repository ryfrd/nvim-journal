local opts = require("journal.config").options

local M = {}

function M.create_dir()
  local dir = opts.journal_directory
  print(dir)
  os.execute('mkdir ' .. dir)
end

function M.make_filename()
  local dir = opts.journal_directory
  print(dir)
  local fmt = opts.file_name_format
  print(fmt)
  local name = os.date(fmt)
  local ext = opts.file_extension
  return dir .. name .. ext
end

function M.open_file(file_name)
  local vsplit = opts.vertical_split
  print(vsplit)
  local hsplit = opts.horizontal_split
  print(hsplit)
  if vsplit then
    vim.api.nvim_command('vsplit ' .. file_name)
  elseif hsplit then
    vim.api.nvim_command('split ' .. file_name)
  else
    vim.api.nvim_command('edit ' .. file_name)
  end
end


function M.main()
  M.create_dir()
  M.open_file(M.make_filename())
end

return M
