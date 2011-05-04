"	MTUP Syntax File
"	Language:	ICL/Fujitsu VME Message Text Update programs
"	Maintainer:	Andy Long (Andrew.Long@Yahoo.com)
"	LastChange:	$Date$
"	Remarks:	VME MTUP is the Message Text Generation Language for the
"			(formerly) ICL (now) Fujitsu mainframe VME systems.
"
"	$Log: mtup.vim,v $
"
if version<600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

if !exists("b:mtup_fold_conditionals")
	if exists('g:mtup_fold_conditionals')
		let b:mtup_fold_conditionals=g:mtup_fold_conditionals
	else
		let b:mtup_fold_conditionals=0
	endif
endif

if !exists("b:mtup_fold_messages")
	if exists('g:mtup_fold_messages')
		let b:mtup_fold_messages=g:mtup_fold_messages
	else
		let b:mtup_fold_messages=0
	endif
endif

syntax	sync	fromstart
syntax	sync	maxlines=2000
"
"	Everything not explictly allowed is an error
"
syntax	match	mtupError
	\	/\S\+/
syntax	match	mtupError contained
	\	/\S\+/
"
"	Comments can only be in Command Lines
"
syntax	region	mtupCommentInCommand oneline keepend extend contained contains=mtupTodo
	\	start=/@/ end=/@/ end=/$/
syntax	region	mtupCommentInEscape keepend extend contained contains=mtupTodo
	\	start=/@/ end=/@/
syntax	keyword	mtupTodo contained
	\	TODO	FIXME	FIXTHIS	BUG	NVB
"
"	Some standard syntactic units
"
syntax	match	mtupStringConst contained
	\	/\<\S\+\>/
syntax	match	mtupEscapeChars contained
	\	/./
syntax	match	mtupTextNo contained
	\	/\([0-9]\{,8}\|1\[0-9]\{8}\|2[0-5][0-9]\{7}\|26[0-7][0-9\{6}\|268[0-3][0-9]\{5}\|2684[0-2][0-9]\{4}\|26843[0-4][0-9]\{3}\|268435[0-3][0-9]\{2}\|2684354[0-4][0-9]\|26843545[0-5]\)\>/
syntax	match	mtupDigits contained
	\	/\d\+/
syntax	match	mtupPositiveNumber contained
	\	/\<\d\+\>/
syntax	match	mtupNumber contained
	\	/\(-\)\=\s*\<\d\+\>/
syntax	match	mtupVersionLimits contained
	\	/\<[0-9]\{1,4}\>/

syntax	match	mtupProcedureName contained
	\	/\<\a\k\{0,31}\>/

syntax	match	mtupStartEscape contained
	\	/</
syntax	match	mtupEndEscape contained
	\	/>/
syntax	match	mtupAmpersand contained
	\	/&/
syntax	match	mtupControlChar contained
	\	/^./
syntax	match	mtupParens contained
	\	/[()]/
syntax	match	mtupComma contained
	\	/,/

syntax	match	mtupCaseItem contained contains=@mtupCaseItems skipwhite skipempty
	\	nextgroup=mtupStartsClause,mtupEqualsClause,mtupThenClause,
	\	@mtupParameterValues
	\	/\<[PTS]\S\+\>/
syntax	match	mtupCaseItem contained contains=@mtupCaseItems skipwhite skipempty
	\	nextgroup=mtupStartsClause,mtupEqualsClause,mtupThenClause,
	\	@mtupParameterValues
	\	/<.\+>/

" syntax	match	mtupCharacterString contained contains=mtupStartEscape,mtupEndEscape
" 	\	/<[^<>]*>/
syntax	match	mtupAdd contained
	\	/\<ADD\>/
syntax	match	mtupAmend contained
	\	/\<AMEND\>/
syntax	match	mtupAs contained skipwhite skipempty nextgroup=mtupTextNo
	\	/\<AS\>/
syntax	match	mtupCase contained skipwhite skipempty nextgroup=mtupCaseItem
	\	/\<CASE\>/
syntax	match	mtupCol contained
	\	/\<COL/
syntax	match	mtupCreate contained
	\	/\<CREATE\>/
syntax	match	mtupDefault contained
	\	/\<DEFAULT\>/
syntax	match	mtupDelete contained
	\	/\<DELETE\>/
syntax	match	mtupEnd contained
	\	/\<END\>/
syntax	match	mtupEquals contained
	\	/\<EQUALS\>/
syntax	match	mtupEsac contained
	\	/\<ESAC\>/
syntax	match	mtupExp contained
	\	/\<EXP\>/
syntax	match	mtupEsc contained
	\	/\<ESC/
syntax	match	mtupEscape contained
	\	/\<ESCAPE\>/
syntax	match	mtupHalt contained skipwhite skipempty nextgroup=mtupNumber
	\	/\<HALT\>/
syntax	match	mtupHex contained
	\	/\<HEX/
syntax	match	mtupHLL contained
	\	/\<HLL\>/
syntax	match	mtupICL contained
	\	/\<ICL\>/
syntax	match	mtupJust contained skipwhite skipempty nextgroup=mtupJustParams
	\	/\<JUST\>/
syntax	match	mtupLine contained
	\	/\<LINE/
syntax	match	mtupLineSplit contained
	\	/\<LINESPLIT\>/
syntax	match	mtupLR contained
	\	/[LR]/
syntax	match	mtupNo contained
	\	/\<NO\>/
syntax	match	mtupNoExp contained
	\	/\<NOEXP\>/
syntax	match	mtupNonStd contained
	\	/\<NONSTD\>/
syntax	match	mtupOr contained
	\	/\<OR\>/
syntax	match	mtupParams contained
	\	/\<PARAMS\>/
syntax	match	mtupProc contained
	\	/\<PROC\>/
syntax	match	mtupRefText contained
	\	/\<[FR]\>/
syntax	match	mtupReplace contained
	\	/\<REPLACE\>/
syntax	match	mtupSpace contained
	\	/\<SPACE\>/
syntax	match	mtupSpaceFill contained
	\	/\<SPACEFILL\>/
syntax	match	mtupStarts contained
	\	/\<STARTS\>/
syntax	match	mtupStd contained
	\	/\<STD\>/
syntax	match	mtupSubName contained
	\	/\<SUBNAME\>/
syntax	match	mtupTab contained
	\	/\<TAB/
syntax	match	mtupThen contained
	\	/\<THEN/
syntax	match	mtupVersion contained
	\	/\<VERSION\>/
syntax	match	mtupYes contained
	\	/\<YES\>/

syntax	match	mtupFormatEffectors contained
	\	/\<FORM\>/
syntax	match	mtupFormatEffectors contained skipwhite skipempty nextgroup=mtupDigits
	\	/\<L/
syntax	match	mtupFormatEffectors contained skipwhite skipempty nextgroup=mtupDigits
	\	/\<S/
syntax	match	mtupFormatEffectors contained contains=mtupLine,mtupCol,mtupEsc,
	\		mtupError,mtupDigits,mtupComma
	\	/\<\(LINE\|COL\|ESC\)\s*\S\+/
syntax	match	mtupFormatEffectors contained skipwhite skipempty nextgroup=mtupHexChars
	\	/\<X/
syntax	match	mtupHexChars contained
	\	/[0-9A-F ]\+\>/

syntax	match	mtupHexInsertion contained contains=mtupHex,mtupFormatEffectors,
	\		mtupParameterInsertion,mtupError
	\	/\<HEX\s*\S\+\>/
syntax	match	mtupParameterInsertion contained
	\	contains=mtupTextNo
	\	/P\s*\d\+\>/
syntax	match	mtupTextInsertion contained contains=mtupParameterInsertion,mtupTextNo
	\	/\<T\s*P\=\s*\S\+\>/
syntax	match	mtupTabInsertion contained contains=mtupTab,mtupDigits,
	\		mtupParameterInsertion,mtupError
	\	/\<TAB\s*P\=\s*\S\+\>/
syntax	match	mtupTextConcatenation contained contains=mtupParameterInsertion,
	\	mtupTextNo
	\	/\<J\s*P\=\s*\S\+\>/

syntax	match	mtupJustParams contained contains=mtupParameterInsertion,
	\		mtupTextInsertion,mtupDigits,mtupLR
	\	/\<\(P\s*\)\=\d\+\s*\([LR]\s*\)\=\<\(P\|T\|T\s*P\)\s*\d\+\>/
syntax	match	mtupJustClause contained contains=mtupJust skipwhite skipempty
	\	nextgroup=mtupJustParams
	\	/\<JUST\>/

syntax	region	mtupStartsClause contained contains=mtupCommentInEscape,@mtupParameterValues,mtupOr,mtupError skipwhite skipempty nextgroup=mtupThenClause
	\	matchgroup=mtupStarts start=/\<STARTS\>/
	\	matchgroup=NONE end=/\ze\<THEN\>/

syntax	region	mtupEqualsClause contained contains=mtupCommentInEscape,@mtupParameterValues,mtupOr,mtupError skipwhite skipempty nextgroup=mtupThenClause
	\	matchgroup=mtupEquals start=/\<EQUALS\>/
	\	matchgroup=NONE end=/\ze\<THEN\>/

syntax	region	mtupDefaultClause contained contains=mtupError,mtupCommentInEscape,
	\		@mtupParameterValues
	\	matchgroup=mtupDefault start=/\<DEFAULT\>/
	\	matchgroup=NONE end=/\ze\<ESAC\>/

syntax	region	mtupThenClause contained contains=mtupError,mtupCommentInEscape,
	\		@mtupParameterValues
	\	matchgroup=mtupThen start=/\<THEN\>/
	\	matchgroup=NONE end=/\ze\(,\|\<DEFAULT\>\|\<ESAC\>\)/

if b:mtup_fold_messages
	syntax	region	mtupNestedMessage fold keepend extend contained
		\	contains=mtupEscapeClause,mtupStringConst
		\	matchgroup=mtupStartEscape start=/</
		\	matchgroup=mtupEndEscape end=/>/
else
	syntax	region	mtupNestedMessage keepend extend contained 
		\	contains=mtupEscapeClause,mtupStringConst
		\	matchgroup=mtupStartEscape start=/</
		\	matchgroup=mtupEndEscape end=/>/
endif

syntax	region	mtupEscapeClause keepend extend contained 
	\	contains=mtupCommentInEscape,mtupComma,mtupAs,
	\		@mtupParameterValues,mtupError
	\	matchgroup=mtupStartEscape start=/</
	\	matchgroup=mtupEndEscape end=/>/

if b:mtup_fold_conditionals
	syntax	region	mtupCaseClause fold keepend extend contained 
		\	contains=mtupCaseItem,mtupOr,mtupComma,mtupStartsClause,
		\		mtupEqualsClause,mtupDefaultClause,
		\		mtupThenClause,mtupCommentInEscape,mtupError
		\	matchgroup=mtupCase start=/\<CASE\>/ 
		\	matchgroup=mtupEsac end=/\<ESAC\>/
else
	syntax	region	mtupCaseClause keepend extend contained 
		\	contains=mtupCaseItem,mtupOr,mtupComma,mtupStartsClause,
		\		mtupEqualsClause,mtupDefaultClause,
		\		mtupThenClause,mtupCommentInEscape,mtupError
		\	matchgroup=mtupCase start=/\<CASE\>/ 
		\	matchgroup=mtupEsac end=/\<ESAC\>/
endif

syntax	match	mtupCommentCommand contained contains=mtupControlChar,mtupError,
	\		mtupCommentInCommand
	\	/^.\s*@.*$/

syntax	match	mtupAddCommand contained skipwhite skipempty nextgroup=mtupStringConst,
	\		mtupEscape contains=mtupControlChar,mtupAdd,mtupParens,
	\		mtupTextNo,mtupRefText,mtupError,mtupCommentInCommand
	\	/^..\{-}\<ADD\>.\{-}(.\{-}).*$/
if b:mtup_fold_messages
	syntax	match	mtupAddClause fold extend contained contains=mtupAddCommand,
		\		mtupEscapeClause,mtupStringConst
		\	/^\(.\).\{-}\<ADD\>.\{-}(.\{-})\_.\{-}\ze\n\1/
else
	syntax	match	mtupAddClause extend contained contains=mtupAddCommand,
		\		mtupEscapeClause,mtupStringConst
		\	/^\(.\).\{-}\<ADD\>.\{-}(.\{-})\_.\{-}\ze\n\1/
endif

syntax	match	mtupReplaceTextCommand contained skipwhite skipempty 
	\	nextgroup=mtupStringConst,mtupEscape
	\	contains=mtupControlChar,mtupReplace,mtupParens,mtupTextNo,mtupRefText,
	\		mtupError,mtupCommentInCommand
	\	/^..\{-}\<REPLACE\>.\{-}(.\{-}).*$/
if b:mtup_fold_messages
	syntax	match	mtupReplaceTextClause fold extend contained contains=mtupReplaceTextCommand,
		\		mtupEscapeClause,mtupStringConst
		\	/^\(.\).\{-}\<REPLACE\>.\{-}(.\{-})\_.\{-}\ze\n\1/
else
	syntax	match	mtupReplaceTextClause extend contained contains=mtupReplaceTextCommand,
		\		mtupEscapeClause,mtupStringConst
		\	/^\(.\).\{-}\<REPLACE\>.\{-}(.\{-})\_.\{-}\ze\n\1/
endif

syntax	match	mtupDeleteCommand contained contains=mtupControlChar,mtupDelete,
	\		mtupParens,mtupTextNo,mtupError,mtupCommentInCommand
	\	/^..\{-}\<DELETE\>.\{-}(.\{-})/

syntax	match	mtupProcCommand contained contains=mtupControlChar,mtupProc,
	\		mtupParens,mtupProcedureName,mtupError,mtupCommentInCommand
	\	/^..\{-}\<PROC\>.\{-}(.\{-}).*$/

syntax	match	mtupSubNameCommand contained contains=mtupControlChar,mtupSubName,
	\		mtupParens,mtupProcedureName,mtupError,mtupCommentInCommand
	\	/^..\{-}\<SUBNAME\>.\{-}(.\{-}).*$/

syntax	match	mtupVersionCommand contained contains=mtupControlChar,mtupVersion,
	\		mtupParens,mtupVersionLimits,mtupError,mtupCommentInCommand
	\	/^..\{-}\<VERSION\>.\{-}(.\{-}).*$/

syntax	match	mtupParamsCommand contained contains=mtupControlChar,mtupParams,
	\		mtupParens,mtupExp,mtupNoExp,mtupICL,mtupHLL,mtupStd,mtupNonStd,
	\		mtupAmpersand,mtupError,mtupCommentInCommand
	\	/^..\{-}\<PARAMS\>.\{-}(.\{-}).*$/

syntax	match	mtupSpaceFillCommand contained contains=mtupControlChar,mtupSpaceFill,
	\		mtupParens,mtupYes,mtupNo,mtupAmpersand,mtupError,
	\		mtupCommentInCommand
	\	/^..\{-}\<SPACEFILL\>.\{-}(.\{-}).*$/

syntax	match	mtupLineSplitCommand contained contains=mtupControlChar,mtupLineSplit,
	\		mtupParens,mtupStd,mtupSpace,mtupAmpersand,
	\		mtupError,mtupCommentInCommand
	\	/^..\{-}\<LINESPLIT\>.\{-}(.\{-}).*$/

syntax	match	mtupEscapeCommand contains=mtupControlChar,mtupEscape,mtupParens,
	\		mtupError,mtupCommentInCommand
	\	/^..\{-}\<ESCAPE\>.\[_](.\{-}).*$/
syntax	match	mtupEscapeCommand contains=mtupControlChar,mtupEscape,mtupParens,
	\		mtupEscapeChars,mtupError,mtupCommentInCommand
	\	/^\(.\)\s*\<ESCAPE\>\s*(\s*[^\1\,\@]\{2}\s*).*$/

syntax	match	mtupCreateCommand contained contains=mtupControlChar,mtupCreate,
	\		mtupError,mtupCommentInCommand
	\	/^..\{-}\<CREATE\>.*$/
syntax	match	mtupCreateCommand contained contains=mtupControlChar,mtupCreate,
	\		mtupParens,mtupProcedureName,mtupError,mtupCommentInCommand
	\	/^..\{-}\<CREATE\>.\{-}(\{-}).*$/

syntax	match	mtupAmendCommand contained contains=mtupControlChar,mtupAmend,
	\		mtupError,mtupCommentInCommand
	\	/^..\{-}\<AMEND\>.*$/
syntax	match	mtupAmendCommand contained contains=mtupControlChar,mtupAmend,
	\		mtupParens,mtupProcedureName,mtupError,
	\		mtupCommentInCommand
	\	/^..\{-}\<AMEND\>.\{-}(.\{-}).*$/

syntax	match	mtupReplaceMTMCommand contained contains=mtupControlChar,mtupReplace,
	\		mtupError,mtupCommentInCommand
	\	/^..\{-}\<REPLACE\>.*$/
syntax	match	mtupReplaceMTMCommand contained	contains=mtupControlChar,mtupReplace,
	\		mtupParens,mtupProcedureName,mtupError,
	\		mtupCommentInCommand
	\	/^..\{-}\<REPLACE\>.\{-}(.\{-}).*$/

syntax	match	mtupEndCommand contained contains=mtupControlChar,mtupEnd,
	\		mtupError,mtupCommentInCommand
	\	/^..\{-}\<END\>.*$/

syntax	cluster	mtupCaseItems contains=mtupParameterInsertion,mtupTextInsertion,
	\		mtupNestedMessage,mtupFormatEffectors

syntax	cluster	mtupParameterValues contains=mtupParameterInsertion,
	\		mtupTextInsertion,mtupTabInsertion,mtupHexInsertion,
	\		mtupTextConcatenation,mtupHalt,mtupNestedMessage,
	\		mtupFormatEffectors,mtupJustClause,mtupCaseClause

syntax	cluster	mtupAmendCommands contains=mtupAmendCommand,
	\		@mtupAmendReplaceMTMCommands,mtupAddCommand,mtupDeleteCommand,
	\		mtupReplaceTextClause
syntax	cluster	mtupReplaceMTMCommands contains=mtupReplaceMTMCommand,
	\		@mtupAmendReplaceMTMCommands,mtupAddCommand,mtupDeleteCommand,
	\		mtupReplaceTextClause
syntax	cluster	mtupAmendReplaceMTMCommands contains=mtupError,
	\		mtupSpaceFillCommand,mtupLineSplitCommand,mtupEscapeCommand,
	\		mtupAddClause,mtupEndCommand,mtupCommentCommand
syntax	cluster	mtupCreateCommands contains=mtupCreateCommand,
	\		@mtupAmendReplaceMTMCommands,mtupProcCommand,mtupSubNameCommand,
	\		mtupVersionCommand,mtupParamsCommand

syntax	region	mtupCreateRun keepend contains=@mtupCreateCommands
	\	start=/^\z(.\).\{-}\<CREATE\>/ end=/^\z1.\{-}\<END\>.*$/
syntax	region	mtupAmendRun keepend contains=@mtupAmendCommands
	\	start=/^\z(.\).\{-}\<AMEND\>/ end=/^\z1.\{-}\<END\>.*$/
syntax	region	mtupReplaceRun keepend contains=@mtupReplaceMTMCommands
	\	start=/^\z(.\).\{-}\<REPLACE\>/ end=/^\z1.\{-}\<END\>.*$/

if version >= 508 || !exists("did_c_syn_inits")
	if version < 508
		let	did_c_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink	mtupDigits		Number
	HiLink	mtupNumber		Number
	HiLink	mtupTextNo		Number
	HiLink	mtupHexChars		Number
	HiLink	mtupPositiveNumber	Number

	HiLink	mtupCommentInEscape	Comment
	HiLink	mtupCommentInCommand	Comment

	HiLink	mtupConstant		Constant
	HiLink	mtupProcedureName	Constant
	HiLink	mtupEscapeChars		Constant
	HiLink	mtupStd			Statement
	HiLink	mtupNonStd		Statement
	HiLink	mtupSpace		Statement
	HiLink	mtupExp			Statement
	HiLink	mtupNoExp		Statement
	HiLink	mtupNo			Statement
	HiLink	mtupYes			Statement
	HiLink	mtupICL			Statement
	HiLink	mtupHLL			Statement
	HiLink	mtupRefText		Statement

	HiLink	mtupStringConst		String

	HiLink	mtupAddClause		String
	HiLink	mtupReplaceTextClause	String

	HiLink	mtupEscape		Statement
	HiLink	mtupNestedMessage	String
	HiLink	mtupCharacterString	String

	HiLink	mtupCreate		Statement
	HiLink	mtupAmend		Statement
	HiLink	mtupReplace		Statement
	HiLink	mtupAdd			Statement
	HiLink	mtupDelete		Statement
	HiLink	mtupEnd			Statement
	HiLink	mtupSpaceFill		Statement
	HiLink	mtupLineSplit		Statement
	HiLink	mtupVersion		Statement
	HiLink	mtupProc		Statement
	HiLink	mtupSubName		Statement
	HiLink	mtupParams		Statement

	HiLink	mtupCase		Statement
	HiLink	mtupThen		Statement
	HiLink	mtupStarts		Operator
	HiLink	mtupEquals		Operator
	HiLink	mtupOr			Operator
	HiLink	mtupDefault		Statement
	HiLink	mtupEsac		Statement

	HiLink	mtupParameterInsertion	Statement
	HiLink	mtupTextInsertion	Statement
	HiLink	mtupHexInsertion	Statement
	HiLink	mtupTabInsertion	Statement
	HiLink	mtupTextConcatenation	Statement
	HiLink	mtupFormatEffectors	Statement
	HiLink	mtupLine		Statement
	HiLink	mtupCol			Statement
	HiLink	mtupEsc			Statement
	HiLink	mtupHex			Statement
	HiLink	mtupTab			Statement
	HiLink	mtupAs			Statement

	HiLink	mtupJust		Statement
	HiLink	mtupLR			Statement

	HiLink	mtupHalt		Statement

	HiLink	mtupConditional		Conditional

	HiLink	mtupSpecial		Special
	HiLink	mtupSpecialChar		SpecialChar
	HiLink	mtupStringEsc1		Special
	HiLink	mtupStringEsc2		Special
	HiLink	mtupTag			Tag
	HiLink	mtupDelimiter		Delimiter
	HiLink	mtupParens		Delimiter
	HiLink	mtupComma		Delimiter
	HiLink	mtupAmpersand		Delimiter
	HiLink	mtupControlChar		Delimiter
	HiLink	mtupStartEscape		Delimiter
	HiLink	mtupEndEscape		Delimiter
	HiLink	mtupSpecialComment	SpecialComment
	HiLink	mtupDebug		Debug

	HiLink	mtupUnderlined		Underlined

	HiLink	mtupIgnore		Ignore

	HiLink	mtupError		Error

	HiLink	mtupTodo		Todo

	delcommand HiLink
endif

let b:current_syntax = "mtup"
