module math
    implicit none

    contains

    function pi()
        real(kind=8) :: pi
        pi = 3.141592653589793238462643383279
    end function pi

    function issquare(num)
        integer :: num
        integer :: issquare
        integer :: i

        do i = 1, 1000000
            if (num/i == i) then
                issquare = 1
                exit
            end if
        end do

        if (issquare == 1) then
            issquare = 1
        else
            issquare = 0
        end if
    end function issquare
end module math
