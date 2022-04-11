function [y]= spmv_bccs(y, x, nb,val , brow_idx, bcol_ptr)
%Author: Πατήλας Παύλος, ΑΜ 1047085 , Ημ/νια : 31/12/2021 

% for ( i =0; i <N; i++)
%     for ( j=rowptr[i] ; j<rowpr[i + 1]; j++)
%         y[i] += val[j]*x[c o l i n d [j]];
%     end
% end
if length(x) ~= (length(bcol_ptr)-1)*nb
    msg="Τα μεγέθη των πινάκων δεν ταιριάζουν. Δοκιμάστε ξανά με άλλο μέγεθος x";
    error(msg);
else
    z=1;
    bcols =(length(bcol_ptr)-1)*nb/nb;
    for b = 1: bcols
        for k =bcol_ptr(b): (bcol_ptr(b+1)-1)
            for j = 1:nb
              for i = 1:nb  
                y(brow_idx(k)*nb-nb+i)= y(brow_idx(k)*nb-nb+i)+x(j+(b-1)*nb)*val(z);
                z = z + 1;
              end
            end
        end
   end
end