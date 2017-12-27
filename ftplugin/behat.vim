" =======================================================================================
" FILE: behat-vim-plugin.vim
" AUTHOR: Nikita Kunets <nik.kunets@gmail.com>
" =======================================================================================


" Make sure we run only once
if exists("behat_plugin_loaded")
    finish
endif
let behat_plugin_loaded = 1

if !(exists('g:behat_exe'))
    echoerr "Please setup behat exec in vimrc (let g:behat_exe = <path>)"
elseif !(exists('g:behat_config'))
    echoerr "Please setup behat config in vimrc (let g:behat_config = <path>)"
endif


nnoremap <S-Down> :cnext<CR>
nnoremap <S-Up> :cprevious<CR>

nnoremap <leader>f :call <SID>Find()<CR>
nnoremap <leader>r :call <SID>Run()<CR>

let g:keywords = ['When', 'Given', 'Then', 'And']


" Get search pattern from current line -----------------------------------------------{{{
function! s:GetSearchPattern()
    let l:current_line = getline('.')
    for l:word in g:keywords
        let l:current_line = substitute(l:current_line, l:word, "", "")
    endfor
    let l:result = substitute(l:current_line, '".*"', '\\"\\(\\[\\^\\"\\]\\*\\)\\"', "")
    let l:result = substitute(l:result, 'I ', "", "")
    let l:result = substitute(l:result, 'should ', 'should (([^"]*))', "")
    return l:result
endfunction
" }}}

" Delete spaces at the start and at the end of given string --------------------------{{{
function! s:Strip(string)
    return substitute(a:string, '\v^\s*(.{-})\s*$', '\1', '')
endfunction
" }}}

" Find implementation of the step from the current line ------------------------------{{{
function! s:Find()
    let l:current_line = s:Strip(s:GetSearchPattern())
    let l:command = "grep! -E '" . l:current_line . "' " . g:context_files_path . "*"
    silent execute l:command | copen
endfunction
" }}}

" Run .feature file from current buffer ----------------------------------------------{{{
function! s:Run()
    let l:current_file = shellescape(expand('%:p'))
    let l:command = g:behat_exe . " --config " . g:behat_config . " --profile local " . l:current_file

    silent !clear
    execute "!".l:command
endfunction
" }}}
