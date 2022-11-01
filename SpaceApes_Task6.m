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
%                         Cameron S.
%% this first section is copied from task 1 to obtain the orbit conditions at 330 seconds
% Planet Data
PlanetData = loadPlanetReferenceData;
mu = PlanetData.Mars.mu; %km^3/s^2
r_mars = PlanetData.Mars.planet_radius; %km
% Elements
a_L = 400+r_mars; %km
a_G = 17028.01+r_mars; %km
e_L=0;
e_G=0;
i_L=deg2rad(30);
i_G=0;
RAAN_L=deg2rad(20);
RAAN_G=0;
nu_init_L=deg2rad(60);
nu_init_G=deg2rad(250);
%
t = 330; %sec
n_L = sqrt(mu/a_L^3); %rad/s
n_G = sqrt(mu/a_G^3); %rad/s
% orbit propagation
[nu_fin_L,k_L] = kepler_orbit_prop_Sampson(a_L,e_L,rad2deg(nu_init_L),t,mu);
nu_fin_L=deg2rad(nu_fin_L);
[nu_fin_G,k_G] = kepler_orbit_prop_Sampson(a_G,e_G,rad2deg(nu_init_G),t,mu);
nu_fin_G=deg2rad(nu_fin_G);% 
% Functions
[r_vec_L, r_dot_vec_L] = Radius313Euler_to_NPositionVelocity_SpaceApes(r_mars,RAAN_L,i_L,nu_fin_L,mu);
[r_vec_G, r_dot_vec_G] = Radius313Euler_to_NPositionVelocity_SpaceApes(r_mars,RAAN_G,i_G,nu_fin_G,mu);
%%
[R_N_to_Rc] = DCM_N_to_Rc_SpaceApes(r_vec_L, r_vec_G)