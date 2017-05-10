function! GetVisual()
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save
  return selection
endfunction

"grep the current word using K (mnemonic Kurrent)
nnoremap <silent> K :Ag! <cword><CR>

"grep visual selection
vnoremap K :<C-U>execute 'Ag! "' . GetVisual() . '"'<CR>

"grep current word up to the next exclamation point using ,K
nnoremap ,K viwf!:<C-U>execute 'Ag! "' . GetVisual() . '"'<CR>

"grep for 'def foo'
nnoremap <silent> ,gd :Ag! 'def <cword>'<CR>

",gg = Grep! - using Ag the silver searcher
" open up a grep line, with a quote started for the search
nnoremap ,gg :Ag! ""<left>

"Grep for usages of the current file
nnoremap ,gcf :exec "Ag! " . expand("%:t:r")<CR>

set wrapscan        " Search wrap the file
set showmatch

" Using Perl/Python regex style by default when searching
nnoremap / /\v
vnoremap / /\v

" Keep search matches in the middle of the window.
let g:indexed_search_center = 1

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz