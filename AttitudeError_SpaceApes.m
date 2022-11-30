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
R_R_to_N = R_N_to_R';
q_R_to_N = DCM_to_q_SPAETH(R_R_to_N);
%q_N_to_R = [qtemp(1);-qtemp(2);-qtemp(3);-qtemp(4)];
q_R_to_B = q_mult_NH_SPAETH(q_R_to_N, q_N_to_B);
if q_R_to_B < 0
    q_R_to_B = q_R_to_B*-1;
end
[R_N_to_B] = q_to_DCM_SPAETH(q_N_to_B);
omega_R_to_N = R_N_to_B*omega_R_to_N;
omega_B_to_R = omega_B_to_N - omega_R_to_N;
end