local M = {}

local state = {
    win = nil,
    buf = nil,
    diagnostics = {},
    index = 1,
    max_items = 5, -- show max 5 errors
}

local function close_toast()
    if state.win and vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_win_close(state.win, true)
    end
    state.win = nil
    state.buf = nil
end
-- Jump to next diagnostic (cycles)
local function jump_to_diag()
    if #state.diagnostics == 0 then return end

    local diag = state.diagnostics[state.index]
    state.index = state.index % #state.diagnostics + 1

    vim.api.nvim_set_current_buf(diag.bufnr)
    vim.api.nvim_win_set_cursor(0, { diag.lnum + 1, diag.col })
end

-- Render toast with multiple errors
local function show_toast()
    close_toast()
    if #state.diagnostics == 0 then return end

    local lines = {}
    local max_width = 0
    local count = math.min(#state.diagnostics, state.max_items)

    for i = 1, count do
        local d = state.diagnostics[i]
        local line = string.format(
            "%d. Line %d · %s",
            i,
            d.lnum + 1,
            d.message:gsub("%s+", " ")
        )
        table.insert(lines, line)
        max_width = math.max(max_width, vim.fn.strwidth(line))
    end

    if #state.diagnostics > state.max_items then
        local more = string.format("… %d more errors", #state.diagnostics - state.max_items)
        table.insert(lines, more)
        max_width = math.max(max_width, vim.fn.strwidth(more))
    end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.api.nvim_buf_set_option(buf, "modifiable", false)

    local win = vim.api.nvim_open_win(buf, false, {
        relative = "editor",
        anchor = "NE",
        row = 0,
        col = vim.o.columns,
        width = max_width + 2,
        height = #lines,
        style = "minimal",
        focusable = false,
        noautocmd = true,
    })

    vim.api.nvim_win_set_option(win, "winhl", "NormalFloat:DiagnosticError")
    vim.api.nvim_win_set_option(win, "winblend", 12)

    state.win = win
    state.buf = buf
end

-- Update diagnostics (global)
local function on_diag()
    state.diagnostics = vim.diagnostic.get(nil, {
        severity = vim.diagnostic.severity.ERROR,
    })

    state.index = 1

    if #state.diagnostics > 0 then
        show_toast()
    else
        close_toast()
    end
end

function M.setup()
    local group = vim.api.nvim_create_augroup("DiagToast", { clear = true })

    vim.api.nvim_create_autocmd("DiagnosticChanged", {
        group = group,
        callback = on_diag,
    })

    vim.keymap.set("n", "gte", jump_to_diag, {
        desc = "Go to next LSP error",
    })
end

return M
