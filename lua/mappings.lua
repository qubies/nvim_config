-- ie = inner entire buffer
vim.api.nvim_set_keymap('o', 'ie',  [[<Cmd>exec "normal! ggVG"<CR>]], { noremap = true, silent = true })

-- disable stupid history
vim.api.nvim_set_keymap('n', 'q:','<nop>', { noremap = true, silent = true })

-- for jupyter
vim.api.nvim_set_keymap('n', '<Leader>jf', [[<Cmd>JupyterRunFile<CR>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>jr', [[<Cmd>JupyterSendRange<CR>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>jc', [[<Cmd>JupyterSendCell<CR>]], {noremap=true, silent=true})

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>ff',  [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg',  [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb',  [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh',  [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })

require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
  },
}
