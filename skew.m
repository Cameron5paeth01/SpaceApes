%% Development Information
% MAE 466 Spacecraft Dynamics 
% skew.m
% 
% input[a]: arbitrary vector a. size[3x1]
%
% output[ax]: skew symmetric matrix of a. size[3x3]
% 
% Assumptions:
% (1) None
% 
% 
% Primary Developer Contact Information:
% Andrew Rhodes, PhD
% Teaching Assistant Professor
% Undergraduate Program Coordinator
% Statler College of Engineering & Mineral Resources
% Dept. Mechanical and Aerospace Engineering
% West Virginia University (WVU)
% andrew.rhodes@mail.wvu.edu
%
%
%
% Development History
% Date              Developer        Comments
% ---------------   -------------    --------------------------------
% Sept. 20, 2021    A. Rhodes        Initial implemention
%
%%

function [ax] = skew(a)

ax = zeros(3,3);

% ax = [0, -v(3), v(2);
%       v(3), 0, -v(1);
%       -v(2), v(1), 0];


ax(3,2) =  a(1);
ax(2,3) = -a(1);

ax(1,3) =  a(2);
ax(3,1) = -a(2);

ax(2,1) =  a(3);
ax(1,2) = -a(3);


end





