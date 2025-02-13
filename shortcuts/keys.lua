-- Set leader key
vim.g.mapleader = " "

-- Helper function for keymaps
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Common mappings for normal and visual modes
local common_mappings = {
    -- Movement
    ['u'] = 'k',
    ['n'] = 'h',
    ['e'] = 'j',
    ['i'] = 'l',

    ['N'] = 'b',
    ['I'] = 'e',
    ['E'] = '<C-d>',
    ['U'] = '<C-u>',
    ['-'] = '%',
    ['z'] = 'u',
    [';'] = 'y',
    ['Y'] = 'yy',
    ['P'] = '"0p',
    ['k'] = 'n',
    ['K'] = 'N',
}

-- Apply common mappings to both normal and visual modes
for lhs, rhs in pairs(common_mappings) do
    map({'n', 'v'}, lhs, rhs)
end

-- Normal mode specific mappings
local normal_mappings = {
    [','] = 'i',
    ['<leader>,'] = 'I',
    ['<leader>k'] = 'ggVGy',
    ['<leader>v'] = ':vsplit<CR>',
    ['<leader>h'] = ':split<CR>',
    ['<leader>o'] = 'o<Esc>',
}

-- Apply normal mode specific mappings
for lhs, rhs in pairs(normal_mappings) do
    map('n', lhs, rhs)
end