program hello_world

    implicit none
 
    real :: x

    x = 13.

    if ( x .eq. 12. ) then
        write(*,*) x
    else 
        write(*,*) "not equal"
    
    end if
        


end program hello_world

