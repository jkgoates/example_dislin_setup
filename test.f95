program array


    implicit none
 
    real,dimension(:,:),allocatable :: my_array
    integer :: M,N,i,j

    
    N = 4
    M = 100

    allocate(my_array(M,N))


    do i = 1, M 
        do j = 1, N
            my_array(i,j) = i*j
        end do
        
    end do
    
    write(unit,'(*())')

    write(*,*) my_array

 
end program array

