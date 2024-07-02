vim.o.termguicolors = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.expandtab = true -- Pressing the <tab> key will insert spaces instead of a <tab> character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a <tab> character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Search
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable mouse mode
vim.o.mouse = "nv"

-- Save undo history
vim.o.undofile = true

-- lualine
vim.opt.showmode = false

-- blinking cursor in edit mode
vim.opt.gcr = "n-v-c-sm:block,i-ci-ve:ver25-blinkon200-blinkoff200,r-cr-o:hor20"

