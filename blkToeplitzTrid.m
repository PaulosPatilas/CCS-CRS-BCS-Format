function T = blkToeplitzTrid(n,A,B,C)

%Author: Πατήλας Παύλος, ΑΜ 1047085 , Ημ/νια : 27/12/2021 

m = size(A,1);
T = zeros(n*m,n*m);
b = mod (n,m);
%if b ~= 0
   %msg = 'Τα μεγέθη των πινάκων δεν ταιριάζουν. Δοκιμάστε ξανά με άλλο μέγεθος n';
  % error(msg);
%else
    
    %ΤΑ ΜΗΤΡΩΑ Α B C ΕΙΝΑΙ ΤΕΤΡΑΓΩΝΙΚΑ ΙΔΙΩΝ ΔΙΑΣΤΑΣΕΩΝ ΜΕΤΑΞΥ ΤΟΥΣ
    for i = 1:m:n*m 
        T(i:i+m-1,i:i+m-1) = A;
    end
    
    for i = 1+m:m:n*m 
        for j = 1:m:n*m
            if i-j == m 
            T(i:i+m-1,j:j+m-1) = B;
            end
        end
    end
    for i = 1:m:n*m 
        for j = 1+m:m:n*m
            if j-i == m 
            T(i:i+m-1,j:j+m-1) = C;
            end
        end
    end
%end