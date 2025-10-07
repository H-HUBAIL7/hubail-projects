program dla
implicit none
integer, allocatable::s(:,:)
double precision::pi,rmax,r,rtemp,theta,dx,dy,a,rnd,l,rd
integer:: n,i,j,np,xwalk,ywalk,d,b,detector
!dimension of the grid
n=1000
allocate(s(-n:n,-n:n))

!parameters
r=0.0d0 !updated radius of the intial position
rmax=10.0d0
s(:,:)=0 !status of the point if 0 is not occupied and if it is 1 the one of the nearest neighbour is occupied
!set the origin is oocpied and the nearest neighbour allowed to occupy 
s(0,0)=2
s(1,0)=1
s(0,1)=1
s(-1,0)=1
s(0,-1)=1
pi=4.0d0*atan(1.0d0)

open (unit=77,file="DLA.txt")


do np=1,1000

44 theta=2.0d0*pi*rand() !take random angle

!take the initial position
xwalk=nint(rmax*cos(theta))
ywalk=nint(rmax*sin(theta))
 !random walker 

do while(s(xwalk,ywalk).ne.2)
 	
				    a=2.0d0*rand()-1
			
					dx=sign(1.0d0,2.0d0*rand()-1.0d0) 
					dy=sign(1.0d0,2.0d0*rand()-1.0d0)
					
					! if a postive the step in y axis and if it is negative the step in x axis					
					if(a>=0.0d0) then
					ywalk=ywalk+dy
					else if (a<0.0d0)then 
					xwalk=xwalk+dx
					end if
					
		if (xwalk==n) then
		go to 44
		else if (ywalk==n) then
		go to 44
		else if (xwalk==-n) then
		go to 44
		else if (ywalk==-n) then
		go to 44
		end if

		! if random walker visit the point it can be a occupy point make it occupy
		
		if (s(xwalk,ywalk)==1) then
 	
		s(xwalk,ywalk)=2
		write(77,*)xwalk,ywalk,np
		!make the nearest neighbour is allow to occupy
		if(s(xwalk+1,ywalk).ne.2)then 
		s(xwalk+1,ywalk)=1
		end if
		if(s(xwalk,ywalk+1).ne.2)then
		s(xwalk,ywalk+1)=1
		end if
		if(s(xwalk-1,ywalk).ne.2)then 
		s(xwalk-1,ywalk)=1
		end if
		if(s(xwalk,ywalk-1).ne.2)then
		s(xwalk,ywalk-1)=1
		end if
		!check the radius from the point and update the radius
		rtemp=sqrt(dble(xwalk)**2+dble(ywalk)**2)
		if (rtemp>r) then 
		r=rtemp
		rmax=r+5.0d0
		end if
		
		
		end if
end do
	

end do

end program dla