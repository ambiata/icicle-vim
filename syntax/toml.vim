" Vim syntax file
" Language:   Icicle TOML
" Maintainer: Jacob Stanley

if exists("b:current_syntax")
  finish
endif

syntax sync fromstart

"
" Icicle
"

syntax include @icicle syntax/icicle.vim

syntax region tomlIcicle matchgroup=tomlIcicleStart start=+"+rs=e   keepend matchgroup=tomlIcicleEnd end=+"+re=s   contained contains=@icicle
syntax region tomlIcicle matchgroup=tomlIcicleStart start=+"""+rs=e keepend matchgroup=tomlIcicleEnd end=+"""+re=s contained contains=@icicle

syntax region tomlIcicleExpr start=/expression\s*=\s*"/rs=s   keepend end=+"+re=e   contains=tomlIcicle,tomlEq
syntax region tomlIcicleExpr start=+expression\s*=\s*"""+rs=s keepend end=+"""+re=e contains=tomlIcicle,tomlEq

"
" Encoding
"

syntax match tomlRoundBra "\v\("  contained
syntax match tomlRoundKet "\v\)"  contained
syntax match tomlColon    "\v:"   contained
syntax match tomlComma    "\v,"   contained
syntax match tomlStar     "\v*"   contained
syntax match tomlIdent    "\v\w+" contained

syntax keyword tomlType string  contained
syntax keyword tomlType int     contained
syntax keyword tomlType long    contained
syntax keyword tomlType double  contained
syntax keyword tomlType time    contained
syntax keyword tomlType date    contained
syntax keyword tomlType boolean contained

syntax region tomlEncoding matchgroup=tomlEncodingStart start=+"+rs=e   keepend matchgroup=tomlEncodingEnd end=+"+re=s   contained contains=tomlRoundBra,tomlRoundKet,tomlSquareBra,tomlSquareKet,tomlColon,tomlComma,tomlStar,tomlType,tomlIdent
syntax region tomlEncoding matchgroup=tomlEncodingStart start=+"""+rs=e keepend matchgroup=tomlEncodingEnd end=+"""+re=s contained contains=tomlRoundBra,tomlRoundKet,tomlSquareBra,tomlSquareKet,tomlColon,tomlComma,tomlStar,tomlType,tomlIdent

syntax region tomlEncodingExpr start=/encoding\s*=\s*"/rs=s   keepend end=+"+re=e   contains=tomlEncoding,tomlEq
syntax region tomlEncodingExpr start=+encoding\s*=\s*"""+rs=s keepend end=+"""+re=e contains=tomlEncoding,tomlEq

"
" TOML
"

syntax match tomlEq        "\v\="
syntax match tomlDot       "\v\."
syntax match tomlSquareBra "\v\["
syntax match tomlSquareKet "\v\]"

syntax match tomlEscape /\\[btnfr"/\\]/ display contained
syntax match tomlEscape /\\u\x\{4}/ contained
syntax match tomlEscape /\\U\x\{8}/ contained

syntax match tomlLineEscape /\\$/ contained

" Basic strings
syntax region tomlString oneline start=/"/ skip=/\\\\\|\\"/ keepend end=/"/ contains=tomlEscape

" Literal strings
syntax region tomlString oneline start=/'/ end=/'/

" Multi-line literal strings
syntax region tomlString start=/'''/ end=/'''/

syntax match tomlInteger /\<[+-]\=[0-9]\(_\=\d\)*\>/ display

syntax match tomlFloat /\<[+-]\=[0-9]\(_\=\d\)*\.\d\+\>/ display
syntax match tomlFloat /\<[+-]\=[0-9]\(_\=\d\)*\(\.[0-9]\(_\=\d\)*\)\=[eE][+-]\=[0-9]\(_\=\d\)*\>/ display

syntax match tomlBoolean /\<\%(true\|false\)\>/ display

" https://tools.ietf.org/html/rfc3339
syntax match tomlDate /\d\{4\}-\d\{2\}-\d\{2\}T\d\{2\}:\d\{2\}:\d\{2\}\%(\.\d\+\)\?\%(Z\|[+-]\d\{2\}:\d\{2\}\)/ display

syntax match tomlTable /^\s*\[[^#\[\]]\+\]\s*\(#.*\)\?$/ contains=tomlComment,tomlDot,tomlSquareBra,tomlSquareKet

syntax match tomlTableArray /^\s*\[\[[^#\[\]]\+\]\]\s*\(#.*\)\?$/ contains=tomlComment,tomlDot,tomlSquareBra,tomlSquareKet

syntax keyword tomlTodo TODO FIXME XXX BUG contained

syntax match tomlComment /#.*/ contains=@Spell,tomlTodo


highlight def link tomlString        String
highlight def link tomlInteger       Number
highlight def link tomlFloat         Float
highlight def link tomlBoolean       Boolean
highlight def link tomlDate          Constant

highlight def link tomlEq            Operator
highlight def link tomlSquareBra     Delimiter
highlight def link tomlSquareKet     Delimiter
highlight def link tomlDot           Type
highlight def link tomlTable         Type
highlight def link tomlTableArray    Type

highlight def link tomlRoundBra      Delimiter
highlight def link tomlRoundKet      Delimiter
highlight def link tomlComma         Delimiter
highlight def link tomlColon         Operator
highlight def link tomlStar          Operator
highlight def link tomlType          Type
highlight def link tomlIdent         Identifier

highlight def link tomlIcicleStart   Comment
highlight def link tomlIcicleEnd     Comment

highlight def link tomlEncodingStart Comment
highlight def link tomlEncodingEnd   Comment

highlight def link tomlEscape        SpecialChar
highlight def link tomlLineEscape    SpecialChar

highlight def link tomlTodo          Todo
highlight def link tomlComment       Comment

let b:current_syntax = "toml"
