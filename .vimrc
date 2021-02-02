
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set nocompatible
"let mapleader=","

" => True Color ------------------------------------------------------------------------------------------
        if (has("nvim"))
          "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
          let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif
        "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
        "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
        " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
        if (has("termguicolors"))
          set termguicolors
        endif

        "For Vim inside tmux, you can add the following snippet in your ~/.vimrc
        set t_8b=^[[48;2;%lu;%lu;%lum
        set t_8f=^[[38;2;%lu;%lu;%lum


" => Macvim options  --------------------------------------------------------------------------------------
        if has("gui_macvim")
          "set guifont=DejaVuSansMono\ Nerd\ Font\ Mono:h12
          set guifont=FiraCode\ Nerd\ Font\ Mono:h12
          set linespace=6
        endif

" => Neovide ----------------------------------------------------------------------------------------------
        if exists('g:neovide')
          set guifont=FiraCode\ Nerd\ Font\ Mono,Yuanti\ SC:h13
          set linespace=6
          let g:neovide_cursor_animation_length=0.1
          let g:neovide_cursor_trail_length=0.8
          "set guifont=FiraCode\ Nerd\ Font\ Mono,Yuanti\ SC:h14
          "let g:neovide_no_idle=v:true
          "let g:neovide_fullscreen=v:true
          "let g:neovide_cursor_vfx_mode = "torpedo"
          "let g:neovide_cursor_vfx_mode = "railgun"
          "let g:neovide_cursor_antialiasing=v:true
          "let g:neovide_refresh_rate=140
        endif

        "set guifont=DejaVuSansMono\ Nerd\ Font\ Mono,Gulim,Yu\ Mincho,NSimSun:h14
        "set guifont=Helvetica:h14

" => Auto Install vim-plug --------------------------------------------------------------------------------
        if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif

" => Plugin ---------------------------------------------------------------
        call plug#begin('~/.vim/plugged_test')


        Plug 'rakr/vim-one'
        Plug 'junegunn/vim-easy-align'
        Plug 'joshdick/onedark.vim'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        "Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
        Plug 'AndrewRadev/dsf.vim'
        Plug 'AndrewRadev/tagalong.vim'
        Plug 'AndrewRadev/splitjoin.vim'
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        Plug 'leoatchina/vim-object'
        Plug 'vim-scripts/ReplaceWithRegister'
        Plug 'mattn/calendar-vim'
        Plug 'uguu-org/vim-matrix-screensaver'
        Plug 'tommcdo/vim-exchange'
        Plug 'mcchrish/nnn.vim'
        Plug 'mattn/emmet-vim'
        Plug 'liuchengxu/vista.vim'
        Plug 'junegunn/gv.vim'
        Plug 'airblade/vim-gitgutter'
        Plug 'vfbiby/thunder-js-tester-strategy'
        Plug 'bronson/vim-visual-star-search'
        "Plug 'nelstrom/vim-textobj-rubyblock'
        "Plug 'xklalala/mh-vim-for-mocha-test-client'
        "Plug 'inkarkat/vim-ReplaceWithRegister'
        Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
        Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        let g:coc_global_extensions = ['coc-vimlsp', 'coc-java', 'coc-snippets', 'coc-phpactor', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-phpls']
        Plug 'mileszs/ack.vim'
        Plug 'rking/ag.vim'
        Plug 'Chun-Yang/vim-action-ag'
        "Plug 'janko/vim-test'
        
        Plug 'vfbiby/thunder-js-tester-vim-test'
        Plug 'preservim/nerdtree'
        Plug 'tpope/vim-surround'
        Plug 'mg979/vim-visual-multi', {'branch': 'master'}
        Plug 'itchyny/lightline.vim'
        Plug 'ryanoasis/vim-devicons'
        Plug 'jiangmiao/auto-pairs'    
        Plug 'arzg/vim-colors-xcode'
        Plug 'preservim/nerdcommenter'
        Plug 'Asheq/close-buffers.vim'
        Plug 'mikehaertl/pdv-standalone'
        Plug 'mhinz/vim-startify'
        "Plug 'terryma/vim-expand-region'
        Plug 'justinmk/vim-sneak'
        Plug 'prettier/vim-prettier', {'do': 'yarn install'}
        Plug 'Sirver/ultisnips'
        Plug 'mlaursen/vim-react-snippets'
        Plug 'honza/vim-snippets'
        Plug 'tpope/vim-fugitive'
        Plug 'skwp/greplace.vim'
        Plug 'vim-player/terminal.vim'
        "Plug 'xklalala/vim-test-js-mocha-testing'
        "Plug 'skywind3000/vim-keysound'
        "Plug 'logico/typewriter-vim'
        "Plug 'junegunn/goyo.vim'
        "Plug 'junegunn/limelight.vim'

        Plug 'kana/vim-textobj-user'
        Plug 'kana/vim-textobj-function'
        "Plug 'haya14busa/vim-textobj-function-syntax'
        Plug 'thinca/vim-textobj-function-javascript'


        " => Language disabled syntax ------------------
        "syntax for all
        "let g:polyglot_disabled = ['php', 'javascript']
        Plug 'sheerun/vim-polyglot'

        "Plug 'pangloss/vim-javascript'
        "Plug 'MaxMEllon/vim-jsx-pretty'
        "Plug 'leafgarland/typescript-vim'
        "Plug 'HerringtonDarkholme/yats.vim'
        "Plug 'peitalin/vim-jsx-typescript'

        call plug#end()
" => easy-align ------------------------------------------------------------------------------------------
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)

" => tagalong --------------------------------------------------------------------------------------------
        let g:tagalong_additional_filetypes = ['blade']

" => dsf -------------------------------------------------------------------------------------------------
        let g:dsf_no_mappings = 1
        nmap dsf <Plug>DsfDelete
        nmap csf <Plug>DsfChange
        nmap dsnf <Plug>DsfNextDelete
        nmap csnf <Plug>DsfNextChange
        omap iaf <Plug>DsfTextObjectA
        xmap iaf <Plug>DsfTextObjectA
        omap iif <Plug>DsfTextObjectI
        xmap iif <Plug>DsfTextObjectI

" => NERDTree --------------------------------------------------------------------------------------------

        let g:NERDTreeDirArrowExpandable = '▸'
        let g:NERDTreeDirArrowCollapsible = '▾'

" => Vista -----------------------------------------------------------------------------------------------
        " How each level is indented and what to prepend.
        " This could make the display more compact or more spacious.
        " e.g., more compact: ["▸ ", ""]
        " Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
        let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

        " Executive used when opening vista sidebar without specifying it.
        " See all the avaliable executives via `:echo g:vista#executives`.
        let g:vista_default_executive = 'ctags'

        " Set the executive for some filetypes explicitly. Use the explicit executive
        " instead of the default one for these filetypes when using `:Vista` without
        " specifying the executive.
        "let g:vista_executive_for = {
              "\ 'cpp': 'vim_lsp',
              "\ 'php': 'vim_lsp',
              "\ }

        " Declare the command including the executable and options used to generate ctags output
        " for some certain filetypes.The file path will be appened to your custom command.
        " For example:
        let g:vista_ctags_cmd = {
              \ 'haskell': 'hasktags -x -o - -c',
              \ }

        " To enable fzf's preview window set g:vista_fzf_preview.
        " The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
        " For example:
        let g:vista_fzf_preview = ['right:50%']
        " Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
        let g:vista#renderer#enable_icon = 1

        " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
        let g:vista#renderer#icons = {
              \   "function": "\uf794",
              \   "variable": "\uf71b",
              \  }

" => Git -------------------------------------------------------------------------------------------------
    nmap <silent><Space>gs :Gstatus<CR>
    nmap <silent><Space>gr :Gread<CR>
    nmap <silent><Space>gd :Gdiff<CR>
    nmap <silent><Space>gb :Gblame<CR>
    nmap <silent><Space>gl :Gpull<CR>
    nmap <silent><Space>gp :Gpull<CR>
    nmap <silent><Space>glg :Glog<CR>
    nmap <silent><Space>glc :0Gclog<CR>
    nmap <silent><Space>gv :GV<CR>
    nmap <silent><Space>gva :GV<CR>
    nmap <silent><Space>gvc :GV!<CR>

    " => typewriter Sound -------------------------
        "let g:keysound_enable = 1
        "let g:keysound_theme = 'default'
        " Activate FOCUS mode with F12
        "nmap <F12> :Goyo <bar> Limelight!!<CR>"

        " Change the cursor from block to i-beam in INSERT mode
        "let &t_SI = "\e[5 q"
        "let &t_EI = "\e[1 q"
        "augroup myCmds
            "au!
            "autocmd VimEnter * silent !echo -ne "\e[1 q"
        "augroup END

    " => SaveModifiedFiles ------------------------
        function! SaveModifiedFiles() abort
            for buf in getbufinfo({'bufloaded': 1})
                "echo buf.bufnr
                if buf.changed
                    :write
                    echo buf.name
                endif
            endfor
        endfunction

    " => Auto create dir of new file --------------
        cnoremap mk. !mkdir -p <c-r>=expand("%:h")<cr>/

    " => tabnew % position-------------------------
        let g:tabLeaveInfo = {}

        function! s:tableave() abort
            let g:tabLeaveInfo.bufnr = bufnr()
            let g:tabLeaveInfo.cursorPos = getcurpos()
        endfunction

        function! s:tabenter(...) abort
            let l:bufnr = bufnr()
            if get(g:tabLeaveInfo, 'bufnr', -1) ==# l:bufnr
                call setpos('.', g:tabLeaveInfo.cursorPos)
            endif
        endfunction

        augroup TabNewG
            autocmd!
            autocmd TabLeave * call s:tableave()
            autocmd TabNew * call timer_start(10, function('s:tabenter'))
        augroup END

    " => Window switch ----------------------------
        nmap <silent><Space>1 :1wincmd w<CR>
        nmap <silent><Space>2 :2wincmd w<CR>
        nmap <silent><Space>3 :3wincmd w<CR>
        nmap <silent><Space>4 :4wincmd w<CR>
        nmap <silent><Space>5 :5wincmd w<CR>
        nmap <silent><Space>6 :6wincmd w<CR>
        nmap <silent><Space>7 :7wincmd w<CR>
        nmap <silent><Space>8 :8wincmd w<CR>
        nmap <silent><Space>9 :9wincmd w<CR>

    " => Lightline --------------------------------
        let g:lightline = {
              \ 'colorscheme': 'solarized',
              \ 'active': {
              \   'left': [ [ 'mode', 'paste' ],
              \             [ 'window', 'filename', 'modified'] ]
              \ },
              \ 'inactive': {
              \   'left': [ [ 'mode', 'paste' ],
              \             [ 'window'] ]
              \ },
              \ 'component_function': {
              \   'window': 'WindowNum'
              \ },
              \ }

        function! WindowNum()
            return winnr()
        endfunction

    " => Folding ----------------------------------
        set foldmethod=indent
        set foldlevel=1

" => Search -----------------------------------------------------------------------------------------------
	" => Ag ----------------------------------------
        if executable('ag')
          let g:ackprg = 'ag --vimgrep'
        endif
        nnoremap <Leader>f :Ack!<Space>

        " => Ag ----------------------------------------
        let g:ag_prg="ag --nogroup --nocolor --column --vimgrep"
        let g:ag_working_path_mode="r"

	" => Vim-action-ag -----------------------------
        let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'

	" => Greplace ----------------------------------
        set grepprg=ag
        let g:grep_cmd_opts = '--line-numbers --noheading'

" => Vim-Prettier ----------------------------------------------------------------------------------------
        "let g:prettier#exec_cmd_async = 0
        "autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.php PrettierAsync

" => Terminal --------------------------------------------------------------------------------------------
        " turn terminal to normal mode with escape
        " start terminal in insert mode
        nnoremap <silent><Space>tk :TermvimTopToggle<CR>
        nnoremap <silent><Space>twk :TermvimTopToggle watch<CR>
        nnoremap <silent><Space>tj :TermvimBottomToggle<CR>
        nnoremap <silent><Space>twj :TermvimBottomToggle watch<CR>
        nnoremap <silent><Space>th :TermvimLeftToggle<CR>
        nnoremap <silent><Space>twh :TermvimLeftToggle watch<CR>
        nnoremap <silent><Space>tl :TermvimRightToggle<CR>
        nnoremap <silent><Space>twl :TermvimRightToggle watch<CR>
        nnoremap <silent><Space>tt :TermvimTabToggle<CR>
        nnoremap <silent><Space>twt :TermvimTabToggle watch<CR>

        let g:termvim_top_size = 12
        let g:termvim_right_size = 60
        let g:termvim_left_size = 40
        let g:termvim_bottom_size = 10

        tnoremap <Esc> <C-\><C-n>
        inoremap <C-e> <C-o>$
        inoremap <C-a> <C-o>^
        "nmap <silent><Cr> :Leaderf mru<Cr>
        nnoremap <Space><Space>' :terminal<CR>

        if has('nvim')
            autocmd TermOpen * set nonu nornu
            autocmd TermOpen * startinsert
            nmap <silent>tsv :vsp<cr>:term<CR>
            nmap <silent>tsg :sp<cr>:term<CR>
        else
            autocmd TerminalOpen * set nonu nornu
            nmap <silent>tsv :vsp<cr>:term ++curwin<CR>
            nmap <silent>tsg :sp<cr>:term ++curwin<CR>
        endif

	" => Save Terminal position --------------------
    let s:tabTermInfo = {}
    let s:lastWinId = {}

    function! s:hideTerm() abort
        let l:winId = win_getid()
        let l:wins = s:getTermWins()
        let l:isRightWin = v:false
        for l:win in l:wins
            if l:win['winid'] ==# l:winId
                let l:isRightWin = v:true
            endif
        endfor
        if !l:isRightWin
            return
        endif
        let s:lastWinId[tabpagenr()] = l:winId
        let s:tabTermInfo[tabpagenr()] = l:wins
        for l:win in l:wins
            execute 'silent! close!' . l:win['winid']
        endfor
    endfunction

    function! s:getTermWins() abort
        let l:tabnr = tabpagenr()
        let l:winlist = getwininfo()
        let l:term_wins = []
        for l:win in l:winlist
            if l:win['tabnr'] ==# l:tabnr
                call add(l:term_wins, l:win)
            endif
        endfor
        let l:bottomRow = -1
        for l:win in l:term_wins
            if win_screenpos(l:win.winnr)[0] > l:bottomRow
                let l:bottomRow = win_screenpos(l:win.winnr)[0]
            endif
        endfor
        let l:res = []
        let l:isAllTerms = v:true
        for l:win in l:term_wins
            if win_screenpos(l:win.winnr)[0] ==# l:bottomRow
                if !l:win['terminal']
                    let l:isAllTerms = v:false
                endif
                call add(l:res, l:win)
            endif
        endfor
        if !l:isAllTerms
            return []
        endif
        return l:res
    endfunction

    function! s:getTabTerms() abort
        let l:termWins = get(s:tabTermInfo, tabpagenr(), [])
        let l:res = []
        for l:win in l:termWins
            if bufexists(l:win['bufnr'])
                call add(l:res, l:win)
            endif
        endfor
        return l:res
    endfunction

    function! s:openTerminal() abort
        let l:wins = s:getTermWins()
        if len(l:wins) > 0
            return
        endif
        let l:tabWins = s:getTabTerms()
        let l:first_winid = 0
        let l:lastWinId = 0
        if len(l:tabWins) > 0
            botright split
            execute 'b' . l:tabWins[0]['bufnr']
            if get(s:lastWinId, tabpagenr(), 0) ==# l:tabWins[0]['winid']
                let l:lastWinId = win_getid()
            endif
            let l:first_winid = win_getid()
            for l:buf in l:tabWins[1:]
                vsplit
                execute 'b' . l:buf['bufnr']
                if get(s:lastWinId, tabpagenr(), 0) ==# l:buf['winid']
                    let l:lastWinId = win_getid()
                endif
            endfor
        else
            if has('nvim')
                botright split term://zsh
            else
                botright terminal
            endif
            nnoremap q :call <SID>hideTerm()<cr>
        endif
        resize 10
        if l:lastWinId
            let l:first_winid = l:lastWinId
        endif
        if l:first_winid
            call win_gotoid(l:first_winid)
            if has('nvim')
                startinsert
            else
                normal a
            endif
        endif
    endfunction

    nnoremap <Space>' :call <SID>openTerminal()<cr>

        "au BufEnter * if &buftype == 'terminal' | :startinsert | endif
        " open terminal on ctrl+n
        "function! OpenTerminal()
          "split term://zsh
          "resize 10
        "endfunction
        "if has('nvim')
            "nnoremap <Space>' :call OpenTerminal()<CR>
        "else
            "nnoremap <Space>' :terminal<CR>
            "set rnu!
        "endif

" => Sneak -----------------------------------------------------------------------------------------------
        map s <Plug>Sneak_s
        map S <Plug>Sneak_S
        "map f <Plug>Sneak_f
        "map F <Plug>Sneak_F
        "map t <Plug>Sneak_t
        "map T <Plug>Sneak_T

" => Indent ---------------------------------------------------------------
        set tabstop=4
        set expandtab
        set softtabstop=4
        set shiftwidth=4
        set autoindent
        set laststatus=2

" => Other ------------------------------------
        set belloff=all
        set encoding=utf-8
        set clipboard+=unnamed
        set nowrap
        set lazyredraw

" => Buffer switch -----------------------------
        noremap <silent><Space>bn :bn<cr>
        noremap <silent><Space>bp :bp<cr>
        noremap <silent><Space>bd :Bdelete this<cr>
        noremap <silent><Space>bo :Bdelete other<cr>
        noremap <silent><Space>bh :Bdelete hidden<cr>
        noremap <silent><Space>ba :Bdelete all<cr>

" => Tab switch --------------------------------
        noremap <silent><leader>1 1gt<cr>
        noremap <silent><leader>2 2gt<cr>
        noremap <silent><leader>3 3gt<cr>
        noremap <silent><leader>4 4gt<cr>
        noremap <silent><leader>5 5gt<cr>
        noremap <silent><leader>6 6gt<cr>
        noremap <silent><leader>7 7gt<cr>
        noremap <silent><leader>8 8gt<cr>
        noremap <silent><leader>9 9gt<cr>
        noremap <silent><leader>0 10gt<cr>
        noremap <silent><leader>tc :tabnew<cr>
        noremap <silent><leader>tq :tabclose<cr>
        noremap <silent><leader>tn :tabnext<cr>
        noremap <silent><leader>tp :tabprev<cr>
        noremap <silent><leader>to :tabonly<cr>

    " => Keymap ---------------------------------------------------------------
        syntax on
        filetype plugin on
        set mouse=a
        set nu
        "set rnu
        nmap <silent><space>wm :tabnew %<cr>
        nmap <silent><Space>fs :w<cr>
        nmap <silent><Space>fS :wa<cr>
        nmap <silent><Space>jn i<cr><Esc>
        nmap <silent><Space>jo i<cr><Esc>k$
        nmap <silent>sv :vsp<cr>
        nmap <silent>sg :sp<cr>
        nmap <silent>sq :q<cr>
        nmap <silent>sQ :qa<cr>
        nmap <silent>U <c-r>
        nmap <silent><c-h> <c-w>h
        nmap <silent><c-j> <c-w>j
        nmap <silent><c-k> <c-w>k
        nmap <silent><c-l> <c-w>l
        nmap <silent><Leader>sa ggVG
        nmap <silent><Leader><Space> :nohl<cr>
        nmap <silent><Space><cr> o<Esc>
        nmap <silent><Space>bf :Prettier<cr>
        set clipboard=unnamed
        set nowrap
        set ignorecase
        set smartcase
        set splitbelow
        set splitright
        set ruler
        set incsearch
        set hlsearch
        "colorscheme typewriter-night
        "colorscheme onedark
        colorscheme xcodewwdc
        "colorscheme one
        "colorscheme xcodelight
        nmap <Leader>ev :e ~/.vim/.vimrc<cr>
        nmap <Leader>te :b term<cr>
        map Y y$
        "highlight LineNr ctermfg=grey guifg=grey
        "highlight CursorLineNr ctermfg=red guifg=red

" => Guioptions -----------------------------------------------------------
        set guioptions-=l
        set guioptions-=L
        set guioptions-=r
        set guioptions-=R
        set guioptions-=e
        set foldcolumn=0
        "hi foldcolumn guibg=bg
        "hi LineNr guibg=bg
        "set fillchars+=vert:\!
        "hi vertsplit cterm=none term=none guibg=bg
        " hi statusline guibg=DarkGray guifg=Green
        " hi statuslineNC guibg=Green

" => Autocmd ----------------------------------------------------------------
        "autocmd BufRead .vimrc setlocal filetype=vim rnu
        autocmd FileType php setlocal omnifunc=phpactor#Complete
        "autocmd BufWritePost .vimrc source $MYVIMRC

        " => AutoIndent -------------------------------------------------------------
        filetype indent on
        " => Javascript
        autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab ai
        " => Typescript
        autocmd FileType typescriptreact,typescript set tabstop=2 shiftwidth=2 expandtab ai
        " set filetypes as typescriptreact
        autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

        " tsconfig.json is actually jsonc, help TypeScript set the correct filetype
        autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

        " => Vim
        autocmd FileType vim set tabstop=2 shiftwidth=2 expandtab ai

        " => Shell
        autocmd FileType sh set tabstop=2 shiftwidth=2 expandtab ai
        autocmd BufRead *.bats setlocal filetype=sh

        " => json
        autocmd FileType json set tabstop=2 shiftwidth=2 expandtab ai

        " => Html 
        autocmd FileType html set tabstop=4 shiftwidth=4 expandtab ai

        " => Php 
        autocmd FileType php set tabstop=4 shiftwidth=4 expandtab ai
        autocmd FileType blade set tabstop=4 shiftwidth=4 expandtab ai

        " => Vue
        autocmd FileType vue set tabstop=2 shiftwidth=2 expandtab ai

" => Coc-snippets -----------------------------------------------------------
        " Use <C-l> for trigger snippet expand.
        imap <C-l> <Plug>(coc-snippets-expand)

        " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
        let g:coc_snippet_prev = '<C-k>'

        "Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? coc#_select_confirm() :
              \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction
        "let g:coc_snippet_next = '<tab>'

" => NERDTree ---------------------------------------------------------------
    map <silent><Space>ft :NERDTreeToggle<CR>
    map <silent><Space>fv :NERDTreeFind<CR>

" => Vim-test ---------------------------------------------------------------
        let g:test#javascript#runner = 'mocha'
        "let test#javascript#mocha#strategy = 'mocha'

        "Test nearest
        nmap <silent> <Space>kn :call SaveModifiedFiles()<cr>:TestNearest<CR>
        "Test a file
        nmap <silent> <Space>kf :call SaveModifiedFiles()<cr>:TestFile<CR>
        "Test whole suite
        nmap <silent> <Space>ks :call SaveModifiedFiles()<cr>:TestSuite<CR>
        "Test the last test
        nmap <silent> <Space>kl :call SaveModifiedFiles()<cr>:TestLast<CR>
        "Visit the last test
        nmap <silent> <Space>kv :call SaveModifiedFiles()<cr>:TestVisit<CR>

        "let test#enabled_runners = ["javascript#mocha"]
        "let g:test#javascript#mocha#file_pattern = '.*\.spec\.js'
        let g:test#javascript#mocha#file_pattern = '\v(tests?/.*|(test)|(spec))\.(js|jsx|coffee)$'
        "let test#vimscript#runner = 'testify'
        "let g:test#php#patterns = {'test': ['\v^\s*public function ([^ ]*)\('], 'namespace': []}
        let g:test#php#patterns = {'test': ['\v^\s*public function ([0-9A-Za-z_\u4e00-\u9fa5]*)\('], 'namespace': []}

        function! TermGg(...) abort
            setl nonu nornu
            nmap <buffer> <cr> :silent! bd!<CR>:tabprevious<CR>
            nmap <buffer> <ESC> :silent! bd!<CR>:tabprevious<CR>
            normal gg
        endfunction

        function! TermStrategy(cmd)
            tabnew
            if has('nvim')
                call termopen(a:cmd)
                call feedkeys("\<C-\>\<C-n>gg", 'n')
                setl nonu nornu
                nmap <buffer> <silent><cr> :silent! bd!<CR>:tabprevious<CR>
                nmap <buffer> <silent><ESC> :silent! bd!<CR>:tabprevious<CR>
            else
                let l:isWin = has('win32') && fnamemodify(&shell, ':t') ==? 'cmd.exe'
                call term_start(!l:isWin ? ['/bin/sh', '-c', a:cmd] : ['cmd.exe', '/c', a:cmd],
                            \ {"exit_cb": {->timer_start(100, function('TermGg'))}, "curwin": v:true })
            endif
        endfunction

        let g:test#custom_strategies = {'termOpen': function('TermStrategy'), 'jsMochaTestServer': function('strategy#JavascriptMochaStratey')}
        let g:test#strategy = 'termOpen'
        "let g:test#javascript#mocha#strategy = 'jsMochaTestServer'


" => LeaderF --------------------------------------------------------------
        " don't show the help in normal mode

        let g:Lf_WildIgnore = {
              \ 'dir': ['.svn','.git','.hg', 'node_modules'],
              \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
              \}

        let g:Lf_HideHelp = 1
        let g:Lf_UseCache = 0
        let g:Lf_UseVersionControlTool = 0
        let g:Lf_IgnoreCurrentBufferName = 1
        " popup mode
        let g:Lf_WindowPosition = 'popup'
        let g:Lf_PreviewInPopup = 1
        let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
        let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

        let g:Lf_UseCache = 0
        let g:Lf_UseMemoryCache = 0
        let g:Lf_ShortcutF = "<Space>pf"
        nmap <c-p> <Space>pf
        noremap <silent><Space>bb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
        noremap <silent><Space>ff :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
        noremap <silent><Space>fr :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
        "noremap <silent><C-M> :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
        "noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
        "noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

        "noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
        "noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
        "" search visually selected text literally
        "xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
        "noremap go :<C-U>Leaderf! rg --recall<CR>

        "" should use `Leaderf gtags --update` first
        "let g:Lf_GtagsAutoGenerate = 0
        "let g:Lf_Gtagslabel = 'native-pygments'
        "noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
        "noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
        "noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
        "noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
        "noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


" => Phpactor -------------------------------------------------------------
        " Include use statement
        nmap <Space>u :call phpactor#UseAdd()<CR>

        " Invoke the context menu
        nmap <Space>cm :call phpactor#ContextMenu()<CR>

        " Invoke the navigation menu
        nmap <Space>pn :call phpactor#Navigate()<CR>

        " Goto definition of class or class member under the cursor
        nmap <Space>pd :call phpactor#GotoDefinition()<CR>
        nmap <Space>pdh :call phpactor#GotoDefinitionHsplit()<CR>
        nmap <Space>pdv :call phpactor#GotoDefinitionVsplit()<CR>
        nmap <Space>pdt :call phpactor#GotoDefinitionTab()<CR>

        " Transform the classes in the current file
        nmap <Space>pt :call phpactor#Transform()<CR>

        " Generate a new class (replacing the current file)
        nmap <Space>cn :call phpactor#ClassNew()<CR>

        " Extract expression (normal mode)
        nmap <silent><Space>ee :call phpactor#ExtractExpression(v:false)<CR>

        " Extract expression from selection
        vmap <silent><Space>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

        " Extract method from selection
        vmap <silent><Space>em :<C-U>call phpactor#ExtractMethod()<CR>

        " Add missing assignments
        nmap <Space>cf :call phpactor#CopyFile()<CR>

        " Change visibility
        nmap <Space>cv :call phpactor#ChangeVisibility()<CR>

        "Generate accessor
        nmap <Space>ga :call phpactor#GenerateAccessor()<CR>

" => Coc ------------------------------------------------------------------
        " if hidden is not set, TextEdit might fail.
        set hidden

        " Some servers have issues with backup files, see #649
        set nobackup
        set nowritebackup

        " Better display for messages
        set cmdheight=1

        " You will have bad experience for diagnostic messages when it's default 4000.
        set updatetime=300

        " don't give |ins-completion-menu| messages.
        set shortmess+=c

        " always show signcolumns
        set signcolumn=no

        " Use tab for trigger completion with characters ahead and navigate.
        " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        " Use <c-space> to trigger completion.
        inoremap <silent><expr> <c-space> coc#refresh()

        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
        " Coc only does snippet and additional edit on confirm.
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        " Or use `complete_info` if your vim support it, like:
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

        " Use `[g` and `]g` to navigate diagnostics
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)

        " Remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        "nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)

        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          else
            call CocAction('doHover')
          endif
        endfunction

        " Highlight symbol under cursor on CursorHold
        autocmd CursorHold * silent call CocActionAsync('highlight')

        " Remap for rename current word
        nmap <leader>rn <Plug>(coc-rename)

        " Remap for format selected region
        "xmap <leader>f  <Plug>(coc-format-selected)
        "nmap <leader>f  <Plug>(coc-format-selected)

        augroup mygroup
          autocmd!
          " Setup formatexpr specified filetype(s).
          autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
          " Update signature help on jump placeholder
          "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        augroup end

        " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
        xmap <leader>a  <Plug>(coc-codeaction-selected)
        nmap <leader>a  <Plug>(coc-codeaction-selected)

        " Remap for do codeAction of current line
        nmap <leader>ac  <Plug>(coc-codeaction)
        " Fix autofix problem of current line
        nmap <leader>qf  <Plug>(coc-fix-current)

        " Create mappings for function text object, requires document symbols feature of languageserver.
        xmap if <Plug>(coc-funcobj-i)
        xmap af <Plug>(coc-funcobj-a)
        omap if <Plug>(coc-funcobj-i)
        omap af <Plug>(coc-funcobj-a)

        " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
        "nmap <silent> <TAB> <Plug>(coc-range-select)
        "xmap <silent> <TAB> <Plug>(coc-range-select)

        " Use `:Format` to format current buffer
        command! -nargs=0 Format :call CocAction('format')

        " Use `:Fold` to fold current buffer
        command! -nargs=? Fold :call     CocAction('fold', <f-args>)

        " use `:OR` for organize import of current buffer
        command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

        " Add status line support, for integration with other plugin, checkout `:h coc-status`
        "set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

        " Using CocList
        " Show all diagnostics
        nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
        " Manage extensions
        nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
        " Show commands
        nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
        " Find symbol of current document
        nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
        " Search workspace symbols
        nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
        " Do default action for next item.
        nnoremap <silent> <space>j  :<C-u>CocNext<CR>
        " Do default action for previous item.
        nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
        " Resume latest coc list
        nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

        if filereadable(expand("$HOME/.vim/.my.vimrc"))    
            source ~/.vim/.my.vimrc
        endif
