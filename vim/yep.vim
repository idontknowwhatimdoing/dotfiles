hi clear
if exists("syntax_on")
	syntax reset
endif

set background=dark
function SetHighlightGroup(group, ...)
	let hi_grp = 'hi ' . a:group . ' '

	if strlen(a:1)
		let hi_grp .= 'guifg=' . a:1 . ' '
	endif

	if strlen(a:2)
		let hi_grp .= 'guibg=' . a:2 . ' '
	endif

	if a:0 >= 3 && strlen(a:3)
		let hi_grp .= 'gui=' . a:3
	endif

	exec hi_grp
endfunction

call SetHighlightGroup("Normal", "#FCFCFA", "#0F1419")
call SetHighlightGroup("ColorColumn", "NONE", "#0F1419")
call SetHighlightGroup("CursorColumn", "NONE", "#0F1419")
call SetHighlightGroup("CursorLine", "NONE", "#0F1419")
call SetHighlightGroup("CursorLineNr", "#FFD866", "#0F1419")
call SetHighlightGroup("LineNr", "#394C5F", "NONE")
call SetHighlightGroup("Directory", "#FCFCFA", "NONE")
call SetHighlightGroup("DiffAdd", "#89FC67", "#0F1419")
call SetHighlightGroup("DiffChange", "#67D4FC", "#0F1419")
call SetHighlightGroup("DiffText", "#FCFCFA", "#0F1419")
call SetHighlightGroup("ErrorMsg", "#FCFCFA", "#FC6A67")
call SetHighlightGroup("VertSplit", "#0F1419", "NONE")
call SetHighlightGroup("Folded", "#1D2730", "#0F1419")
call SetHighlightGroup("FoldColumn", "NONE", "#0F1419")
call SetHighlightGroup("SignColumn", "NONE", "#0F1419")
call SetHighlightGroup("MatchParen", "#FFD866", "#0F1419", "underline")
call SetHighlightGroup("ModeMsg", "#89FC67", "NONE")
call SetHighlightGroup("MoreMsg", "#89FC67", "NONE")
call SetHighlightGroup("NonText", "#5A5A59", "NONE")
call SetHighlightGroup("Pmenu", "#FCFCFA", "#1D2730")
call SetHighlightGroup("PmenuSel", "#1D2730", "#FC6A67", "bold")
call SetHighlightGroup("Question", "#89FC67", "NONE")
call SetHighlightGroup("Search", "#0F1419", "#FC8F67")
call SetHighlightGroup("SpecialKey", "#5A5A59", "NONE")
call SetHighlightGroup("SpellCap", "#67D4FC", "NONE", "underline")
call SetHighlightGroup("SpellLocal", "#FC8F67", "NONE", "underline")
call SetHighlightGroup("SpellBad", "#FC6A67", "NONE", "underline")
call SetHighlightGroup("SpellRare", "#89FC67", "NONE", "underline")
call SetHighlightGroup("StatusLine", "#1D2730", "#FCFCFA")
call SetHighlightGroup("StatusLineNC", "#1D2730", "#FCFCFA")
call SetHighlightGroup("WildMenu", "#0F1419", "#FC6A67")
call SetHighlightGroup("TabLine", "#1D2730", "#FFD866", "reverse")
call SetHighlightGroup("TabLineSel", "#FC8F67", "#0F1419")
call SetHighlightGroup("TabLineFill", "#1D2730", "NONE")
call SetHighlightGroup("Title", "#FC8F67", "NONE")
call SetHighlightGroup("Visual", "NONE", "#1D2730")
call SetHighlightGroup("WarningMsg", "#FC6A67", "NONE")
call SetHighlightGroup("Comment", "#394C5F", "NONE")
call SetHighlightGroup("Constant", "#D967FC", "NONE")
call SetHighlightGroup("String", "#89FC67", "NONE")
call SetHighlightGroup("Identifier", "#67D4FC", "NONE")
call SetHighlightGroup("Function", "#FFD866", "NONE")
call SetHighlightGroup("Statement", "#FC8F67", "NONE")
call SetHighlightGroup("Operator", "#FC6A67", "NONE")
call SetHighlightGroup("PreProc", "#FFD866", "NONE")
call SetHighlightGroup("Type", "#FC6A67", "NONE")
call SetHighlightGroup("Structure", "#FFD866", "NONE")
call SetHighlightGroup("Special", "#FFD866", "NONE")
call SetHighlightGroup("Underlined", "#67D4FC", "NONE", "underline")
call SetHighlightGroup("Ignore", "NONE", "NONE")
call SetHighlightGroup("Error", "#FCFCFA", "#FC6A67")
call SetHighlightGroup("Todo", "#FC6A67", "NONE")
call SetHighlightGroup("qfLineNr", "#FC8F67", "NONE")
call SetHighlightGroup("Conceal", "#5A5A59", "NONE")
call SetHighlightGroup("CursorLineConceal", "#5A5A59", "#1D2730")
