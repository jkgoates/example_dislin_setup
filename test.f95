program array


    implicit none
 
    real,dimension(:),allocatable :: my_array
    integer :: M,N,i

    M = 100
    allocate(my_array(M))


    do i = 1, M 

        my_array(i) = i
        
    end do


    write(*,*) my_array

 
end program array

