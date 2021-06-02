# folaus lib makefile

SHELL = /bin/sh                      # Use Bourne Shell for portability.
.SUFFIXES:                           # Forget all that C stuff
.SUFFIXES: .exe .f .f90 .o           # Fortran suffixes

VPATH = bin:lib:t:xt
FC    = gfortran

RANLIB = ranlib

# Installation Directories

prefix         = /usr/local
exec_prefix    = /usr/local/bin
bindir         = /usr/local/bin
sbindir        = $(exec_prefix)/sbin
libexecdir     = $(exec_prefix)/libexec
datarootdir    = $(prefix)/share
datadir        = $(datarootdir)
sysconfdir     = $(prefix)/etc
sharedstatedir = $(prefix)/com
localstatedir  = $(prefix)/var
runstateddir   = $(localstatedir)/run
includedir     = $(prefix)/include
oldincludedir  = /usr/include
docdir         = $(datarootdir)/doc/olaus
infodir        = $(datarootdir)/info
htmldir        = $(datarootdir)/html
dvidir         = $(datarootdir)/dvi
psdir          = $(datarootdir)/ps
libdir         = $(exec_prefix)/lib
listdir        = $(datarootdir)/emacs/site-lisp
localedir      = $(datarootdir)/locale
mandir         = $(datarootdir)/man
man1dir        = $(mandir)/man1
man3dir        = $(mandir)/man3
manext         = .1
man1ext        = .1
man3ext        = .3
scrdir         = lib
scrtdir        = t
scrxtdir       = xt





# Targets


default:
	@echo "This is the default action."

.PHONY: all
.PHONY: default

default: olflib.a

all: olflib.a

.PHONY: clean
.PHONY: maintainer-clean
.PHONY: distclean


echo:
	@echo "This is the default action."

clean maintainer-clean distclean:
	rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt olflib.a olflib.f90


install: lib/olflib.o
	echo lib/olflib.o $(libdir)/olaus/gfort

#        1         2         3         4         5         6         7         8
# 3456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789

OBJ =  olf_module.f90 olf_def.f90 olf_contains.f90 \
	olf_bail_out.f90 olf_begin.f90 olf_bld_msg.f90 \
    olf_date_stamp.f90 olf_debug.f90 olf_def.f90 olf_diag.f90 \
    olf_done_testing.f90 olf_end.f90 olf_err_msg.f90 olf_fail.f90 \
    olf_get_rc.f90 olf_get_sys.f90 olf_help.f90 olf_input.f90 \
    olf_is.f90 olf_isnt.f90 olf_log.f90 olf_man.f90 olf_note.f90 \
    olf_ok.f90 olf_pass.f90 olf_setrc.f90 olf_skip.f90 olf_skip_all.f90 \
    olf_time_stamp.f90 olf_todo.f90 olf_tst_plan.f90 olf_usage.f90 \
    olf_version.f90 olf_write.f90 olf_end_module.f90

olflib.f90: $(OBJ)
	rm --force olslib.f90
	../bin/add.sh olf_module.f90
	../bin/add.sh olf_def.f90
	../bin/add.sh olf_contains.f90
	../bin/add.sh olf_bail_out.f90
	../bin/add.sh olf_begin.f90
	../bin/add.sh olf_bld_msg.f90
	../bin/add.sh olf_date_stamp.f90
	../bin/add.sh olf_debug.f90
	../bin/add.sh olf_diag.f90
	../bin/add.sh olf_done_testing.f90
	../bin/add.sh olf_end.f90
	../bin/add.sh olf_err_msg.f90
	../bin/add.sh olf_fail.f90
	../bin/add.sh olf_get_rc.f90
	../bin/add.sh olf_get_sys.f90
	../bin/add.sh olf_help.f90
	../bin/add.sh olf_input.f90
	../bin/add.sh olf_is.f90
	../bin/add.sh olf_isnt.f90
	../bin/add.sh olf_log.f90
	../bin/add.sh olf_man.f90
	../bin/add.sh olf_note.f90
	../bin/add.sh olf_ok.f90
	../bin/add.sh olf_pass.f90
	../bin/add.sh olf_setrc.f90
	../bin/add.sh olf_skip.f90
	../bin/add.sh olf_skip_all.f90
	../bin/add.sh olf_time_stamp.f90
	../bin/add.sh olf_todo.f90
	../bin/add.sh olf_tst_plan.f90
	../bin/add.sh olf_usage.f90
	../bin/add.sh olf_version.f90
	../bin/add.sh olf_write.f90
	../bin/add.sh olf_end_module.f90

lib/olflib.o: olflib.f90
	$(FC) -c olflib.f90 -o "olflib.o" -J .

lib/olflib.a: olflib.o
	ar crv olflib.a olflib.o
	ranlib -D olflib.a
