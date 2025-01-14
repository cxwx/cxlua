-- ************************************************************************** --
--                                                                            --
--                                                        :::      ::::::::   --
--   init.lua                                           :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: chenxu <chenxu@mail.ustc.edu.cn>           +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2024/10/07 01:30:43 by chenxu            #+#    #+#             --
--   Updated: 2025/01/07 01:31:27 by chenxu           ###   ########.fr       --
--                                                                            --
-- ************************************************************************** --

-- cspell:disable
local function setup(opts)
  -- local sysname = vim.loop.os_uname().sysname
  -- if sysname == "Darwin" then
  --   vim.g.python_host_prog = "/opt/homebrew/bin/python3"
  --   vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
  --   vim.g.ruby_host_prog = os.getenv("HOME") .. "/software/gempath/bin/neovim-ruby-host"
  -- -- else
  --   -- vim.g.python_host_prog = "/opt/bin/python3"
  -- end

  local opt = vim.opt
  opt.list = true -- Show some invisible characters (tabs...
  opt.listchars:append("eol:↴")

  -- opt.mouse = "a"
  opt.number = true
  -- opt.clipboard = "unnamedplus" -- Sync with system clipboard
  opt.lbr = true
  opt.iskeyword.append(opt.iskeyword, "_,$,@,%,_,#")

  opt.breakindent = true -- wrap indent to match  line start
  opt.preserveindent = true -- preserve indent structure as much as possible

  -- opt.cursorline = true

  -- to snacks
  -- vim.keymap.set("n", "<F6>", ":set relativenumber!<CR>")


  -- opt.history = 1000 -- number of commands to remember in a history table
  -- local adir = vim.fn.expand("~/history/vim/")
  -- opt.backup = true
  -- opt.backupdir = adir .. "backupdir"
  -- opt.directory = adir .. "directory"
  -- opt.undodir = adir .. "undodir"
  -- opt.undofile = true

  opt.fileencodings = "utf-8,GBK,gb18030,ucs-bom,cp936,euc_JP"

  -- vim.cmd([[ autocmd BufNewFile,Bufread *.icc setfiletype cpp ]])
  -- vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, { pattern = "*.icc", callback = function() vim.bo.filetype = "cpp" end })

  local logging = opts.logging
  if logging then print("cxconfig loaded") end
end

return { setup = setup }
