%% Development Information
% MAE 466 Spacecraft Dynamics
% Space Apes Project Development
% DCM_N_to_Rs_SpaceApes
% finds roation matrix and angular rates from N frame to sun pointing frame
%
% inputs: none
%
% output: R_N_to_Rs size(3x3)
% output: omega_Rs_rel_N size(3x1)
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
function [R_N_to_Rs, omega_Rs_rel_N] = DCM_N_to_Rs_SpaceApes
n_hat1 = [1;0;0];
n_hat2 = [0;1;0];
n_hat3 = [0;0;1];
% finds rotation matrix using frame blocks
R_N_to_Rs = [-n_hat1';n_hat3';n_hat2']*[n_hat1,n_hat2,n_hat3];
omega_Rs_rel_N = [0;0;0];
end
