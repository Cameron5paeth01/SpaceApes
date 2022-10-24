%% Development Information
% MAE 466 Spacecraft Dynamics 
% SpaceApes_Task5.m
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
close all
clear
clc
PlanetData = loadPlanetReferenceData;
mu = PlanetData.Mars.mu; %km^3/s^2
r_mars = PlanetData.Mars.planet_radius; %km
% Elements
a_L = 400+r_mars; %km
e_L=0;
i_L=deg2rad(30);
RAAN_L=deg2rad(20);
nu_init_L=deg2rad(60);
%
t = 330; %sec
n_L = sqrt(mu/a_L^3); %rad/s
% orbit propagation
[nu_fin_L,k_L] = kepler_orbit_prop_Sampson(a_L,e_L,rad2deg(nu_init_L),t,mu);
nu_fin_L=deg2rad(nu_fin_L);
% Functions
[r_vec_N, r_dot_vec_N] = Radius313Euler_to_NPositionVelocity_SpaceApes(r_mars,RAAN_L,i_L,nu_fin_L,mu);

[R_N_to_Rn,omega_Rn_rel_N_as_N] = DCM_N_to_Rn_SpaceApes(r_vec_N,r_dot_vec_N,n_L);
