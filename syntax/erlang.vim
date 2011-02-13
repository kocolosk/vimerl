" Vim syntax file
" Language:   Erlang
" Maintainer: Oscar Hellström <oscar@oscarh.net>
" URL:        http://oscar.hellstrom.st
" Version:    2010-08-09
" ------------------------------------------------------------------------------

" Setup {{{1
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Erlang is case sensitive
syn case match

" Match groups {{{1

syn match erlangStringModifier  /\\./ contained
syn match erlangStringModifier  /\~\%(-\?[0-9*]\+\)\?\%(\.[0-9*]\+\..\?\)\?\%(c\|f\|e\|g\|s\|w\|p\|W\|P\|B\|X\|#\|b\|+\|n\|i\)/ contained
syn match erlangModifier        /\$\\\?./

syn match erlangInteger         /\<\%([0-9]\+#[0-9a-fA-F]\+\|[0-9]\+\)\>/
syn match erlangFloat           /\<[0-9]\+\.[0-9]\+\%(e-\?[0-9]\+\)\?\>/

syn keyword erlangTodo          TODO FIXME XXX contained
syn match erlangEDoc            /\(%%\s*\)\@<=@\w\+/ contained
syn match erlangComment         /%.*$/ contains=@Spell,erlangTodo,erlangEDoc

syn keyword erlangKeyword       band bor bnot bsl bsr bxor div rem xor
syn keyword erlangKeyword       begin cond fun let query

syn keyword erlangMessage       receive after

syn keyword erlangException     try catch

syn keyword erlangConditional   case if of
syn keyword erlangConditional   not and or andalso orelse
syn keyword erlangConditional   when

syn keyword erlangEnd           end

syn keyword erlangBoolean       true false

syn keyword erlangGuard         is_list is_atom is_binary
syn keyword erlangGuard         is_bitstring is_boolean
syn keyword erlangGuard         is_tuple is_number is_integer
syn keyword erlangGuard         is_float is_function is_constant
syn keyword erlangGuard         is_pid is_port is_reference
syn keyword erlangGuard         is_record is_process_alive

syn match erlangOperator        /\/\|*\|+\|-\|++\|--/
syn match erlangOperator        /->\|<-\|||\||\|!\|=/
syn match erlangOperator        /=:=\|==\|\/=\|=\/=\|<\|>\|=<\|>=/
syn keyword erlangOperator      div rem

"---OK?  Skip needs quotes?
syn region erlangString         start=/"/ end=/"/ skip=/\\/ contains=@Spell,erlangStringModifier

syn match erlangVariable        /\<[A-Z_]\w*\>/
syn match erlangIgnoredVariable /\<_\w*\>/
syn match erlangAtom            /\%(\%(^-\)\|#\)\@<!\<[a-z]\w*\>(\@!/
syn match erlangAtom            /\\\@<!'[^']*\\\@<!'/

syn match erlangModule          /\<[a-z]\w*:\@=/ contained
syn match erlangFunction        /\<[a-z][A-Za-z0-9_:]*\s*(\@=/ contains=erlangModule
syn match erlangTopFunction     /^[a-z]\w*\s*(\@=/

syn match erlangRecord          /#\w\+/

syn match erlangTuple           /{\|}/
syn match erlangList            /\[\|\]/

syn match erlangTitle           /\(^-module\s*(\)\@<=\w\+/
syn match erlangAttribute       /^-\%(vsn\|author\|copyright\|compile\|deprecated\|module\|export\|import\|behaviour\)\s*(\@=/
syn match erlangInclude         /^-include\%(_lib\)\? *(\@=/
syn match erlangRecordDef       /^-record *(\@=/
syn match erlangDefine          /^-define *(\@=/
syn match erlangPreCondit       /^-\%(ifdef\|ifndef\|endif\) *(\@=/

syn match erlangType            /^-\%(spec\|type\)[( ]\@=/

syn match erlangConstant        /\%(-define(\)\@<=\w\+/
syn match erlangConstant        /?\w\+/
syn match erlangMacro           /\%(-define(\)\@<=\w\+\s*(\@=/
syn match erlangMacro           /?\w\+\s*(\@=/

syn match erlangBitType         /\%(\/\|-\)\@<=\%(bits\|bitstring\|binary\|integer\|float\|unit\)\>/
syn match erlangBitSize         /:\@<=[0-9]\+/

syn match erlangBinary          /<<\|>>/
" }}}

" Link Erlang stuff to Vim groups {{{1
hi link erlangTitle          Title
hi link erlangTodo           Todo
hi link erlangString         String
hi link erlangNoSpellString  String 
hi link erlangModifier       Character
hi link erlangStringModifier SpecialChar
hi link erlangComment        Comment
hi link erlangVariable       Identifier
hi link erlangIgnoredVariable Identifier
hi link erlangEDoc           SpecialComment
hi link erlangInclude        Include
hi link erlangRecordDef      Typedef
hi link erlangAttribute      Keyword
hi link erlangKeyword        Keyword
hi link erlangMacro          Macro
hi link erlangDefine         Define
hi link erlangConstant       Constant
hi link erlangPreCondit      PreCondit
hi link erlangPreProc        PreProc
hi link erlangDelimiter      Delimiter
hi link erlangEnd            Conditional
hi link erlangBitDelimiter   Normal
hi link erlangOperator       Operator
hi link erlangConditional    Conditional
hi link erlangGuard          Function
hi link erlangBoolean        Constant
hi link erlangAtom           Constant
hi link erlangRecord         Structure
hi link erlangInteger        Number
hi link erlangFloat          Float
hi link erlangHex            Number
hi link erlangFun            Keyword
hi link erlangFunction       Function
hi link erlangTopFunction    Function
hi link erlangModule         Underlined
hi link erlangList           Delimiter
hi link erlangTuple          Delimiter
hi link erlangBinary         Normal
hi link erlangBitVariable    Identifier
hi link erlangBitType        Type
hi link erlangType           Type
hi link erlangBitSize        Number
hi link erlangException      Exception
" }}}

let b:current_syntax = "erlang"

" vim: set foldmethod=marker:
