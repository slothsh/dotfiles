local utils = require('modules.utils')

-- AI Chat Commands
vim.api.nvim_create_user_command('Ai', function(opts)
    vim.cmd("CodeCompanion " .. opts.args)
end, { nargs = '?' })

vim.api.nvim_create_user_command('Chat', function()
    vim.cmd("CodeCompanionChat")
end, {})

-- Add custom commands
vim.api.nvim_create_user_command('CopyFileName', function()
    local filename = utils.copy_current_file_to_clipboard(false)
    vim.fn.setreg("+", filename)
end, {})

vim.api.nvim_create_user_command('CopyFileNameHash', function()
    local filename = utils.copy_current_file_to_clipboard(true)
    vim.fn.setreg("+", filename)
end, {})

vim.api.nvim_create_user_command('LoremIpsum', function(opts)
    local word_count = 20
    local arg_count = tonumber(opts.args)
    if arg_count then
        word_count = arg_count
    end
    vim.api.nvim_put({ utils.lorem_ipsum(word_count) }, 'c', true, true)
end, { nargs = '?' })

vim.api.nvim_create_user_command('FindWordsFilteredFiles', function()
    utils.dual_grep()
end, {})

vim.api.nvim_create_user_command('OpenGitUnstagedFiles', function()
    local output = vim.fn.system("git status --short")
    local lines = vim.split(output, "\n", { trimempty = true })

    local paths = {}

    for _, line in ipairs(lines) do
        local path = line:match("^%S+%s+(.+)$")

        if path then
            print("File " .. path)
            table.insert(paths, path)
        end
    end

    for _, path in ipairs(paths) do
        if vim.loop.fs_stat(path) then
            vim.cmd("edit " .. vim.fn.fnameescape(path))
        else
            print("File not found: " .. path)
        end
    end
end, {})

vim.api.nvim_create_user_command('ToggleStatusLine', function()
      if vim.opt.laststatus:get() ~= 3 then
          vim.opt.laststatus = 3
      else
          vim.opt.laststatus = 0
      end
  end, {})
