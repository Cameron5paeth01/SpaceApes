%% Development Information
% MAE 466 Spacecraft Dynamics
% Space Apes Project Development
% DCM_N_to_Rs_SpaceApes
% finds roation matrix and angular rates from N frame to mars pointing frame
%
% inputs: r_N size(3x1)
% inputs: r_N_dot size(3x1)
% inputs: thetadot size(3x1)
%
% output: R_N_to_Rs size(3x3)
% output: omega_Rs_rel_N size(3x1)
% 
% requires skew function
%
% Primary Developer Contact Information:
% Cameron Spaeth
% Undergraduate Student
% Statler College of Engineering & Mineral Resources
% Dept. Mechanical and Aerospace Engineering
% West Virginia University (WVU)
% cds0060@mix.wvu.edu
%
% Noah Sampson
% Undergraduate Student
% Statler College of Engineering & Mineral Resources
% Dept. Mechanical and Aerospace Engineering
% West Virginia University (WVU)
% nrs0025@mix.wvu.edu
%
%
% Development History
% Date              Developer        Comments
% ---------------   -------------    --------------------------------
% Oct. 2022         Cameron S.       
% Oct. 2022         Noah    S.
function [R_N_to_Rn,omega_Rn_rel_N_as_N] = DCM_N_to_Rn_SpaceApes(r_N,r_dot_N,thetadot)
% set up frame blocks
h_r = r_N/norm(r_N);
h_h = (skew(r_N)*r_dot_N)/norm(skew(r_N)*r_dot_N);
r_n1 = -h_r;
r_n2 = skew(h_h)*h_r;
r_n3 = skew(r_n1)*r_n2;
N = eye(3);
% multiply frame blocks together
Rn = [r_n1';r_n2';r_n3'];
R_N_to_Rn = Rn*N;
omega_Rn_rel_N_as_N = R_N_to_Rn'*thetadot*[0;0;-1];
end
