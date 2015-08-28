" Vim syntax file
" Language:   Icicle Avalanche
" Maintainer: Jacob Stanley

if exists("b:current_syntax")
  finish
endif

"
" Keywords
"

syntax keyword avalancheKeyword     for_ints
syntax keyword avalancheKeyword     for_facts
syntax keyword avalancheKeyword     in
syntax keyword avalancheKeyword     if
syntax keyword avalancheKeyword     let

syntax keyword avalancheKeywordPrim init
syntax keyword avalancheKeywordPrim read
syntax keyword avalancheKeywordPrim write
syntax keyword avalancheKeywordPrim push
syntax keyword avalancheKeywordPrim output
syntax keyword avalancheKeywordPrim load_resumable
syntax keyword avalancheKeywordPrim save_resumable

syntax keyword avalancheLoopType    history
syntax keyword avalancheLoopType    new

"
" Symbols / Literals
"

syntax match   avalancheLiteral     "\v-?[0-9][0-9f.]*"

syntax match   avalancheEquals      "\v\="
syntax match   avalancheColon       "\v\:"
syntax match   avalancheSemi        "\v\;"
syntax match   avalancheRoundBra    "\v\("
syntax match   avalancheRoundKet    "\v\)"
syntax match   avalancheSquareBra   "\v\["
syntax match   avalancheSquareKet   "\v\]"
syntax match   avalancheBraceBra    "\v\{"
syntax match   avalancheBraceKet    "\v\}"

syntax match   avalancheOperator    "\v[-~!@#$%&*+/<>^]"
syntax match   avalancheOperator    "\v[-~!@#$%&*+/<>=:\|][-~!@#$%^&*+/<>=:\|?]+"

"
" Identifiers
"

syntax match   avalancheConstructor "\v[A-Z][a-zA-Z0-9_$]+"
syntax match   avalancheVariable    "\v[a-z][a-zA-Z0-9_$]+"
syntax match   avalanchePrim        "\v[a-z][a-zA-Z0-9_$]+#"

"
" Highlighting
"

highlight def link avalancheKeyword     Keyword
highlight def link avalancheLoopType    Keyword
highlight def link avalanchePrim        Identifier
highlight def link avalancheKeywordPrim SpecialComment
highlight def link avalancheVariable    Normal
highlight def link avalancheConstructor Type
highlight def link avalancheConstructor Type
highlight def link avalancheLiteral     Constant
highlight def link avalancheEquals      Operator
highlight def link avalancheOperator    Operator
highlight def link avalancheColon       Delimiter
highlight def link avalancheSemi        Delimiter
highlight def link avalancheRoundBra    Delimiter
highlight def link avalancheRoundKet    Delimiter
highlight def link avalancheSquareBra   Delimiter
highlight def link avalancheSquareKet   Delimiter
highlight def link avalancheBraceBra    Delimiter
highlight def link avalancheBraceKet    Delimiter

let b:current_syntax = "avalanche"

" vim: set sts=2 sw=2:
