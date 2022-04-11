function [val, row_ip,col_ip]=sp_mat2latex(A,sp_type)
%Author: Πατήλας Παύλος, ΑΜ 1047085 , Ημ/νια : 7/12/2021 
%The IA vector is of size m+1 stores the cumulative number of non-zero elements upto ( not including) the i-th row. It is defined by the recursive relation : 
    %IA[0] = 0
    %IA[i] = IA[i-1] + no of non-zero elements in the (i-1) th row of the Matrix
%The A vector is of size NNZ and it stores the values of the non-zero elements of the matrix.
%The JA vector stores the column index of each element in the A vector. Thus it is of size NNZ as well.
n = size(A,1);
nz=0;
k=1;
val = [];
if (sp_type =="csr") 
    row_ip = zeros(n+1,1);
    row_ip(1) = 1; 
    col_ip = [];
    for i=1:n
        for j=1:n
            if A(i,j) ~= 0 
                nz=nz+1 ;
                val(k) = A(i,j);
                col_ip(k) = j;
                k = k+1;
            end
        end
        row_ip(i + 1) = row_ip(i)+ nz ; 
        nz=0;
    end
elseif (sp_type=="csc")
        col_ip = zeros(n+1,1);
        col_ip(1) = 1; 
        row_ip = [];
        for j=1:n
            for i=1:n
                if A(i,j) ~= 0 
                 nz=nz+1 ;
                 val(k) = A(i,j);
                 row_ip(k) = i;
                 k = k+1;
                end
            end
            col_ip(j + 1) = col_ip(j)+ nz ; 
            nz=0;
        end
end  
latex(sym(col_ip));
matrix2latex2(col_ip,test);