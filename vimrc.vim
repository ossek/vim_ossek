" This is standard pathogen and vim setup
syntax on
syntax enable
set nocompatible
call pathogen#infect() 
filetype plugin indent on
" vim wiki, auto reload vimrc
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

:map <Leader>t  tabn <Esc>

" ---- solarized
set background=dark
" let g:solarized_termcolors=256
colorscheme solarized

" ---- tagbar
nmap <F7> :TagbarToggle<CR>	
" let g:tagbar_left = 1
nmap <leader>nt :NERDTree<CR>

" ---- Syntastic
" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': [],
	\ 'passive_filetypes': ['html'] }
" Use jshint (uses ~/.jshintrc)
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['jshint']

" ---- vimclojure stuff. You'll need to adjust the NailgunClient
" setting if you're on windows or have other problems.
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME . "/.vim/lib/vimclojure-nailgun-client/ng"

" ---- neocomplcache.  nothing said about how it works
"with the vimclojure stuff above
let g:neocomplcache_enable_at_startup = 1
let g:acp_enableAtStartup = 0

" use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" " Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" " Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" " buffer file name pattern that locks neocomplcache. e.g. ku.vim or
" fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" " Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
     \ 'default' : '',
     \ 'vimshell' : $HOME.'/.vimshell_hist',
     \ 'scheme' : $HOME.'/.gosh_completions'
     \ }
"
"                 " Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
   let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"                   " Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Popup color.
" see http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=1
hi PmenuSbar ctermbg=0

" Enable omni completion. Not required if they are already set elsewhere in
" .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ----Paredit
let g:paredit_mode = 1

" ----power line
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
" set t_Co=256

""* the separator used on the left side >
"  let g:airline_left_sep='>'
""
"" the separator used on the right side >
"  let g:airline_right_sep='<'
""
"" enable modified detection >
"  let g:airline_detect_modified=1
"
"" enable paste detection >
"  let g:airline_detect_paste=1
"
"" enable iminsert detection >
"  let g:airline_detect_iminsert=0
"
"" determine whether inactive windows should have the left section collapsed to
"" only the filename of that buffer.  >
"  let g:airline_inactive_collapse=1
"
"" themes are automatically selected based on the matching colorscheme. this
"" can be overridden by defining a value. >
"" let g:airline_theme=
"
"" if you want to patch the airline theme before it gets applied, you can
"" supply the name of a function where you can modify the palette. >
""  let g:airline_theme_patch_func = 'AirlineThemePatch'
""  function! AirlineThemePatch(palette)
""    if g:airline_theme == 'badwolf'
""      for colors in values(a:palette.inactive)
""        let colors[3] = 245
""      endfor
""    endif
""  endfunction
"
"" enable/disable automatic selection of patched powerline font symbols >
"  let g:airline_powerline_fonts=0
"
"" define the set of text to display for each mode.  >
"  let g:airline_mode_map = {} " see source for the defaults
"
"  " or copy paste the following into your vimrc for shortform text
"  let g:airline_mode_map = {
"      \ '__' : '-',
"      \ 'n'  : 'N',
"      \ 'i'  : 'I',
"      \ 'R'  : 'R',
"      \ 'c'  : 'C',
"      \ 'v'  : 'V',
"      \ 'V'  : 'V',
"      \ 's'  : 'S',
"      \ 'S'  : 'S' }
"
"" define the set of filename match queries which excludes a window from having
"" its statusline modified >
"  let g:airline_exclude_filenames = [] " see source for current list
"
"" define the set of filetypes which are excluded from having its window
"" statusline modified >
"  let g:airline_exclude_filetypes = [] " see source for current list
"
"" defines whether the preview window should be excluded from have its window
"" statusline modified (may help with plugins which use the preview window
"" heavily) >
"  let g:airline_exclude_preview = 0
"  
"  let g:airline_theme='molokai'
"
"  set laststatus=2
"
"  set t_Co=256
