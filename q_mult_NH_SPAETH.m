%% Development Information
% MAE 466 Spacecraft Dynamics 
% q_mult_NH_SPAETH.m
% 
% input[q]: quaternion tuple. size[4x1]
% input[p]: quaternion tuple. size[4x1]
%
% output[q3]: quaternion tuple. size[4x1] 
%
% Description:
% This function uses the non-Hamiltonian convention to multiply two
% quaternion tuples together.
% 
% Assumptions:
% (1) None
% 
% 
% Primary Developer Contact Information:
% Cameron Spaeth
% Undergraduate Student
% Statler College of Engineering & Mineral Resources
% Dept. Mechanical and Aerospace Engineering
% West Virginia University (WVU)
% cds0060@mix.wvu.edu
%
function q3 = q_mult_NH_SPAETH(q,p)
qs = q(1);
qv = [q(2);q(3);q(4)];
ps = p(1);
pv = [p(2);p(3);p(4)];
qv_skew = skew(qv);
% q3 = [qs*ps-qv'*pv;...
%     qs*p+ps*q-qv_skew*pv];
Q = [ps -1*pv';pv (ps*eye(3))-skew(pv)];
q3 = Q*[qs;qv];
end