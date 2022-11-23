%% Development Information
% MAE 466 Spacecraft Dynamics
% Space Apes Project Development
% DCM_N_to_Rs_SpaceApes
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
R_N_to_Rs = [-n_hat1';n_hat3';n_hat2']*[n_hat1,n_hat2,n_hat3];
omega_Rs_rel_N = [0;0;0];
end