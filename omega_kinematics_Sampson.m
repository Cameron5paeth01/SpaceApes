% Development Information
% MAE 466 Spacecraft Dynamics 
% omega_kinematics_Sampson
% 
% input: t (sec)
% input: omega size(3x1) (rad)
% input: I size(3x3) (kg*m^2)
% input: u size(3x1) (kg*m^2/s^2)
%
% output: omegadot size(3x1)
% 
% Assumptions:
% needs skew
% 
% Primary Developer Contact Information:
% Noah Sampson
% Student
% Statler College of Engineering & Mineral Resources
% Dept. Mechanical and Aerospace Engineering
% West Virginia University (WVU)
% nrs0025@mix.wvu.edu
%
% Development History
% Date              Developer        Comments
% ---------------   -------------    --------------------------------
% nov 6, 2022    N.Sampson        Initial implemention
%
function [omegadot] = omega_kinematics_Sampson(t,omega,I,u)
Iomega = (-skew(omega)*I*omega)+u;
omegadot = I\Iomega;
end