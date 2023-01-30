require('karmaral')

--[[
set shada="NONE"

if exists('g:vscode')
	" VSCode extension
	" nnoremap z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
	nnoremap <silent> <Tab> <Cmd>call VSCodeNotify('editor.action.indentLines')<CR>
	nnoremap <silent> <S-Tab> <Cmd>call VSCodeNotify('editor.action.outdentLines')<CR>
	xnoremap <silent> <Tab> <Cmd>call VSCodeNotifyVisual('editor.action.indentLines', 1)<CR>
	xnoremap <silent> <S-Tab> <Cmd>call VSCodeNotifyVisual('editor.action.outdentLines', 1)<CR>
else
	" ordinary neovim
	set relativenumber
	set tabstop=2
	set softtabstop=-1
	set shiftwidth=0
	" nnoremap <C-u> <C-u>zz
	" nnoremap <C-d> <C-d>zz
	nnoremap n nzz
	vnoremap < <gv
	vnoremap > >gv
	nnoremap <Tab> >>
	nnoremap <S-tab> <<
	vnoremap <Tab> >gv
	vnoremap <S-tab> <gv
endif

set matchpairs+=<:>




augroup highlight_yank
   autocmd!
   au TextYankPost * silent! :lua vim.highlight.on_yank { higroup="IncSearch", timeout=50 }
augroup END
]]--
