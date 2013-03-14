" Vim color scheme based on https://github.com/ryanb/dotfiles/blob/master/vim/colors/railscasts.vim
"
" Name:        railscasts.vim
" Maintainer:  Igor Pstyga
" License:     MIT

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "railscasts"

let ruby_operators = 1
" let ruby_no_expensive = 1

" Colors
" Brown        #BC9357
" Dark Blue    #6D9CBD
" Dark Green   #509E50
" Dark Orange  #CC7733
" Light Blue   #CFCFFF
" Light Green  #A5C160
" Tan          #FFC66D
" Red          #DA4938

hi Normal     guifg=#E6E1DC guibg=#232323
hi Cursor     guibg=#FFFFFF
hi CursorLine guibg=#333435
hi LineNr     guifg=#666666
hi Visual     guibg=#5A647E
hi Search     guifg=NONE    guibg=#131313  gui=NONE
hi Folded     guifg=#F6F3E8 guibg=#444444  gui=NONE
hi Directory  guifg=#A5C160 gui=NONE
hi Error      guifg=#FFFFFF guibg=#990000
hi MatchParen guifg=#000000    guibg=#A5C160
hi Title      guifg=#E6E1DC

hi Comment    guifg=#BC9357 guibg=NONE     gui=italic
hi! link Todo Function

hi String     guifg=#A5C160
hi! link Number String
hi! link rubyStringDelimiter String

" nil, self, symbols
hi Constant guifg=#6D9CBD
hi rubyPseudoVariable guifg=#CFCFFF
hi! link jsThis rubyPseudoVariable
" hi! link rubyEval Normal

" def, end, include, load, require, alias, super, yield, lambda, proc
hi Define guifg=#CC7733 gui=NONE
hi! link Include Define
hi! link Keyword Define
hi! link Macro Define
hi! link rubyClass Define
hi! link rubyModule Define
hi! link rubyDefine Define
hi! link rubyKeyword Define
hi! link rubyKeywordAsMethod Define
hi! link Operator Define
hi! link rubyOperator Define

hi! link rubyExceptional Define
hi! link rubyMethodExceptional rubyExceptional

hi rubyConstant guifg=#DA4938

" #{foo}, <%= bar %>
hi Delimiter guifg=#509E50
" hi Delimiter guifg=#CC7833
" hi erubyDelimiter guifg=NONE

"rubyInterpolation
hi! link rubyInterpolation Normal

" function name (after def)
hi Function guifg=#FFC66D gui=NONE

"@var, @@var, $var
hi Identifier guifg=#CFCFFF gui=NONE

" |param|
hi rubyBlockParameter guifg=#CFCFFF gui=NONE
hi! link rubyInterpolation rubyBlockParameter
" #if, #else, #endif

" case, begin, do, for, if, unless, while, until, else
hi Statement guifg=#CC7733 gui=NONE
hi! link PreProc Statement
hi! link PreCondit Statement

" SomeClassName
hi Type guifg=NONE gui=NONE

" has_many, respond_to, params
" hi railsMethod guifg=#DA4938 gui=NONE
hi! link railsMethod Normal

hi DiffAdd guifg=#E6E1DC guibg=#144212
hi DiffDelete guifg=#E6E1DC guibg=#660000

hi xmlTag guifg=#E8BF6A
hi! link xmlTagName  xmlTag
hi! link xmlEndTag   xmlTag
hi! link xmlArg      xmlTag
hi! link htmlTag     xmlTag
hi! link htmlTagN    xmlTag
hi! link htmlTagName xmlTagName
hi! link htmlEndTag  xmlEndTag
hi! link htmlArg     xmlArg

" Popup Menu
" ----------
" normal item in popup
hi Pmenu guifg=#F6F3E8 guibg=#444444 gui=NONE
" selected item in popup
hi PmenuSel guifg=#000000 guibg=#A5C160 gui=NONE
" scrollbar in popup
hi PMenuSbar guibg=#5A647E gui=NONE
" thumb of the scrollbar in the popup
hi PMenuThumb guibg=#AAAAAA gui=NONE

" MiniBufExpl Colors
" ------------------
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg


" hi rubyDelimEscape guifg=#FF0000
" hi rubyNestedParentheses guifg=#FF0000
" hi rubyNestedCurlyBraces guifg=#FF0000
" hi rubyNestedAngleBrackets guifg=#FF0000
" hi rubyNestedSquareBrackets guifg=#FF0000
" hi rubyRegexpParens guifg=#FF0000
" hi rubyRegexpBrackets guifg=#FF0000
" hi rubyLocalVariableOrMethod guifg=#FF0000
" hi rubyBlockArgument guifg=#FF0000
" hi rubyBlockParameter guifg=#FF0000
" hi rubyBlockParameterList guifg=#FF0000
" hi rubyPredefinedConstant guifg=#FF0000
" hi rubyHeredocStart guifg=#FF0000
" hi rubyAliasDeclaration2 guifg=#FF0000
" hi rubyAliasDeclaration guifg=#FF0000
" hi rubyMethodDeclaration guifg=#FF0000
" hi rubyClassDeclaration guifg=#FF0000
" hi rubyModuleDeclaration guifg=#FF0000
" hi! link rubyMethodBlock Normal
" hi! link rubyBlock Function
" hi rubyDoBlock guifg=#FF0000
" hi rubyCurlyBlock guifg=#FF0000
" hi rubyArrayDelimiter guifg=#FF0000
" hi rubyArrayLiteral guifg=#FF0000
" hi rubyBlockExpression guifg=#FF0000
" hi rubyCaseExpression guifg=#FF0000
" hi rubyConditionalExpression guifg=#FF0000
" hi rubyOptionalDoLine guifg=#FF0000
" hi rubyRepeatExpression guifg=#FF0000
" hi rubyMultilineComment guifg=#FF0000
" hi Operator guifg=#FF0000
" hi erubyBlock guifg=#FF0000
" hi erubyExpression guifg=#FF0000
"
"
" hi rubyRailsMethod guifg=#FF0000
" hi rubyRailsARMethod guifg=#FF0000
" hi rubyRailsARAssociationMethod guifg=#FF0000
" hi rubyRailsARCallbackMethod guifg=#FF0000
" hi rubyRailsARClassMethod guifg=#FF0000
" hi rubyRailsARValidationMethod guifg=#FF0000
" hi rubyRailsRenderMethod guifg=#FF0000
" hi rubyRailsControllerMethod guifg=#FF0000
" hi rubyRailsViewMethod guifg=#FF0000
" hi rubyRailsFilterMethod guifg=#FF0000
" hi rubyRailsMigrationMethod guifg=#FF0000
" hi rubyRailsTestMethod guifg=#FF0000
" hi rubyRailsTestControllerMethod guifg=#FF0000
" hi rubyRailsAPIMethod guifg=#FF0000
" hi rubyRailsHelperMethod guifg=#FF0000
" hi rubyRailsRakeMethod guifg=#FF0000
" hi railsUserMethod guifg=#FF0000
" hi rubyRailsUserMethod guifg=#FF0000
"
