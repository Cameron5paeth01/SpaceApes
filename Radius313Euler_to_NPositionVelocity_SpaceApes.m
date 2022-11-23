%% Development Information
% MAE 466 Spacecraft Dynamics 
% Radius313Euler_to_NPositionVelocity_SpaceApes
% finds position vector in N frame from orbital elements
% 
% input: r (km)
% input: RAAN (rad)
% input: i (rad)
% input: nu (rad)
% input: mu_mars (km^3/s^2)
%
% output: r_N size(3x1)
% output: r_dot_N size (3x1)
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
function [r_N, r_dot_N] = Radius313Euler_to_NPositionVelocity_SpaceApes(r,RAAN,i,nu,mu_mars)
% find angular velocity
ThetaDot =sqrt(mu_mars/r^3);
% find individual rotation matricies
R_RAAN = [cos(RAAN) sin(RAAN) 0; -sin(RAAN) cos(RAAN) 0; 0 0 1];
R_i = [1 0 0; 0 cos(i) sin(i); 0 -sin(i) cos(i)];
R_nu = [cos(nu) sin(nu) 0; -sin(nu) cos(nu) 0; 0 0 1];
% combine into one rotation matrix
R = R_nu*R_i*R_RAAN;
% set position vector in H frame
r_H = r*[1;0;0];
%set velocity vector in H frame
r_dot_H=r*ThetaDot*[0;1;0];
% convert to N frame
r_N = R'*r_H;
r_dot_N = R'*r_dot_H;
end
