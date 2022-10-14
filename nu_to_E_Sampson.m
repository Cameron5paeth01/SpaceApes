%% Development Information
% MAE 766 Spaceflight and Systems
% nu_to_E_Sampson
% 
% Description: Converts true anomaly to eccentric anomaly
% 
% input[nu,e] true anomaly and eccentricity
% 
% output[E] eccentric anomaly
% 
% Units
% True anomaly must be in degrees
% Eccentric anomaly will return in radians
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
% Feb 1, 2022    Noah Sampson      Developed
%
function [E] = nu_to_E_Sampson(nu,e)
nu_rad = deg2rad(nu); %converting input degrees to radians
E = acos((e+cos(nu_rad))/(1+e*cos(nu_rad))); %solves for E
if nu_rad > pi() %checks nu since arccos will only properly return for nu < pi
    E = (2*pi())-E; %makes E correct angle
end
end