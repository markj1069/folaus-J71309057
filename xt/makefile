# olflib xt makefile

SHELL = /bin/sh
VPATH = bin:lib:t:xt
FC    = gfortran
src   = $(wildcard *.f90)
PGMS   = $(patsubst %.f90,%.exe,$(src))

.PHONEY: all
.PHONEY: tst
.PHONEY: clean
.PHONEY: default

all: $(PGMS)

%.exe: %.f90
	$(FC) -J ../lib -o $@ $< ../lib/olflib.a

clean:
	@rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt

#%.exe : %.f90
#	$(FC) -J ../lib -o $@ $< ../lib/olflib.a 

tst:
	echo $(OBJ)

