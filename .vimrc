
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set nocompatible
"let mapleader=","

    " => Macvim options ---------------------------
        if has("gui_macvim")
            set guifont=DroidSansMono\ Nerd\ Font:h12
            set linespace=6
        endif

        set guifont=DroidSansMono\ Nerd\ Font:h12
        set linespace=6

" => Auto Install vim-plug --------------------------------------------------------------------------------
        if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif

" => Plugin ---------------------------------------------------------------
        call plug#begin('~/.vim/plugged_test')

        Plug 'inkarkat/vim-ReplaceWithRegister'
        Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
        Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        let g:coc_global_extensions = ['coc-vimlsp', 'coc-snippets', 'coc-phpactor', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver']
        Plug 'mileszs/ack.vim'		                        				"Use ag to search
        Plug 'rking/ag.vim'						                            "it's deprecated, but still work
        Plug 'Chun-Yang/vim-action-ag'	                    				"Adds a 'ga' action to search any text object
        Plug 'janko/vim-test'
        Plug 'preservim/nerdtree'
        Plug 'tpope/vim-surround'
        Plug 'mg979/vim-visual-multi', {'branch': 'master'}
        Plug 'itchyny/lightline.vim'
        Plug 'MaxMEllon/vim-jsx-pretty'
        Plug 'joshdick/onedark.vim'
        Plug 'pangloss/vim-javascript'
        Plug 'ryanoasis/vim-devicons'
        Plug 'jiangmiao/auto-pairs'    
        Plug 'terryma/vim-expand-region'
        Plug 'justinmk/vim-sneak'
        Plug 'arzg/vim-colors-xcode'
        Plug 'preservim/nerdcommenter'
        Plug 'Asheq/close-buffers.vim'                                      "Close buffers
        Plug 'mikehaertl/pdv-standalone'                                    "PHP
        Plug 'ryanoasis/vim-devicons'
        Plug 'mhinz/vim-startify'
        Plug 'terryma/vim-expand-region'
        Plug 'justinmk/vim-sneak'
        Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 
                    \'markdown', 'vue', 'yaml', 'html', 'php'] }
        Plug 'Sirver/ultisnips'
        Plug 'honza/vim-snippets'
        Plug 'tpope/vim-fugitive'


        " => Language disabled syntax ------------------
        let g:polyglot_disabled = ['php', 'javascript']
        Plug 'sheerun/vim-polyglot'                                         "A collection of language packs for Vim

        call plug#end()

        function! SaveModifiedFiles() abort
            for buf in getbufinfo({'bufloaded': 1})
                "echo buf.bufnr
                if buf.changed
                    :write
                    echo buf.name
                endif
            endfor
        endfunction


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
              \ 'colorscheme': 'wombat',
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
        set foldmethod=indent		                        				"Set folding by indent
        set foldlevel=1                                                     "So we can see the function name"

" => Search -----------------------------------------------------------------------------------------------
	" => Ag ----------------------------------------
        if executable('ag')
          let g:ackprg = 'ag --vimgrep'			                     		"Ack use ag to be default tool
        endif
        nnoremap <Leader>f :Ack!<Space>

        " => Ag ----------------------------------------
        let g:ag_prg="ag --nogroup --nocolor --column --vimgrep"        	"specify a custom ag options
        let g:ag_working_path_mode="r"	                     				"always start searching from your project root instead of the cwd

	" => Vim-action-ag -----------------------------
        let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'	        	"Set escape characters

" => Vim-Prettier ----------------------------------------------------------------------------------------
        let g:prettier#autoformat = 0
        autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql,*.php Prettier

" => Terminal --------------------------------------------------------------------------------------------
        " turn terminal to normal mode with escape
        " start terminal in insert mode

        tnoremap <Esc> <C-\><C-n>
        inoremap <C-e> <C-o>$
        nmap <silent><Cr> :Leaderf mru<Cr>
        nnoremap <Space><Space>' :terminal<CR>

        if has('nvim')
            autocmd termOpen * set nonu nornu
            " 打开终端进入 insert 模式
            autocmd TermOpen * startinsert
            nmap <silent>tsv :vsp<cr>:term<CR>
            nmap <silent>tsg :sp<cr>:term<CR>
        else
            autocmd TerminalOpen * set nonu nornu
            nmap <silent>tsv :vsp<cr>:term ++curwin<CR>
            nmap <silent>tsg :sp<cr>:term ++curwin<CR>
        endif

        function! s:hideTerm() abort
            let l:wins = s:getTermWins()
            for l:win in l:wins
                execute 'silent! close!' . l:win['winid']
            endfor
        endfunction

        function! s:getTermWins() abort
            let l:tabnr = tabpagenr()
            let l:winlist = getwininfo()
            let l:res = []
            for l:win in l:winlist
                if l:win['tabnr'] ==# l:tabnr && l:win['terminal']
                    call add(l:res, l:win)
                endif
            endfor
            return l:res
        endfunction

        function! s:getTermBufs() abort
            let l:buflist = getbufinfo()
            let l:res = []
            for l:buf in l:buflist
                let l:variables = get(l:buf, 'variables', {})
                if get(l:variables, 'is_custom_term', v:false)
                    call add(l:res, l:buf)
                endif
            endfor
            return l:res
        endfunction

        function! s:openTerminal() abort
            let l:wins = s:getTermWins()
            let l:bufs = s:getTermBufs()
            if len(l:bufs) > 0
                botright split
                execute 'b' . l:bufs[0]['bufnr']
                for l:buf in l:bufs[1:]
                    vsplit
                    execute 'b' . l:buf['bufnr']
                endfor
            else
                if has('nvim')
                    botright split term://zsh
                else
                    botright terminal
                endif
                let b:is_stb = v:true
                nnoremap q :call <SID>hideTerm()<cr>
            endif
            for l:win in l:wins
                execute 'close! ' . l:win['winid']
            endfor
            resize 10
        endfunction

        augroup AuTerm
            autocmd!
            if has('nvim')
                autocmd TermOpen * let b:is_custom_term = v:true
            else
                autocmd TerminalOpen * let b:is_custom_term = v:true
            endif
        augroup END

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
        set belloff=all				                            			"Disable all bell
        set encoding=utf-8			                            			"Set default encodeing utf-8
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
        nmap <silent><Space>fs :w<cr>
        nmap <silent><Space>fS :wa<cr>
        nmap <silent><Space>jn i<cr><Esc>
        nmap <silent><Space>jo i<cr><Esc>k$
        nmap <silent><Space>cl gcc
        vmap <silent><Space>cl gcc
        nmap <silent>sv :vsp<cr>
        nmap <silent>sg :sp<cr>
        nmap <silent>sq :q<cr>
        nmap <silent>U <c-r>
        nmap <silent><c-h> <c-w>h
        nmap <silent><c-j> <c-w>j
        nmap <silent><c-k> <c-w>k
        nmap <silent><c-l> <c-w>l
        nmap <silent><Leader>sa ggVG
        nmap <silent><Leader><Space> :nohl<cr>
        nmap <silent><Space><cr> o<Esc>
        set clipboard=unnamed
        set nowrap
        set ignorecase
        set smartcase
        set splitbelow
        set splitright
        set ruler
        set incsearch
        set hlsearch
        colorscheme onedark
        "colorscheme xcodewwdc
        nmap <Leader>ev :e ~/.vim/.vimrc<cr>
        nmap <Leader>te :b term<cr>
        map Y y$

" => Guioptions -----------------------------------------------------------
        set guioptions-=l
        set guioptions-=L
        set guioptions-=r
        set guioptions-=R
        set guioptions-=e
        set foldcolumn=1
        hi foldcolumn guibg=bg
        hi LineNr guibg=bg
        set fillchars+=vert:\!
        hi vertsplit cterm=none term=none guibg=bg
        " hi statusline guibg=DarkGray guifg=Green
        " hi statuslineNC guibg=Green

" => Autocmd ----------------------------------------------------------------
        "autocmd BufRead .vimrc setlocal filetype=vim rnu
        autocmd FileType php setlocal omnifunc=phpactor#Complete
        autocmd BufWritePost .vimrc source %

        " => AutoIndent -------------------------------------------------------------
        filetype indent on
        " => Javascript 
        autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab ai

        " => json
        autocmd FileType json set tabstop=2 shiftwidth=2 expandtab ai

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

" => Vim-test ---------------------------------------------------------------
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

        "let g:test#php#patterns = {'test': ['\v^\s*public function ([^ ]*)\('], 'namespace': []}
        let g:test#php#patterns = {'test': ['\v^\s*public function ([0-9A-Za-z_\u4e00-\u9fa5]*)\('], 'namespace': []}

        function TermGg(...) abort
            setl nonu nornu
            nmap <buffer> <cr> :silent! bd!<CR> | nmap <buffer> <ESC> :silent! bd!<CR>
            normal gg
        endfunction

        function! TermStrategy(cmd)
            tabnew
            if has('nvim')
                call termopen(a:cmd)
                call feedkeys("\<C-\>\<C-n>gg", 'n') | setl nonu nornu | nmap <buffer> <cr> i<cr> | nmap <buffer> <ESC> :silent! bd!<CR>
            else
                let l:isWin = has('win32') && fnamemodify(&shell, ':t') ==? 'cmd.exe'
                call term_start(!l:isWin ? ['/bin/sh', '-c', a:cmd] : ['cmd.exe', '/c', a:cmd],
                            \ {"exit_cb": {->timer_start(100, function('TermGg'))}, "curwin": v:true })
            endif
        endfunction

        let g:test#custom_strategies = {'termOpen': function('TermStrategy')}
        let g:test#strategy = 'termOpen'


" => LeaderF --------------------------------------------------------------
        " don't show the help in normal mode
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
        noremap <silent><Space>fr :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
        " noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
        " noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

        " noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
        " noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
        " " search visually selected text literally
        " xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
        " noremap go :<C-U>Leaderf! rg --recall<CR>

        " " should use `Leaderf gtags --update` first
        " let g:Lf_GtagsAutoGenerate = 0
        " let g:Lf_Gtagslabel = 'native-pygments'
        " noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
        " noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
        " noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
        " noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
        " noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


" => Phpactor -------------------------------------------------------------
        " Include use statement
        nmap <Space>u :call phpactor#UseAdd()<CR>

        " Invoke the context menu
        nmap <Space>cm :call phpactor#ContextMenu()<CR>

        " Invoke the navigation menu
        nmap <Space>pn :call phpactor#Navigate()<CR>

        " Goto definition of class or class member under the cursor
        nmap <Space>gd :call phpactor#GotoDefinition()<CR>
        nmap <Space>gdh :call phpactor#GotoDefinitionHsplit()<CR>
        nmap <Space>gdv :call phpactor#GotoDefinitionVsplit()<CR>
        nmap <Space>gdt :call phpactor#GotoDefinitionTab()<CR>

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
          autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
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
