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
% Nov. 2022         Noah S.       
%                         Cameron S.
% initial conditions
q_N_to_B = [1/3;2/5;-8/15;2/3];
omega_B_rel_N = deg2rad([1;1.75;-2.2]);
% sun pointing
R_N_to_Rs = [-1 0 0; 0 0 1; 0 1 0];
omega_Rs_rel_N = [0;0;0];
[q_Rs_to_B, omega_B_rel_Rs] = AttitudeError_SpaceApes(q_N_to_B,omega_B_rel_N,R_N_to_Rs,omega_Rs_rel_N);
% nadir pointing
% copied from task 5, edited so time = 0s
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
n_L = sqrt(mu/a_L^3); %rad/s
% Functions
[r_vec_N, r_dot_vec_N] = Radius313Euler_to_NPositionVelocity_SpaceApes(r_mars,RAAN_L,i_L,nu_init_L,mu);

[R_N_to_Rn,omega_Rn_rel_N_as_N] = DCM_N_to_Rn_SpaceApes(r_vec_N,r_dot_vec_N,n_L);

[q_Rn_to_B, omega_B_rel_Rn] = AttitudeError_SpaceApes(q_N_to_B,omega_B_rel_N,R_N_to_Rn,omega_Rn_rel_N_as_N);
% for some godforsaken reason the q is output inverted and as a long
% rotation, so it needs to be multiplied by -1
q_Rn_to_B = -1*q_Rn_to_B;
% omega is just plain screwed, the values should be constant but only the
% 2nd value ever comes out right
% i doubt even god knows
% communications pointing
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
n_L = sqrt(mu/a_L^3); %rad/s
n_G = sqrt(mu/a_G^3); %rad/s
% Functions
[r_vec_L, r_dot_vec_L] = Radius313Euler_to_NPositionVelocity_SpaceApes(r_mars,RAAN_L,i_L,nu_init_L,mu);
[r_vec_G, r_dot_vec_G] = Radius313Euler_to_NPositionVelocity_SpaceApes(r_mars,RAAN_G,i_G,nu_init_G,mu);
[R_N_to_Rc] = DCM_N_to_Rc_SpaceApes(r_vec_L, r_vec_G);

[q_Rc_to_B, omega_B_rel_Rc] = AttitudeError_SpaceApes(q_N_to_B,omega_B_rel_N,R_N_to_Rc,[0;0;0]);





