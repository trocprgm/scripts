set nocompatible

runtime! plugin/sensible.vim
runtime! archlinux.vim

set laststatus=1

" ln -s /home/username/.vim /root/.vim
" ln -s /home/username/.vimrc /root/.vimrc
" create symbolic link in /root/ so sudo vim functions like regular vim
" if you use /etc/vimrc then sensible will shit the bed

"/usr/share/vim/vimefiles/archlinux.vim
"regular defaults

"~/.vim/plugged/vim-sensible/plugin/sensible.vim
"defaults added by sensible


call plug#begin()
" List your plugins here
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
" Plug 'ycm-core/YouCompleteMe'
Plug 'chrisbra/Colorizer'
Plug 'vimwiki/vimwiki'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

let g:vimwiki_list = [
  \ {'path': '~/MEGA/vimwiki/', 'syntax': 'default',  'ext': '.wiki', 'diary_frequency': 'weekly'}
\ ]

"vvvv for gvim and vim
function! LF()
    let temp = tempname()
    exec 'silent !lf -selection-path=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        return
    endif
    exec 'edit ' . fnameescape(names[0])
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar LF call LF()




filetype plugin indent on

" let g:vimwiki_diary_frequency = 'weekly'
let skip_defaults_vim=1
set clipboard=unnamedplus
filetype on

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let @o ='o€ý5xxxk'
"let @O ='O€ý5j'
let @e ='oprintf("\x1B[€ý5'

set laststatus=1

"autocmd FileType * setlocal formatoptions-=o
"set errorformat^=%-G%f:%l:\ warning:%m
map <C-L> gt
map <C-H> gT
"Maps next and previos tab
map <C-f> <C-e>
map <C-b> <C-y>
"Maps page up and page down to a kinda scroll


nnoremap ? :nohlsearch<CR>
"? clears the search field
inoremap <C-_> <C-p>
" Ctrl-/ behaves like Ctrl-P
inoremap <C-p> <Esc>
" Ctrl-P behaves like Escape
nnoremap <C-_> <C-p>
" Make Ctrl-/ act like Ctrl-P (previous command)
nnoremap <C-p> <Nop>
" makes ctrl-p do nothing in command mode

set relativenumber
set number
set showmode
set shiftwidth=4
set tabstop=4
set expandtab
set showmatch
set hlsearch
colo slate
set cursorline
set ignorecase
set cursorcolumn
set wrap
set scrolloff=10
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set title
set titlestring=%F
