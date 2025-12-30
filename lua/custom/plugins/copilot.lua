vim.keymap.set('n', '<Leader>co', ': Copilot panel<CR>', { desc = 'Open Copilot panel' })
vim.keymap.set('n', '<Leader>cp', ': Copilot panel close<CR>', { desc = 'Close Copilot panel' })

return {
    'zbirenbaum/copilot.lua',
    dependencies = {
        'copilotlsp-nvim/copilot-lsp',
    },
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = true,
            debounce = 75,
            trigger_on_accept = true,
            keymap = {
                accept = '<M-l>',
                accept_word = false,
                accept_line = false,
                next = '<M-]>',
                prev = '<M-[>',
                dismiss = '<C-]>',
            },
            panel = {
                enabled = true,
                auto_refresh = false,
                keymap = {
                    jump_prev = '[[',
                    jump_next = ']]',
                    accept = '<CR>',
                    refresh = 'gr',
                },
                layout = {
                    position = 'bottom', -- | top | left | right | bottom |
                    ratio = 0.25,
                },
            },
            auth_provider_url = nil, -- URL to authentication provider, if not "https://github.com/"
            logger = {
                file = vim.fn.stdpath 'log' .. '/copilot-lua.log',
                file_log_level = vim.log.levels.OFF,
                print_log_level = vim.log.levels.WARN,
                trace_lsp = 'off', -- "off" | "messages" | "verbose"
                trace_lsp_progress = false,
                log_lsp_messages = false,
            },
        },
        copilot_node_command = 'node', -- Node.js version must be > 22
        workspace_folders = {},
        copilot_model = '',
        disable_limit_reached_message = false, -- Set to `true` to suppress completion limit reached popup
        root_dir = function()
            return vim.fs.dirname(vim.fs.find('.git', { upward = true })[1])
        end,
        server = {
            type = 'nodejs', -- "nodejs" | "binary"
            custom_server_filepath = nil,
        },
        server_opts_overrides = {},
    },
}
