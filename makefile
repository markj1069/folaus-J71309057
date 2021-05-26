# Project Makefile

FORTRAN = gfortran

SHELL = /bin/sh                      # Use Bourne Shell for portability.
.SUFFIXES:                           # Forget all that C stuff
.SUFFIXES: .exe .f .f90 .o           # Fortran suffixes

VPATH = bin:lib:t:xt                 # Source files are in bin, lib, t, and xt directories.
FC = gfortran



# Targets


default:
	echo "This is the default action."

.PHONY: all
.PHONY: echo

all: lib/olaus.f90 lib/olaus.o xt/0101-olsdef.exe xt/0161-tst_plan.exe \
     xt/0121-setrc.exe xt/0141-errmsg.exe \
     xt/0181-is.exe xt/0201-isnot.exe xt/0241-ok.exe xt/0221-diag.exe \
	 xt/0261-pass.exe xt/0281-fail.exe \
	 xt/0301-bail_out.exe \
	 xt/0501-olsbegin.exe xt/0621-olsbldmsg.exe \
	 xt/0801-date_and_time.f90

.PHONY: clean
.PHONY: clean-bin
.PHONY: clean-doc
.PHONY: clean-lib
.PHONY: clean-t
.PHONY: devtest
.PHONY: test

echo:
	echo "This is the default action."

clean:
	bin/clean.sh

clean-bin:
	bin/clean-bin.sh

clean-doc:
	bin/clean-doc.sh

clean-lib:
	bin/clean-lib.sh

clean-t:
	bin/clean-t.sh

lib/olaus.f90 : bail_out.f90 diag.f90 errmsg.f90 fail.f90 \
                getrc.f90 olsgetsys.f90 is.f90 isnot.f90 ok.f90 \
				pass.f90 fail.f90 setrc.f90 tst_plan.f90 \
				build-olaus-module.sh \
				olsdef.f90 olsbegin.f90 olsend.f90 olsbldmsg.f90 \
				olswrite.f90 olsinput.f90 \
				date_stamp.f90 time_stamp.f90
	bin/build-olaus-module.sh

lib/olaus.o: lib/olaus.f90
	bin/build-fo.sh lib/olaus.f90

xt/0101-olsdef.exe:  xt/0101-olsdef.f90 lib/olaus.o
	bin/build-f.sh xt/0101-olsdef.f90

xt/0100-olsdef.t:    xt/0101-olsdef.exe
	touch xt/0100-olsdef.t

xt/0121-setrc.exe:  xt/0121-setrc.f90 lib/olaus.o
	bin/build-f.sh xt/0121-setrc.f90

xt/0141-errmsg.exe:  0141-errmsg.f90 olaus.o
	bin/build-f.sh xt/0141-errmsg.f90

xt/0161-tst_plan.exe: 0161-tst_plan.f90 olaus.o
	bin/build-f.sh xt/0161-tst_plan.f90

xt/0181-is.exe: 0181-is.f90 olaus.o
	bin/build-f.sh xt/0181-is.f90

xt/0201-isnot.exe: 0201-isnot.f90 olaus.o
	bin/build-f.sh xt/0201-isnot.f90

xt/0221-diag.exe: 0221-diag.f90 olaus.o
	bin/build-f.sh xt/0221-diag.f90

xt/0241-ok.exe: 0241-ok.f90 olaus.o
	bin/build-f.sh xt/0241-ok.f90

xt/0261-pass.exe: 0261-pass.f90 olaus.o
	bin/build-f.sh xt/0261-pass.f90

xt/0281-fail.exe: 0281-fail.f90 olaus.o
	bin/build-f.sh xt/0281-fail.f90

xt/0301-bail_out.exe: 0301-bail_out.f90 olaus.o
	bin/build-f.sh xt/0301-bail_out.f90

xt/0501-olsbegin.exe: 0501-olsbegin.f90 olaus.o
	bin/build-f.sh xt/0501-olsbegin.f90

xt/0621-olsbldmsg.exe: 0621-olsbldmsg.f90 olaus.o
	bin/build-f.sh xt/0621-olsbldmsg.f90

xt/0801-date_and_time.exe: 0801-date_and_time.f90 olaus.o
	bin/build-f.sh xt/0801-date_and_time.f90

# Convert from Pandoc markdown to Github markdown.
test.md: xt/test.md
	pandoc --standalone --from=markdown --to=gfm xt/test.md >test.md

test.html: xt/test.md
	pandoc --standalone --from=markdown --to=html5 xt/test.md >test.html

test:
	prove

devtest:
	prove xt
