%% Development Information
% MAE 466 Spacecraft Dynamics
% Space Apes Project Development
% 
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
% Nov. 2022         Noah S.       
%                         Cameron S.
function [q_R_to_B, omega_B_to_R] = AttitudeError_SpaceApes(q_N_to_B, omega_B_to_N, R_N_to_R, omega_R_to_N)
qtemp = DCM_to_q_Sampson(R_N_to_R);
q_N_to_R = [qtemp(1);-qtemp(2);-qtemp(3);-qtemp(4)];
q_R_to_B = q_mult_NH_Sampson(q_N_to_B, q_N_to_R);
omega_B_to_R = omega_B_to_N - omega_R_to_N;
end