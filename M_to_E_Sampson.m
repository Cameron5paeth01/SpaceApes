%% Development Information
% MAE 766 Spaceflight and Systems
% E_to_M_Sampson
% 
% Description: Converts eccentric anomaly to mean anomaly
% 
% input[M] mean anomaly
% input[e] eccentricity
% 
% output[E] eccentric anomaly
% 
% Units
% Mean anomaly must be in degrees
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
% Feb 21, 2022    Noah Sampson      Developed
%
function [E] = M_to_E_Sampson(M_fin,e)
M_fin = deg2rad(M_fin);
if M_fin < pi() % setting initial guesses
    E_fin1 = M_fin+(e/2);
else if M_fin > pi()
        E_fin1 = M_fin-(e/2);
    end
end
E_fin2 = 0; % preset varible
while 1 % sets permanent while loop
    E_fin2 = M_fin + e*sin(E_fin1); % iteration for E_final
    holder = abs(E_fin2-E_fin1);
    tol = 1*10^-6; % sets tolerance
    if  holder < tol%checks tolerance
        break % breaks if clears check
    end
    E_fin1 = E_fin2; % if doesn't break, resets varibles for next round
end
E = E_fin2;
end