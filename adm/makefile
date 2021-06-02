# Project Makefile

SHELL = /bin/sh                      # Use Bourne Shell for portability.

# Forget C suffixes. 
.SUFFIXES:                           # Forget all that C suffixes
.SUFFIXES: .mkd                      # Markdown

VPATH = .:..:../lib


.PHONY: default
.PHONY: all
.PHONY: clean
.PHONY: dist
.PHONY: test
.PHONY:


all:
	echo all

clean:
	rm --force a.out *.exe *.html *.md *.mod *.o *.pdf *.txt

default:
	echo default

README.md: README.mkd
	pandoc --standalone --from=markdown --to=gfm README.mkd >../README.md

dist: dist/README.md
	cp ../README.md ../dist/README.md

test:
	echo test
