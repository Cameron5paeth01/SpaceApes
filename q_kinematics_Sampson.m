% Development Information
% MAE 466 Spacecraft Dynamics 
% q_kinematics_Sampson
% kinematic equation for quaternion
% 
% input: t (sec)
% input: q size(4x1)
% input: omega size(3x1) (rad/s)
%
% output: qdot size(4x1)
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
% Oct 26, 2022    N.Sampson        Initial implemention
%
function [qdot] = q_kinematics_Sampson(t,q,omega)
qs = q(1);
qv = [q(2);q(3);q(4)];
qvskew = skew(qv);
B = [qs -qv'; qv qs*eye(3)+qvskew];
oddomega = [0;omega(1);omega(2);omega(3)];
qdot = 0.5*B*oddomega;
end
