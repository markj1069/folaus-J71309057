# olflib xt makefile

SHELL = /bin/sh
VPATH = bin:lib:t:xt
FC    = gfortran

.PHONEY: tst
.PHONEY: clean
.PHONEY: default

clean:
	@rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt

%.exe : %.f90
	$(FC) -J ../lib -o $@ $< ../lib/olflib.a 

tst:
	prove *.t

