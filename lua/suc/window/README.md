# Window

Window is only a wrap of some function relate to floating window.

## Usage 

### `Window:new(buf_option, win_option)`

Create a window instance with specified option.

#### `buf_option`

**Type:** `table`

Contain option of `vim.api.nvim_create_buf`.
All option's detail is available at `:h nvim_create_buf()`.

#### `buf_option.listed`

**Type:** `boolean`

Display the buffer to buffer-list.

#### `buf_option.scratch`

**Type:** `boolean`

Create scratch-buffer.

#### `win_option`

**Type:** `table`

Contain option of `vim.api.nvim_open_win`.
All option's detail is available at `:h nvim_open_win()`.

#### `win_option.enter`

**Type:** `boolean`

Enter the window.

#### `win_option.relative`

**Type:** `string`

The standard position of floating window.

#### `win_option.win`

**Type:** `number`

Windows-ID for relative='win'.

#### `win_option.anchor`

**Type:** `string`

Corner of the floating window.

#### `win_option.width`

**Type:** `number`

Window width.

#### `win_option.height`

**Type:** `number`

Window height

#### `win_option.bufpos`

**Type:** `table`

See help.

#### `win_option.row`

**Type:** `number`

Row position.

#### `win_option.col`

**Type:** `number`

Column position.

#### `win_option.focusable`

**Type:** `boolean`

Enable forcus by user actions.

#### `win_option.external`

**Type:** `boolean`

GUI should display window as external top-level window.

#### `win_option.zindex`

**Type:** `number`

Window position at z axis.

#### `win_option.style`

**Type:** `string`

Window style.

#### `win_option.border`

**Type:** `string or table`

Style of window border.

#### `win_option.noautocmd`

**Type:** `boolean`

Buffer-related autocommand events will be disabled.

### `Window:open()`

Open window

### `Window:close`

Close window
