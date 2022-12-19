exaKt.vim helps `K` to distinguish `substitute()` from `:substitute`,
or `<buffer=abuf>` from `:buffer`.  People hardly say `:substitute` and
`:buffer` when there are `:s` and `:b`, so it's disappointing to see
the help page jumps to `:s` when pressing `K` on `substitute()`.


## Installation

Use your preferred package manager to install this script.
Below is a sample using [vim-plug](https://github.com/junegunn/vim-plug):

    Plug 'arnie97/exakt.vim'


# Configuration

This plugin follows the option `&keywordprg`, but will not work if
`&keywordprg` does not start with `:` (for external programs, you may
explicitly `set keywordprg=:terminal\ foobar` as an alternative).

It also wraps the `&iskeyword` option somewhat (`\k`), although solely
`&iskeyword` is not enough to match `substitude(foo, bar)` exaKtly.


## License

This software is released into the public domain.
