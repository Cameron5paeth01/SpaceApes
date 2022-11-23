%% Development Information
% MAE 466 Spacecraft Dynamics
% Space Apes Project Development
% DCM_N_to_Rs_SpaceApes
% finds error from rotation matricies
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
% nov. 2022         Cameron S.       
% nov. 2022         Noah    S.
function [q_R_to_B, omega_B_to_R] = AttitudeError_SpaceApes(q_N_to_B, omega_B_to_N, R_N_to_R, omega_R_to_N)
qtemp = DCM_to_q_Sampson(R_N_to_R);
q_N_to_R = [qtemp(1);-qtemp(2);-qtemp(3);-qtemp(4)];
q_R_to_B = q_mult_NH_Sampson(q_N_to_B, q_N_to_R);
omega_B_to_R = omega_B_to_N - omega_R_to_N;
end
