#! /usr/bin/env bash

./bin/clean-bin.sh
./bin/clean-doc.sh
./bin/clean-lib.sh
./bin/clean-t.sh
rm --force a.out                     # Delete odd or leftover program
rm --force *.exe                     # Delete compiled programs
rm --force *.html                    # Delete
rm --force *.mod                     # Delete Fortran compiled module files
rm --force *.o                       # Delete compiled object files
rm --force *.pdf                     # Delete
rm --force *.txt                     # Delete
rm --force *.tmp                     # Delete
rm --force *.hold                    # Delete

