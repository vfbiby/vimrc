" java代码编译执行
autocmd BufNewFile,BufReadPre *.java nnoremap <leader>cr :w<cr>:!javac %<cr>:!java %:r<cr>
