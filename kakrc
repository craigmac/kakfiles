# Kakoune configuration (~/.config/kak/kakrc)

# Formatting
# space after ':' prevents adding to command history
map global user f ': format-buffer<ret>' -docstring 'Format the current buffer.'
map global user F ': format-selections<ret>' -docstring 'Format selection(s).'
# set-option window formatcmd 'prettier --parser=scss'

# Hooks and filetype specific settings
# Define a command to let us set these easier
# props to: cosine.blue/2019-09-06-kakoune.html
define-command filetype-hook -params 2 %{
    hook global WinSetOption 'filetype=(%arg{1})' %arg{2}
}

filetype-hook javascript|typescript %{
    set-option window formatcmd 'prettier'
    set-option window makecmd 'npm run'
}

filetype-hook python %{
    set-option window formatcmd 'black'
    set-option window makecmd 'python3'
}

filetype-hook css|scss %{
    set-option window indentwidth 2
    set-option window tabstop 2
    set-option window formatcmd 'prettier --parser=scss'
}

# Miscellaneous
map global user w ': write<ret>' -docstring 'Save buffer.'

# TODO: readline style bindings in insert-mode. Mostly aren't mapped already.

