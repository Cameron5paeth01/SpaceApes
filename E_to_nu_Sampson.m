%% Development Information
% MAE 766 Spaceflight and Systems
% E_to_nu_Sampson
% 
% Description: Converts eccentric anomaly to true anomaly
% 
% input[E,e] eccentric anomaly and eccentricity
% 
% output[nu] true anomaly
% 
% Units
% Eccentric anomaly must be in degrees
% True anomaly will return in radians
%
% Primary Developer Contact Information:
% Noah Sampson
% Undergraduate
% Statler College of Engineering & Mineral Resources
% Dept. Mechanical and Aerospace Engineering
% West Virginia University (WVU)
% nrs0025@mix.wvu.edu
%
%
%
% Development History
% Date            Developer        Comments
% -------------   -------------    --------------------------------
% Feb 2, 2022    Noah Sampson      Developed
%
function [nu] = E_to_nu_Sampson(E,e)
E_rad = deg2rad(E); %converts E to radians
nu = acos((cos(E_rad)-e)/(1-e*cos(E_rad))); %solves for nu
if E_rad >= pi() %checks E since arccos will not return correctly if E > pi
    nu = 2*pi() - nu; %makes nu correct angle
end
end