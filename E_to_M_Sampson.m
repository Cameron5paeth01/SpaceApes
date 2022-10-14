%% Development Information
% MAE 766 Spaceflight and Systems
% E_to_M_Sampson
% 
% Description: Converts eccentric anomaly to mean anomaly
% 
% input[E,e] eccentric anomaly and eccentricity
% 
% output[M] mean anomaly
% 
% Units
% Eccentric anomaly must be in degrees
% Mean anomaly will return in radians
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
function [M] = E_to_M_Sampson(E,e)
E_rad = deg2rad(E); %Converts E to radians
M = E_rad-e*sin(E_rad); %solves for M
end