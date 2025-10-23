module os
    implicit none

    contains

    function argv(num)
        integer :: num
        character(len=232) :: argv

        call get_command_argument(num, argv)
    
    end function argv

    subroutine writefile(filename, contents)
        character(len=*) :: filename, contents

        open(unit=1, file=filename)

            write(1, *) contents 

        close(1)

     end subroutine writefile

end module os
