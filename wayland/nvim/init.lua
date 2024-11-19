require('kk.settings')     -- point to the settings file in lua/kk
require('kk.keymaps')      -- call keybindings
require('kk.plugins')      -- packer pluginmanger config
require('kk.nvim-tree')
require("kk.telescope")
-- vim.cmd('colorscheme tokyonight')
require('kk.treesitter')
require('kk.colortheme')  -- Colortheme
-- vim.cmd('colorscheme duskfox') ---""---

   -- add transparent background 
     require("transparent").setup({
      enable = true, -- boolean: enable transparent
      extra_groups = { -- table/string: additional groups that should be clear
        -- In particular, when you set it to 'all', that means all avaliable groups
        -- example of akinsho/nvim-bufferline.lua
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
      },
    
    -- vim.cmd -- execute *.vim skript
      exclude = {}, -- table: groups you don't want to clear
    })

vim.cmd("source ~/.config/nvim/lua/kk/lastposition.vim")
