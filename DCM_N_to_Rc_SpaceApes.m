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
% Oct. 2022         Noah S.       
%
function [R_N_to_Rc] = DCM_N_to_Rc_SpaceApes(r_lmo, r_gmo)
% define N
n1 = [1;0;0];
n2 = [0;1;0];
n3 = [0;0;1];
% define rc2
delta_r = r_gmo-r_lmo;
crosses = skew(delta_r)*n3;
rc2 = crosses/norm(crosses);
% find rc1
rc1 = -delta_r/norm(delta_r);
% find rc3
rc3 = skew(rc1)*rc2;
% dcm frame blocks
R_N_to_Rc = [rc1';rc2';rc3']*[n1,n2,n3];
end
