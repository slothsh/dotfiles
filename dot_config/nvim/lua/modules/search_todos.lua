local M = {}

M.search_todos = function()
    require('telescope.builtin').grep_string({
        prompt_title = "Search TODOs",
        search = [[(TODO|FIXME|HACK|NOTE|PERF|WARNING|XXX|WARN):]],
        use_regex = true,
        path_display = { "smart" },
        -- Additional options
        additional_args = function()
            return { "--hidden" } -- Include hidden files if needed
        end,
    })
end

M.search_todos_live = function()
    require('telescope.builtin').live_grep({
        prompt_title = "Search TODOs",
        default_text = [[(TODO|FIXME|HACK|NOTE|PERF|WARNING|XXX|WARN):]],
        path_display = { "smart" },
        additional_args = function()
            return { "--hidden" }
        end,
    })
end

return M
