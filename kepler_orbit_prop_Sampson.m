%% Development Information
% MAE 766 Spaceflight and Systems
% kepler_orbit_prop_Sampson
% 
% Description: uses orbital elements to propogate orbit to find nu and k
% 
% 
% input[a]: Units[distance]
% input[e]: Units[...]
% input[nu_init]: Units[degree]
% input[TOF]: Units[second]
% input[mu]: Units[distance^3/time^2]
%
% output[nu_fin]: Units[degree]
% output[k]: Units[...]
%
% function dependencies:
% E_to_M_Sampson
% nu_to_E_Sampson
% M_to_E_Sampson
% E_to_nu_Sampson
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
function [nu_fin,k] = kepler_orbit_prop_Sampson(a,e,nu_init,TOF,mu)
n = sqrt(mu/a^3); % define mean motion
E_init = nu_to_E_Sampson(nu_init,e); % find initial E
M_init = E_to_M_Sampson(rad2deg(E_init),e); % find initial M
M_fin_tot = M_init+TOF*n; % finds total M_final
M_fin = mod(M_fin_tot,2*pi()); %finds M_fin for this orbit
k = (M_fin_tot-M_fin)/(2*pi()); % finds k
% now we get to the fun part
% using fixed point iteration
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
nu_fin = rad2deg(E_to_nu_Sampson(rad2deg(E_fin2),e)); %solves for nu final
end