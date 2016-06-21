" to use this vimrc, copy it to ~/.vimrc
" (make sure to back your's up if you want to save it first)
" in case you haven't noticed, " is the comment character in vim config files

"---------standard options--------------------------------------------------
:set shiftwidth=4 tabstop=4
    " tab sizes
:set number
    " use line numbers

:set expandtab 
au FileType make :setlocal noexpandtab
    " expand tabs, but only if you are not editing a make file

au BufRead,BufNewFile *.lcm set filetype=c
    " if reading an lcm file, treat it like a c file
au FileType c,cpp,java,matlab,sh,make :set cindent
    " if editing some form of code, use c indentation

noremap <F1> <nop>
inoremap <F1> <nop>
    " disable the F1 help key because I hit it when trying to hit escape

colorscheme ron "colorscheme elflord 
    " set the best color scheme
syntax on
    " turn on syntax highlighting
noremap <silent> <C-n> :noh<CR>
    " maps ctrl+n to turn off highlighting of words from search

inoremap {     {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{    {
inoremap {}    {}
    " remapping that makes { form an auto closed pair either on the 
    " same line or the next if you hit enter fast enough

"---------resizing splits----------------------------------------------------
noremap = <esc><C-w>>
    " = increase size of horizontally split window  
noremap - <esc><C-w><
    " - decrease size of horizontally split window  
noremap + <esc><C-w>+
    " + increase size of vertically split window  
noremap _ <esc><C-w>-
    " _ decrease size of vertically split window  

"----------moving between tabs and splits------------------------------------
noremap gh <esc><C-w><Left>
    " gh moves left one vertically split window
noremap gH <esc><C-w><Left>
    " gH moves left one vertically split window (in ex mode gh is overridden)
noremap gl <esc><C-w><Right>
    " gl moves right one vertically split window
noremap gj <esc><C-w><Down>
    " gj moves down one horizontally split window
noremap gk <esc><C-w><Up>
    " gk moves up one horizontally split window
noremap gu <esc>gT
    " gu moves left one tab
noremap gi <esc>gt
    " gi moves right one tab

"----------opening tabs and splits------------------------------------------
noremap <silent> g<C-e> <esc>:Ex<CR>
    " g<C-e> opens explorer mode
noremap <silent> g<C-t> <esc>:Tex<CR>
    " g<C-t> opens a new tab and enters explorer mode in it
noremap <silent> g= <esc><C-w>v<C-w><Right>
    " g= splits window vertically and enters the right one
noremap <silent> g- <esc><C-w>v
    " g- splits window vertically and enters the left one
noremap <silent> g+ <esc><C-w>s
    " g+ splits window horizontally and enters the top one
noremap <silent> g_ <esc><C-w>s<C-w><Down>
    " g_ splits window horizontally and enters the bottom one

"---------home, end, pgup, pgdn-----------------------------------------------
noremap <silent> <C-l> $
    " <C-l> goes to end of line
noremap <silent> <C-h> ^
    " <C-h> goes to beginning of line
noremap <silent> <C-j> L
    " <C-j> goes to bottom of page
noremap <silent> <C-k> H
    " <C-k> goes to top of page

"---------compiler error window---------------------------------------------
noremap <silent> cn <esc>:cn<CR>
    " cn goes to the next compiler error (must compile with :make in vim)
noremap <silent> cp <esc>:cp<CR>
    " cp goes to the previous compiler error (must compile with :make in vim)
noremap <silent> cw <esc>:cw<CR>
    " cw opens the compiler output window (must compile with :make in vim)

"---------don't fill buffer with single char delete-------------------------
noremap <silent> x "_x
    " sends characters deleted with x to the null buffer so they don't 
    " overwrite things in the default paste buffer

"-------comments ------------------------------------------------------------
au FileType haskell,vhdl,ada let b:comment_leader = '--'
au FileType vim let b:comment_leader = '"'
au FileType c,cpp,java let b:comment_leader = '//'
au FileType sh,make,python let b:comment_leader = '#'
au FileType matlab,tex let b:comment_leader = '%'
    "set up comment characters for given filetypes

noremap <silent> ,c :<C-B>sil <C-E>s/^\(\s*\)/\1<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\(\s*\)\V<C-R>=escape(b:comment_leader,'\/')<CR>/\1/e<CR>:noh<CR>
    " maps ,c to comment out a line/section and ,u to uncomment a line/section

"-------tags----------------------------------------------------------------
set tags=./tags;/
    "sets default tag file name
noremap <silent> <C-\> <esc>:tab split<CR>:exec("tag ".expand("<cword>"))<CR>
    " <C-\> opens the destination of following the tag in a new tab
noremap <silent> <A-]> <esc>:vsp <CR>:exec("tag ".expand("<cword>"))<CR>
    " <A-]> opens the destination of following the tag in a vsplit window
