%% Development Information
% MAE 466 Spacecraft Dynamics 
% Radius313Euler_to_NPositionVelocity_SpaceApes
% finds rotation matrix and angular rates from position vector to N frame
%
% input: r_N size(3x1)
% input: r_dot_N size (3x1)
% input: thetadot size (3x1)
%
% output: R_N_to_H size(3x3)
% output: omega_H_rel_N_as_N size(3x1)
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
function [R_N_to_H, omega_H_rel_N_as_N] = DCM_N_to_H_SpaceApes(r_N, r_dot_N,thetadot)
% define hill frame components
h_r = r_N/norm(r_N);
h_h = (skew(r_N)*r_dot_N)/norm(skew(r_N)*r_dot_N);
h_theta = skew(h_h)*h_r;
% define N frame
N = eye(3);
H = [h_r';h_theta';h_h'];
% use frame blocks
R_N_to_H = H*N;
% find omega from mean motion
omega_H_rel_N_as_N = R_N_to_H'*thetadot*[0;0;1];
end
