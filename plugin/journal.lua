local options = {
    journal_directory = '~/journal/',
    file_name_format = '%Y-%m-%d',
    file_extension = '.md',
    horizontal_split = false,
    vertical_split = false,
}

function create_dir()
    local dir = options.journal_directory
    os.execute('mkdir ' .. dir)
end

function make_filename()
    local dir = options.journal_directory
    local fmt = options.file_name_format
    local name = os.date(fmt)
    local ext = options.file_extension
    return dir .. name .. ext
end

function open(file_name)
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


function make_it_go()
    create_dir()
    open(make_filename())
end

vim.api.nvim_create_user_command(
    'JournalEntry',
    make_it_go,
    {desc = 'Add entry to journal'}
)
