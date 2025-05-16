if exists('g:colors_name')
    highlight clear
endif

let g:colors_name = 'miedziany'

if has('nvim')
    lua require "miedziany".setup()
    finish
endif
