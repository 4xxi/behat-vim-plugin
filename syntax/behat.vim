if exists("b:current_syntax")
    finish
endif

syntax keyword behatKeyword When Given Then And
syntax match behatComment "\v#.*$"

highlight link behatKeyword Keyword
highlight link behatComment Comment

let b:current_syntax = "behat"
