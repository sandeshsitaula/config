filetype plugin indent on

set autowrite


let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

let g:go_auto_type_info = 1


function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)


syntax on;
set noerrorbells
set nu
set nohlsearch
set nowrap
set smartcase
set incsearch
set guioptions-=T "Removes Toolbar
set ruler "Where am i
set showcmd "Show (partial) command in status line
set nolist
set relativenumber
set hidden
set mouse=a
set noswapfile
set nobackup
"filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set undodir="~/.config/Fnvim/undodir"
set undofile
set so=8
set signcolumn=yes
set cmdheight=2
set background=dark
set encoding=UTF-8
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
 Plug 'preservim/nerdtree'
" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'


Plug 'sbdchd/neoformat'
"plug fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Syntactic language support


Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Track the engine.


" Snippets are separated from the engine. Add this if you want them:
Plug 'sheerun/vim-polyglot'
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'    " JavaScript support

Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'Soares/base16.nvim'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
call plug#end()

" CoC extensions
let g:coc_global_extensions = ["coc-tsserver"]

"let g:lightline = { 'colorscheme': 'onehalfdark' }
"
colorscheme gruvbox
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"au filetype go inoremap <buffer> . .<C-x><C-o>

"COC-VIM TAB SETTINGS START

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
 "     \ pumvisible() ? "\<C-n>" :
  "    \ <SID>check_back_space() ? "\<TAB>" :
   "   \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
 " let col = col('.') - 1
 " return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" COC-VIM TAB SETTINGS END

 source ~/osc52.vim
 vmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'cnoremap' key '<Nop>'
endfor
inoremap<c-j> :bp<CR>
nnoremap <c-j> :bp<CR>
nnoremap <c-s> :w<CR>
inoremap <c-s> <c-o>:w<CR>

inoremap <C-x> <esc>:qa!<cr>          
nnoremap <C-x> :qa!<cr>
inoremap <C-Z> <c-o>u
inoremap <C-y> <c-o><C-R>
nnoremap <silent> <C-p> :Files<CR>

"au CursorHoldI * stopinsert
"au InsertEnter * silent! let updaterestore=&updatetime | set updatetime=15000 | execute "!setxkbmap -option caps:swapescape" | redraw!
"au InsertLeave * silent! let &updatetime=updaterestore | execute "!setxkbmap -option" | redraw!

"au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
au BufEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au BufLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
nnoremap <F5> :buffers<cr>:b<space> 

" Press SHIT + k to show documenation, i.e show infereed type on a variable
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
  call CocAction('doHover')
  endif
endfunction

" map <Leader>n <plug>NERDTreeTabsToggle<CR>

let g:go_doc_popup_window = 1
"let NERDTreeMapOpenInTab='\r'
"let NERDTreeMapOpenInTab='<ENTER>'




"for prettier 
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript setlocal formatprg=prettier\
                                             \--stdin\
                                             \--print-width\ 80\
                                             \--single-quote\
                                             \--trailing-comma\ es5
    autocmd BufWritePre *.js Neoformat
augroup END



augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
                                                            \--stdin\
                                                            \--print-width\ 80\
                                                            \--single-quote\
                                                            \--trailing-comma\ es5
    autocmd BufWritePre *.js,*.jsx Neoformat
augroup END
