%% Development Information
% MAE 466 Spacecraft Dynamics
% Space Apes Project Development
% SpaceApes_Task2
% finds N frame position and velocity of both satellites
%
% inputs: orbital elements of both satellites and Mars Planet Data
%
% output: N frame position and velocity of both satellites
% 
% requires Kepler_orbit_prop_Sampson
% requires Radius313Euler_to_NPositionVelocity_SpaceApes
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
% Oct. 2022         Noah    S.
%set initial values of spacecraft orbits
planref=loadPlanetReferenceData;
mu=planref.Mars.mu;
marsrad=planref.Mars.planet_radius;
a_L=marsrad+400;
a_G=marsrad+17028.01;
e_L=0;
e_G=0;
i_L=deg2rad(30);
i_G=0;
raan_L=deg2rad(20);
raan_G=0;
nu_L=deg2rad(60);
nu_G=deg2rad(250);
%orbit props
[nu_fin_L,k_L] = kepler_orbit_prop_Sampson(a_L,e_L,rad2deg(nu_L),450,mu);
nu_fin_L=deg2rad(nu_fin_L);
[nu_fin_G,k_G] = kepler_orbit_prop_Sampson(a_G,e_G,rad2deg(nu_G),450,mu);
nu_fin_G=deg2rad(nu_fin_G);
% find angular velocity of L
N_L=sqrt(mu/a_L^3);
% angular of G
N_G=sqrt(mu/a_G^3);
% omega of L frame relative to the inertial
omega_L_rel_N_as_L = N_L*[0;0;1];
% omega of G frame relative to the inertial
omega_G_rel_N_as_G = N_G*[0;0;1];
%find N frame position and velocity
[r_L, r_dot_L] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_L,raan_L,i_L,nu_fin_L,mu);
[r_G, r_dot_G] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_G,raan_G,i_G,nu_fin_G,mu);
