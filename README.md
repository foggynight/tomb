# tomb

## Description

An ASCII rogue-like at the terminal, written in Common Lisp using the croatoan
library (an ncurses wrapper), inspired by the classics: Rogue and Nethack.


## Installation

Using SBCL and ASDF:
```bash
sbcl --eval '(asdf:make :tomb)'
```


## Dependencies

- SBCL
- ncurses
- croatoan

**Note:** croatoan can be installed using Quicklisp: `(ql:quickload :croatoan)`


## License

Copyright (C) 2021 Robert Coffey

This is free software: you can redistribute it and/or modify it under the terms
of the GNU General Public License version 2 as published by the Free Software
Foundation.

You should have received a copy of the GNU General Public License version 2
along with this software. If not, see
[GPLv2 license](https://www.gnu.org/licenses/gpl-2.0).
