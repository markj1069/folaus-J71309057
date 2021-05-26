! tst

program tst

    use ISO_VARYING_STRING

character(256) :: input(257)
character(10)  :: one = "1"
character(10)  :: two = "22"
character(10)  :: three

print *, "len(one): ", len(one), " '", one, "'"
two = trim(two)
print *, "len(two): ", len(two), " '", trim(two), "'"
three = one
print *, "len(three): ", len(three), " '", three, "'"

call exit
do i = 1, 3

print *, input(i)

end do

end program tst