# Project Makefile

SHELL = /bin/sh                      # Use Bourne Shell for portability.
.SUFFIXES:                           # Forget all that C stuff
.SUFFIXES: .exe .f .f90 .o           # Fortran suffixes

VPATH = bin:lib:t:xt
FC    = gfortran

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
.PHONY: echo

all: lib/olflib.f90 lib/olflib.o \
	 t/user-tst.exe

build-xt: xt/0101-olsdef.exe xt/0161-tst_plan.exe \
     xt/0121-setrc.exe xt/0141-errmsg.exe \
     xt/0181-is.exe xt/0201-isnt.exe xt/0241-ok.exe xt/0221-diag.exe \
	 xt/0261-pass.exe xt/0281-fail.exe \
	 xt/0301-bail_out.exe \
	 xt/0501-olsbegin.exe xt/0621-olsbldmsg.exe \
	 xt/0801-date_and_time.exe

.PHONY: clean
.PHONY: clean-bin
.PHONY: clean-doc
.PHONY: clean-lib
.PHONY: clean-t
.PHONY: clean-xt
.PHONY: clean-var
.PHONY: maintainer-clean
.PHONY: distclean
.PHONY: installcheck
.PHONY: check
.PHONY: installdirs
.PHONY: devtest
.PHONY: test
.PHONY: tst

echo:
	@echo "This is the default action."

clean:
	@        rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt
	@cd bin; rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt
	@cd doc; rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt
	@cd lib; rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt
	@cd t;   rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt
	@cd xt;  rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt
	@cd var; rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt

clean-bin:
	@cd bin; rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt

clean-doc:
	@cd doc; rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt

clean-lib:
	@cd lib; rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt

clean-t:
	@cd t;   rm --force a.out *.exe *.html *.mod *.o *.pdf *.txt

clean-xt:
	@cd xt;  $(MAKE) clean

clean-var:
	@cd xt;  rm --force a.out *.exe *.html *.mod *.o *.pdf user-tst.txt

install: lib/olflib.o
	echo lib/olflib.o $(libdir)/olaus/gfort

#        1         2         3         4         5         6         7         8
# 3456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789

lib/olflib.f90: olf_bail_out.f90 olf_begin.f90 olf_bld_msg.f90 \
    olf_date_stamp.f90 olf_debug.f90 olf_def.f90 olf_diag.f90 \
    olf_done_testing.f90 olf_end.f90 olf_err_msg.f90 olf_fail.f90 \
    olf_get_rc.f90 olf_get_sys.f90 olf_help.f90 olf_input.f90 \
    olf_is.f90 olf_isnt.f90 olf_log.f90 olf_man.f90 olf_note.f90 \
    olf_ok.f90 olf_pass.f90 olf_setrc.f90 olf_skip.f90 olf_skip_all.f90 \
    olf_time_stamp.f90 olf_todo.f90 olf_tst_plan.f90 olf_usage.f90 \
    olf_version.f90 olf_write.f90 build-olaus-module.sh
	bin/build-olaus-module.sh

lib/olflib.a: 

lib/olflib.o: olflib.f90
	bin/build-fo.sh lib/olflib.f90
	ar crv lib/olflib.a lib/olflib.o
	ranlib -D lib/olflib.a

t/user-tst.exe:  t/user-tst.f90 olflib.o
	bin/build-f.sh t/user-tst.f90

xt/0101-olsdef.exe:  xt/0101-olsdef.f90 olflib.o
	bin/build-f.sh xt/0101-olsdef.f90

xt/0100-olsdef.t:    xt/0101-olsdef.exe
	bin/build-f.sh xt/0100-olsdef.t

xt/0121-setrc.exe:  xt/0121-setrc.f90 olflib.o
	bin/build-f.sh xt/0121-setrc.f90

xt/0141-errmsg.exe:  0141-errmsg.f90 olflib.o
	bin/build-f.sh xt/0141-errmsg.f90

xt/0161-tst_plan.exe: 0161-tst_plan.f90 olflib.o
	bin/build-f.sh xt/0161-tst_plan.f90

xt/0181-is.exe: 0181-is.f90 olflib.o
	bin/build-f.sh xt/0181-is.f90

xt/0201-isnt.exe: 0201-isnt.f90 olflib.o
	bin/build-f.sh xt/0201-isnt.f90

xt/0221-diag.exe: 0221-diag.f90 olflib.o
	bin/build-f.sh xt/0221-diag.f90

xt/0241-ok.exe: 0241-ok.f90 olflib.o
	bin/build-f.sh xt/0241-ok.f90

xt/0261-pass.exe: 0261-pass.f90 olflib.o
	bin/build-f.sh xt/0261-pass.f90

xt/0281-fail.exe: 0281-fail.f90 olflib.o
	bin/build-f.sh xt/0281-fail.f90

xt/0301-bail_out.exe: 0301-bail_out.f90 olflib.o
	bin/build-f.sh xt/0301-bail_out.f90

xt/0501-olsbegin.exe: 0501-olsbegin.f90 olflib.o
	bin/build-f.sh xt/0501-olsbegin.f90

xt/0621-olsbldmsg.exe: 0621-olsbldmsg.f90 olflib.o
	bin/build-f.sh xt/0621-olsbldmsg.f90

xt/0801-date_and_time.exe: 0801-date_and_time.f90 olflib.o
	bin/build-f.sh xt/0801-date_and_time.f90

# Convert from Pandoc markdown to Github markdown.
test.md: xt/test.md
	pandoc --standalone --from=markdown --to=gfm xt/test.md >test.md

test.html: xt/test.md
	pandoc --standalone --from=markdown --to=html5 xt/test.md >test.html

test:
	prove t/*.exe
	echo "user-tst: pass" >var/user-tst.txt

devtest:
	prove xt

tst:
	echo "Top PWD:"; pwd
	cd xt; $(MAKE) tst