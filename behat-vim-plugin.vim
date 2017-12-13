" =======================================================================================
" FILE: behat-vim-plugin.vim
" AUTHOR: Nikita Kunets <nik.kunets@gamil.com>
" =======================================================================================


" Make sure we run only once
if exists("behat_plugin_loaded")
    finish
endif
let behat_plugin_loaded = 1

nnoremap <S-Down> :cnext<CR>
nnoremap <S-Up> :cprevious<CR>

let g:keywords = ['When', 'Given', 'Then', 'And']


" Get search pattern from current line -----------------------------------------------{{{
function GetSearchPattern()
    let l:current_line = getline('.')
    for l:word in g:keywords
        let l:current_line = substitute(l:current_line, l:word, "", "")
    endfor
    let l:result = substitute(l:current_line, '"\w*"', '\\"\\(\\[\\^\\"\\]\\*\\)\\"', "")
    let l:result = substitute(l:result, 'I ', "", "")
    let l:result = substitute(l:result, 'should ', 'should (([^"]*))', "")
    return l:result
endfunction
" }}}

" Delete spaces at the start and at the end of given string --------------------------{{{
function Strip(string)
    return substitute(a:string, '\v^\s*(.{-})\s*$', '\1', '')
endfunction
" }}}

" Find implementation of the step from the current line ------------------------------{{{
function Find()
    let l:current_line = Strip(GetSearchPattern())
    let l:command = "grep! -E '" . l:current_line . "' " . g:context_files_path . "*"
    silent execute l:command | copen
endfunction
" }}}

" Run .feature file from current buffer ----------------------------------------------{{{
" note that g:behat_exe and g:behat_config should be described in vimrc
function Run()
    if !(exists('g:behat_exe'))
        echo "Please setup behat exec in vimrc (let g:behat_exe = <path>)"
        return
    elseif !(exists('g:behat_config'))
        echo "Please setup behat config in vimrc (let g:behat_config = <path>)"
        return
    endif

    let l:current_file = shellescape(expand('%:p'))
    let l:command = g:behat_exe . " --config " . g:behat_config . " --profile local " . l:current_file

    silent !clear
    execute "!".l:command
endfunction
" }}}
