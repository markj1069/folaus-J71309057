# Project Makefile

SHELL = /bin/sh                      # Use Bourne Shell for portability.
.SUFFIXES:                           # Forget all that C stuff
.SUFFIXES: .exe .f .f90 .o           # Fortran suffixes

VPATH = bin:lib:t:xt
FC    = gfortran

.PHONY: clean

clean:
	rm --force a.out *.exe *.html *.md *.mod *.o *.pdf *.txt

