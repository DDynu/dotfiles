vim.cmd("set number")
vim.cmd('autocmd BufNewFile,BufRead *.ejs set filetype=html')
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=0 noexpandtab")
vim.cmd("set shiftwidth=4")
vim.cmd("autocmd BufNewFile,BufRead * setlocal formatoptions-=ro") -- Don't add comment after newline
vim.cmd("autocmd BufReadPost,FileReadPost,BufNewFile * call system(\"tmux rename-window \" . expand(\"%\"))")

-- For autosave upon exiting insert
vim.o.autowriteall = true
vim.api.nvim_create_autocmd({ 'InsertLeavePre', 'TextChanged', 'TextChangedP' }, {
    pattern = '*', callback = function()
        vim.cmd('silent! write')
    end
})
