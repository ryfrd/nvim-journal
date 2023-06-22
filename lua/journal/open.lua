local M = {}

function M.create_dir()
    local dir = options.journal_directory
    os.execute('mkdir ' .. dir)
end

function M.make_filename()
    local dir = options.journal_directory
    local fmt = options.file_name_format
    local name = os.date(fmt)
    local ext = options.file_extension
    return dir .. name .. ext
end

function M.open_file(file_name)
    local vsplit = options.vertical_split
    local hsplit = options.horizontal_split
    if vsplit then
        vim.api.nvim_command('vsplit ' .. file_name)
    elseif hsplit then
        vim.api.nvim_command('split ' .. file_name)
    else
        vim.api.nvim_command('edit ' .. file_name)
    end
end


function M.main()
    create_dir()
    open(make_filename())
end

return M
