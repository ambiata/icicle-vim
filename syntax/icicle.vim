" Vim syntax file
" Language:   Icicle
" Maintainer: Jacob Stanley

if exists("b:current_syntax")
  finish
endif

"
" Keywords
"

" Syntax
syntax keyword icicleKeyword case
syntax keyword icicleKeyword distinct
syntax keyword icicleKeyword end
syntax keyword icicleKeyword feature
syntax keyword icicleKeyword filter
syntax keyword icicleKeyword fold
syntax keyword icicleKeyword fold1
syntax keyword icicleKeyword group
syntax keyword icicleKeyword latest
syntax keyword icicleKeyword let

" Date
syntax keyword icicleDate and
syntax keyword icicleDate after
syntax keyword icicleDate before
syntax keyword icicleDate between
syntax keyword icicleDate windowed
syntax keyword icicleDate days
syntax keyword icicleDate months
syntax keyword icicleDate weeks
syntax keyword icicleDate hours
syntax keyword icicleDate minutes
syntax keyword icicleDate seconds
syntax keyword icicleDate day_of
syntax keyword icicleDate month_of
syntax keyword icicleDate year_of

"
" Built-in Functions
"

" Math
syntax keyword iciclePrim log
syntax keyword iciclePrim exp
syntax keyword iciclePrim sqrt
syntax keyword iciclePrim abs
syntax keyword iciclePrim double
syntax keyword iciclePrim floor
syntax keyword iciclePrim ceil
syntax keyword iciclePrim round
syntax keyword iciclePrim trunc

" Data
syntax keyword iciclePrim seq
syntax keyword iciclePrim box

" Grouping
syntax keyword iciclePrim keys
syntax keyword iciclePrim vals

" Arrays
syntax keyword iciclePrim sort
syntax keyword iciclePrim length
syntax keyword iciclePrim index

" User Maps
syntax keyword iciclePrim map_create
syntax keyword iciclePrim map_insert
syntax keyword iciclePrim map_delete
syntax keyword iciclePrim map_lookup

"
" Symbols / Literals
"

syntax match   icicleOperator           "\v[/*+^\-<>=!&\|,]+"

syntax match   icicleRoundBra           "\v\("
syntax match   icicleRoundKet           "\v\)"
syntax match   icicleComma              "\v,"
syntax match   icicleEqual              "\v\="
syntax match   icicleFollowedBy         "\v:"
syntax match   icicleStatementEnd       "\v\."
syntax match   icicleAlternative        "\v\|"

syntax keyword icicleBoolean            False
syntax keyword icicleBoolean            True


syntax match   icicleInteger            "\v[0-9]+"
syntax match   icicleInteger            "\v0[xX][0-9a-fA-F]+"
syntax match   icicleInteger            "\v0[oO][0-7]+"
syntax match   icicleFloat              "\v[0-9]+.[0-9]+([eE][+-][0-9]+)"

syntax match   icicleDataFlow           "\v\~\>"
syntax match   icicleFunctionArrow      "\v-\>"

"
" Strings
"

syntax match   icicleSpecialChar        contained "\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)"
syntax match   icicleSpecialChar        contained "\\\(NUL\|SOH\|STX\|ETX\|EOT\|ENQ\|ACK\|BEL\|BS\|HT\|LF\|VT\|FF\|CR\|SO\|SI\|DLE\|DC1\|DC2\|DC3\|DC4\|NAK\|SYN\|ETB\|CAN\|EM\|SUB\|ESC\|FS\|GS\|RS\|US\|SP\|DEL\)"
syntax region  icicleString             start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=icicleSpecialChar,@Spell

"
" Identifiers
"

syntax match   icicleConstructor        "\v[A-Z][a-zA-Z0-9_']*"
syntax match   icicleVariable           "\v[a-z_][a-zA-Z0-9_'$]*"
syntax match   icicleDeclaration       "\v^[a-z_][a-zA-Z0-9_'$]*"

"
" Comments
"

syntax keyword icicleTodo               TODO FIXME XXX HACK     contained
syntax match   icicleCommentLine        "\v#.*$"                contains=icicleTodo,@Spell
syntax match   icicleCommentLine        "\v--.*$"               contains=icicleTodo,@Spell
syntax region  icicleCommentBlock       start="{-"  end="-}"    contains=icicleCommentBlock,icicleTodo,@Spell

"
" Highlighting
"

highlight def link icicleConstructor        Type
highlight def link icicleVariable           Normal
highlight def link icicleDeclaration        Identifier
highlight def link icicleOperator           Operator
highlight def link icicleKeyword            Keyword
highlight def link iciclePrim               Special
highlight def link icicleDate               Special

highlight def link icicleCommentLine        Comment
highlight def link icicleCommentBlock       Comment

highlight def link icicleBoolean            Boolean
highlight def link icicleInteger            Number
highlight def link icicleFloat              Number
highlight def link icicleString             String
highlight def link icicleSpecialChar        Identifier

highlight def link icicleRoundBra           Delimiter
highlight def link icicleRoundKet           Delimiter
highlight def link icicleComma              Delimiter

highlight def link icicleStatementEnd       Operator
highlight def link icicleSemiColon          Operator
highlight def link icicleFollowedBy         Operator
highlight def link icicleEqual              Operator
highlight def link icicleAlternative        Operator
highlight def link icicleDataFlow           Operator
highlight def link icicleFunctionArrow      Operator

highlight def link icicleTodo               Todo

let b:current_syntax = "icicle"
