module os
    implicit none

    contains

    subroutine writefile(filename, contents)
        character(len=*) :: filename, contents

        open(unit=1, file=filename)

            write(1, *) contents 

        close(1)

     end subroutine writefile

end module os
