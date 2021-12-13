vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g

-- global options
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.undodir = '/home/renwickt/.undodir'

-- window-local options
wo.number = true
wo.wrap = true

-- buffer-local options
bo.expandtab = true
bo.expandtab = true
bo.undofile = true

-- transparent background ... why it requires all this is pretty dum...
function hi(group, opts)
	local c = "highlight " .. group
	for k, v in pairs(opts) do
		c = c .. " " .. k .. "=" .. v
	end
	vim.cmd(c)
end

function create_augroup(name, autocmds)
    cmd = vim.cmd
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

function HighlightNone()
    hi("Normal", {ctermbg = "NONE", guibg = "NONE"})
    hi("Visual", {ctermbg = "yellow", ctermfg="black"})
end

create_augroup("HighlightNone", {
    {"ColorScheme", "*", "lua HighlightNone()"}
})

g.python3_host_prog = '/home/renwickt/.pyenv/shims/python'

-- repl
local iron = require('iron')

iron.core.add_repl_definitions {
  python = {
    mycustom = {
      command = {"python -i"}
    }
  },
}

iron.core.set_config {
  preferred = {
    python = "ipython",
    clojure = "lein"
  }
}
-- g.python3_host_prog = '/usr/bin/python'
