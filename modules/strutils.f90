module strutils

    implicit none

    contains
        function replace(string, substring, new)
            character(len=*) :: string, substring, new
            character(len=256) :: part_one
            character(len=256) :: replace

            replace = trim(string)

            do
                if (index(replace, substring) == 0) then
                    exit
                else
                    part_one = trim(replace(index(replace, substring)+len(substring):len(trim(replace))))
                    replace = trim(replace(1:index(replace, substring)-1)) // new // trim(part_one)
                end if
            end do
            
        end function replace

        function startswith(string, substring)
            character(len=*) :: string, substring
            integer :: startswith

            if (index(string, substring) == 1) then
                startswith = 1
            else
                startswith = 0
            end if
        end function startswith

        function endswith(string, substring)
            character(len=*) :: string, substring
            integer :: endswith

            if (index(string, substring) == len(string)-len(substring)+1) then
                endswith = 1
            else
                endswith = 0
            end if

        end function endswith

        function lower(string)
            character(len=*) :: string
            character(len=256) :: lower

            character, dimension(26) :: alphabet = & 
            ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
            character, dimension(26) :: alphabet_u = &
            ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']

            integer :: x

            lower = trim(string)

            do x = 1, size(alphabet)
                lower = replace(lower, alphabet_u(x), alphabet(x))
            end do

        end function lower

        function upper(string)
            character(len=*) :: string
            character(len=256) :: upper

            character, dimension(26) :: alphabet = & 
            ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
            character, dimension(26) :: alphabet_u = &
            ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']

            integer :: x

            upper = trim(string)

            do x = 1, size(alphabet)
                upper = replace(upper, alphabet(x), alphabet_u(x))
            end do

        end function upper

        function copy(string, times)
            character(len=*) :: string
            integer :: times, x

            character(len=560) :: copy

            copy = ""

            do x = 1, times
                copy = trim(string // copy)
            end do
        end function copy

end module strutils
