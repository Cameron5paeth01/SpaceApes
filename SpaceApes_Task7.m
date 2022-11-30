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

% communications pointing
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
t = 0; %sec
t2 = 0.1;
n_L = sqrt(mu/a_L^3); %rad/s
n_G = sqrt(mu/a_G^3); %rad/s
[nu_fin_L1,~] = kepler_orbit_prop_Sampson(a_L,e_L,rad2deg(nu_init_L),0,mu);
[nu_fin_G1,~] = kepler_orbit_prop_Sampson(a_G,e_G,rad2deg(nu_init_G),0,mu);
[nu_fin_L2,~] = kepler_orbit_prop_Sampson(a_L,e_L,rad2deg(nu_init_L),0.1,mu);
[nu_fin_G2,~] = kepler_orbit_prop_Sampson(a_G,e_G,rad2deg(nu_init_G),0.1,mu);
nu_fin_L1 = deg2rad(nu_fin_L1);
nu_fin_G1 = deg2rad(nu_fin_G1);
nu_fin_L2 = deg2rad(nu_fin_L2);
nu_fin_G2 = deg2rad(nu_fin_G2);

[r_vec_L1, ~] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_L,RAAN_L,i_L,nu_init_L,mu);
[r_vec_G1, ~] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_G,RAAN_G,i_G,nu_init_G,mu);

[R_N_to_Rc_0] = DCM_N_to_Rc_SpaceApes(r_vec_L1,r_vec_G1);


[nu_fin_L1,~] = kepler_orbit_prop_Sampson(a_L,e_L,rad2deg(nu_init_L),330,mu);
[nu_fin_G1,~] = kepler_orbit_prop_Sampson(a_G,e_G,rad2deg(nu_init_G),330,mu);
[nu_fin_L2,~] = kepler_orbit_prop_Sampson(a_L,e_L,rad2deg(nu_init_L),330.1,mu);
[nu_fin_G2,~] = kepler_orbit_prop_Sampson(a_G,e_G,rad2deg(nu_init_G),330.1,mu);
nu_fin_L1 = deg2rad(nu_fin_L1);
nu_fin_G1 = deg2rad(nu_fin_G1);
nu_fin_L2 = deg2rad(nu_fin_L2);
nu_fin_G2 = deg2rad(nu_fin_G2);
[r_vec_L1, r_dot_vec_L1] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_L,RAAN_L,i_L,nu_fin_L1,mu);
[r_vec_G1, r_dot_vec_G1] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_G,RAAN_G,i_G,nu_fin_G1,mu);
[r_vec_L2, r_dot_vec_L2] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_L,RAAN_L,i_L,nu_fin_L2,mu);
[r_vec_G2, r_dot_vec_G2] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_G,RAAN_G,i_G,nu_fin_G2,mu);
[R_N_to_Rc_3301] = DCM_N_to_Rc_SpaceApes(r_vec_L2,r_vec_G2);
[R_N_to_Rc_330] = DCM_N_to_Rc_SpaceApes(r_vec_L1,r_vec_G1);



R_dot = (R_N_to_Rc_3301-R_N_to_Rc_330)/.1;
R_dot = R_dot*R_N_to_Rc_0';
omega_Rc_rel_N_as_Rc = [R_dot(2,3);-R_dot(1,3);R_dot(1,2)];
omega_Rc_rel_N_as_N = R_N_to_Rc_0'*omega_Rc_rel_N_as_Rc;
q_N_to_B = [1/3;2/5;-8/15;2/3];
[q_Rc_to_B, omega_B_rel_Rc] = AttitudeError_SpaceApes(q_N_to_B,omega_B_rel_N,R_N_to_Rc_0,omega_Rc_rel_N_as_N);

