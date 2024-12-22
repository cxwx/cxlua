-- cspell:disable

local function is_github_pattern(str)
    return vim.fn.match(str, "\\v^[[:alnum:]_.-]+/[[:alnum:]_.-]+$") > -1
end
local function setup(opts)
  local sysname = vim.loop.os_uname().sysname
  if sysname == "Darwin" then
    vim.g.python_host_prog = "/opt/homebrew/bin/python3"
    vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
    vim.g.ruby_host_prog = os.getenv("HOME") .. "/software/gempath/bin/neovim-ruby-host"
  else
    vim.g.python_host_prog = "/opt/bin/python3"
  end

  local opt = vim.opt
  opt.list = true -- Show some invisible characters (tabs...
  opt.listchars:append("eol:↴")

  opt.mouse = "a"
  opt.number = true
  opt.clipboard = "unnamedplus" -- Sync with system clipboard
  opt.lbr = true
  opt.iskeyword.append(opt.iskeyword, "_,$,@,%,_,#")

  opt.breakindent = true -- wrap indent to match  line start
  opt.preserveindent = true -- preserve indent structure as much as possible

  opt.cursorline = true

  vim.keymap.set("n", "<F6>", ":set relativenumber!<CR>")

  vim.keymap.set("n", "<leader>1", ":buffer 1<CR>")
  vim.keymap.set("n", "<leader>2", ":buffer 2<CR>")
  vim.keymap.set("n", "<leader>3", ":buffer 3<CR>")
  vim.keymap.set("n", "<leader>4", ":buffer 4<CR>")

  opt.history = 1000 -- number of commands to remember in a history table
  local adir = vim.loop.os_homedir() .. "/history/vim/"
  opt.backup = true
  opt.backupdir = adir .. "backupdir"
  opt.directory = adir .. "directory"
  opt.undodir = adir .. "undodir"
  opt.undofile = true

  opt.fileencodings = "utf-8,GBK,gb18030,ucs-bom,cp936,euc_JP"

  -- local bufname = vim.api.nvim_buf_get_name(0)
  -- local ext = bufname:match("^.+(%..+)$") or ""
  -- if ext == ".icc" then vim.bo.filetype = "cpp" end
  vim.cmd([[ autocmd BufNewFile,Bufread *.icc setfiletype cpp ]])

  local logging = opts.logging
  if logging then print("cxconfig loaded") end
end

return { setup = setup }
