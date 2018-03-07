function [l,d,u]= factorisation(a)
u = a;   %Initially making u equal to given matrix.
k = length(a);   %determing the dimension of matrix.
l = zeros(k,k);   %Initially defining l and d as zero matrices. 
d = zeros(k,k);
 for i= 1:k-1 
      if u(i,i)~=0  %condition to ckeck if pivot is not equal to zero.
          l(i:k,i)= u(i:k,i)./ u(i,i);  %dividing the pivot column by pivot value and equating it coloum of l matrix. 
      else
          l(i,i) = 1; %If pivot is equal to 0 then assigning to 1. 
      end    
      if u(i+1,i)~=0 % condition to check if the value below pivot is not equal to zero from before.
        for j= i+1:k
           u(j,:) = u(j,:) - ((u(j,i)./u(i,i)).*u(i,:)); % Making the value below pivot equal to zero by row operation. 
        end
      end
 end 
 l(k,k) = 1; %since the first loop runs only till k-1,the last value of l is assigned to one. 
 for i=1:k
     d(i,i)= u(i,i); %Assigning the diagnal value of u matrix to d matrix. 
     u(i,:)= u(i,:)./u(i,i);  %Dividing each row by its pivot value. 
 end
end