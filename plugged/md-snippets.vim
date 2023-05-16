" Title
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,6 ######<Space><Enter><++><Esc>kA
" Italics '<em>'
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
" Bold '<strong>'
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
" Underline
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
" Code
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
" Code block
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
" Dividing line
autocmd Filetype markdown inoremap <buffer> ,v ---<Enter><Enter>
" Dividint table line
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
" Tasks
autocmd Filetype markdown inoremap <buffer> ,m - [ ] 
" Picture
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
" Adress
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a

"Quick jump
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
" autocmd Filetype markdown inoremap <buffer> <c-e> <Esc>/<++><CR>:nohlsearch<CR>"_c4l
