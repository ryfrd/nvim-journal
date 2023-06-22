vim.api.nvim_create_user_command(
    'JournalEntry',
    require("journal").open(),
    {desc = 'Add entry to journal'}
)
