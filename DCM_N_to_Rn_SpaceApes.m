function [R_N_to_Rn,omega_Rn_rel_N_as_N] = DCM_N_to_Rn_SpaceApes(r_N,r_dot_N,n)
h_r = r_N/norm(r_N);
h_h = (skew(r_N)*r_dot_N)/norm(skew(r_N)*r_dot_N);
r_n1 = -h_r;
r_n2 = skew(h_h)*h_r;
r_n3 = skew(r_n1)*r_n2;
N = eye(3);
Rn = [r_n1';r_n2';r_n3'];
R_N_to_Rn = Rn*N;
omega_Rn_rel_N_as_N = R_N_to_Rn'*n*[0;0;-1];
end