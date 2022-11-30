%% Development Information
% MAE 466 Spacecraft Dynamics 
% DCM_to_q_SPAETH.m
% 
% input[R]: DCM rotation matrix. size[3x3]
%
% output[q]: Quaternion Tuple. size[4x1]
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
function q = DCM_to_q_SPAETH(R)
qs = sqrt(.25*(1+trace(R)));
q1 = sqrt(.25*(1+2*R(1,1)-trace(R)));
q2 = sqrt(.25*(1+2*R(2,2)-trace(R)));
q3 = sqrt(.25*(1+2*R(3,3)-trace(R)));
if qs > q1 && q2 && q3
    q1 = .25*(R(2,3)-R(3,2))/qs;
    q2 = .25*(R(3,1)-R(1,3))/qs;
    q3 = .25*(R(1,2)-R(2,1))/qs;
elseif q1 > qs && q2 && q3
    qs = .25*(R(2,3)-R(3,2))/q1;
    q2 = .25*(R(1,2)+R(2,1))/q1;
    q3 = .25*(R(3,1)+R(1,3))/q1;
elseif q2 > qs && q1 && q3
    qs = .25*(R(3,1)-R(1,3))/q2;
    q1 = .25*(R(1,2)+R(2,1))/q2;
    q3 = .25*(R(2,3)+R(3,2))/q2;
elseif q3 > qs && q1 && q2
    qs = .25*(R(1,2)-R(2,1))/q3;
    q1 = .25*(R(3,1)+R(1,3))/q3; 
    q2 = .25*(R(2,3)+R(3,2))/q3;
end
q = [qs;q1;q2;q3];
if qs < 0
    q = -q;
end
end