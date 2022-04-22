local Window = {}

local function buf_option_init(option)
    return {
        listed  = option.listed  or false,
        scratch = option.scratch or true
    }
end

local function win_option_init(option)
    return {
        enter = option.enter or false,
        config = {
            relative  = option.relative  or 'editor',
            win       = option.win,
            anchor    = option.anchor    or 'NW',
            width     = option.width     or 20,
            height    = option.height    or 3,
            bufpos    = option.bufpos,
            row       = option.row       or 0,
            col       = option.col       or 0,
            focusable = option.focusable or true,
            external  = option.external  or false,
            zindex    = option.zindex    or 50,
            style     = option.style     or 'minimal',
            border    = option.border    or 'none',
            noautocmd = option.noautocmd or false
        }
    }
end

function Window:_create_buffer()
    if not self.buf_id then
        self.buf_id = vim.api.nvim_create_buf(self.buf_args.listed, self.buf_args.scratch)
    end
end

function Window:_delete_buffer()
    if self.buf_id then
        if vim.api.nvim_buf_is_valid(self.buf_id) then
            vim.api.nvim_buf_delete(self.buf_id, { force = true })
        end
        self.buf_id = nil
    end
end

function Window:_open_window()
    if not self.win_id and self.buf_id then
        self.win_id = vim.api.nvim_open_win(self.buf_id, self.win_args.enter, self.win_args.config)
    end
end

function Window:_close_window()
    if self.win_id then
        if vim.api.nvim_win_is_valid(self.win_id) then
            vim.api.nvim_win_close(self.win_id, true)
        end
        self.win_id = nil
    end
end

function Window:new(buf_option, win_option)
    return setmetatable({
        buf_id   = nil,
        win_id   = nil,
        buf_args = buf_option_init(buf_option),
        win_args = win_option_init(win_option)
    }, {
        __index  = self
    })
end

function Window:open()
    self:_create_buffer()
    self:_open_window()
end

function Window:close()
    self:_close_window()
    self:_delete_buffer()
end

return Window
