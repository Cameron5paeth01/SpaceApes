%
function [R_N_to_H, omega_H_rel_N_as_H] = DCM_N_to_H_SpaceApes(r_N, r_dot_N,n)
omega_H_rel_N_as_H = n*[0;0;1];
h_r = r_N/norm(r_N);
h_h = (skew(r_N)*r_dot_N)/norm(skew(r_N)*r_dot_N);
h_theta = skew(h_h)*h_r;
N = eye(3);
H = [h_r';h_h';h_theta'];
R_N_to_H = H*N;
end