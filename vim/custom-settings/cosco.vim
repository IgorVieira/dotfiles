autocmd FileType c,cpp,css,java,javascript,perl,php,jade nmap <silent> ,; :call cosco#commaOrSemiColon()<CR>
autocmd FileType c,cpp,css,java,javascript,perl,php,jade inoremap <silent> ,; <ESC>:call cosco#commaOrSemiColon()"<CR>a
