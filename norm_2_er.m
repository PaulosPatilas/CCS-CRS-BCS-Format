%Author: Πατήλας Παύλος, ΑΜ 1047085 , Ημ/νια : 6/1/2022 

m = 32; 
T=toeplitz([4,-1,zeros(1,m-2)]);
n=64;
S = blkToeplitzTrid(n,inv(T),T^2,T);
y=eye(n*m,1);
x=ones(n*m,1);
A = sprand(n*m,n*m,0.001);
y1 = y + A*x;
nb = 32;
[val,brow_idx,bcol_ptr] = sp_mx2bccs(A,nb);
y2 = spmv_bccs(y,x,nb,val,brow_idx,bcol_ptr);
n= norm(y1-y2)/norm(y2);