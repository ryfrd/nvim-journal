local opts = {
  journal_directory = "~/journal/",
  file_name_format = "%Y-%m-%d",
  file_extension = ".md",
  horizontal_split = false,
  vertical_split = false,
}

local M = {}

function M.create_dir()
  local dir = opts.journal_directory
  os.execute('mkdir ' .. dir)
end

function M.make_filename()
  local dir = opts.journal_directory
  local fmt = opts.file_name_format
  local name = os.date(fmt)
  local ext = opts.file_extension
  return dir .. name .. ext
end

function M.open_file(file_name)
  local vsplit = opts.vertical_split
  local hsplit = opts.horizontal_split
  if vsplit then
    vim.api.nvim_command('vsplit ' .. file_name)
  elseif hsplit then
    vim.api.nvim_command('split ' .. file_name)
  else
    vim.api.nvim_command('edit ' .. file_name)
    vim.api.nvim_command('ZenMode')
  end
end


function M.main()
  M.create_dir()
  M.open_file(M.make_filename())
end

return M
