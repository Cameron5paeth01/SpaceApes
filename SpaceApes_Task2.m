%% Development Information
% MAE 466 Spacecrafty Dynamics
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
% Oct. 2022         Cameron S.       
%
%% Task 2
close all
clear
clc
%% LMO
PlanetData = loadPlanetReferenceData;
e_L = 0;
mu_L = PlanetData.Mars.mu; %
a_L = 400+PlanetData.Mars.planet_radius; %km
nu_L = 60*pi/180; %rad
E_L = acos((e_L+cos(nu_L))/(1+e_L*cos(nu_L))); %rad
TOF_L = sqrt(a_L^3/mu_L)*(); %sec
Ang_V_H_L = 2*pi/TOF_L %rad/s

%% GMO
e_G = 0;
mu_G = PlanetData.Mars.mu; %
a_G = 17028.01+PlanetData.Mars.planet_radius; %km
nu_G = 250*pi/180; %rad
E_G = acos((e_G+cos(nu_G))/(1+e_G*cos(nu_G))); %rad
E_G = 2*pi-E_G;
TOF_G = sqrt(a_G^3/mu_G)*(E_G-e_G*sin(E_G)); %sec
Ang_V_H_G = 2*pi/TOF_G %rad/s
%%
% omega_L_rel_N_as_L =;
% omega_G_rel_N_as_G =;