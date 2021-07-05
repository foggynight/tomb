#!/bin/bash

shopt -s extglob
sbcl --load src/package.lisp --load src/!(package).lisp --eval '(tomb:main)'
shopt -u extglob
