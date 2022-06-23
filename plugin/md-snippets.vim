"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap <buffer> ,e <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,z <Esc>/<++><CR>:nohlsearch<CR>"_c5l<CR>
" Title 
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,6 ######<Space><Enter><++><Esc>kA
" Identify the title
" autocmd Filetype markdown inoremap <buffer> ,xxx --------<Enter>
" autocmd Filetype markdown inoremap <buffer> ,xxx ========<Enter>
" Italic
autocmd Filetype markdown inoremap <buffer> ,x ** <++><Esc>F*i
" Bold
autocmd Filetype markdown inoremap <buffer> ,w **** <++><Esc>F*hi
" Bold && Italic
autocmd Filetype markdown inoremap <buffer> ,s ****** <++><Esc>F*hhi
" Underline
autocmd FileType markdown inoremap <buffer> ,d ~~~~ <++><Esc>F~hi
" Delete Line
autocmd FileType markdown inoremap <buffer> ,g ~~ <++><Esc>F~i
" Dividing line 
autocmd Filetype markdown inoremap <buffer> ,f ---
" Tasks
autocmd Filetype markdown inoremap <buffer> ,r - [] 
" Code wrapping
autocmd Filetype markdown inoremap <buffer> ,m `` <++><Esc>F`i
" Code block
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
" Picture
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
" Link
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
