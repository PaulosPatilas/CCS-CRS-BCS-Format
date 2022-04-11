function [val, brow_idx, bcol_ptr]= sp_mx2bccs(A,nb)
%Author: Πατήλας Παύλος, ΑΜ 1047085 , Ημ/νια : 27/12/2021 
%Το μπλοκ αποθηκεύεται στο val κατα στήλη επίσης.
n = length(A);
bcol_ptr = (1);
bcol_ptr(1) = 1;
brow_idx = [];
nnz = 0;
val = [];
z = 1;
b = mod (n,nb);
count=0; %μετρητης μπλοκ
if b ~= 0
   msg = 'Τα μεγέθη των πινάκων δεν ταιριάζουν. Δοκιμάστε ξανά με άλλο μέγεθος n';
   error(msg);
else
    for j = 1:nb:n
        for i = 1:nb:n    
            count = count + 1 ;
            %disp(A(i:i+nb-1,j:j+nb-1));
            if sum(A(i:i+nb-1,j:j+nb-1),'all') ~= 0 %αν είναι μηδεν το μπλοκ είναι γεμάτο 0.
                nnz = nnz + 1;            
                brow_idx(end + 1) = count;

                for l =j:j+nb-1
                    for k = i:i+nb-1
                        val(z) = A(k,l);
                        z = z + 1;
                    end
                end
            end
        end 
        bcol_ptr(end + 1) = bcol_ptr(end) + nnz;
        nnz = 0 ;
        count = 0 ;
    end
end
