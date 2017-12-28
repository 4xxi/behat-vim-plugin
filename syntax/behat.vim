if exists("b:current_syntax")
    finish
endif

syntax keyword behatKeyword When Given Then And
syntax match behatComment "\v#.*$"
syntax region behatString start=/\v"/ skip=/\v\\./ end=/\v"/

highlight link behatKeyword Keyword
highlight link behatComment Comment
highlight link behatString String

let b:current_syntax = "behat"
