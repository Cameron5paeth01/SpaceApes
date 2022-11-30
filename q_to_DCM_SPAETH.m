%% Development Information
% MAE 466 Spacecraft Dynamics 
% q_to_DCM_SPAETH.m
% 
% input[q]: a quaternion tuple. size[4x1]
%
% output[R]: DCM rotation matrix. size[3x3]
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
function R = q_to_DCM_SPAETH(q)
qs = q(1);
qv = q(2:4);
R = (qs^2-(qv'*qv))*eye(3)-2*qs*skew(qv)+2*(qv*qv');
end