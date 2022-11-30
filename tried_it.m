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
t2 = 1;
n_L = sqrt(mu/a_L^3); %rad/s
n_G = sqrt(mu/a_G^3); %rad/s
[nu_fin_L1,k_L] = kepler_orbit_prop_Sampson(a_L,e_L,rad2deg(nu_init_L),t,mu);
[nu_fin_G1,k_G] = kepler_orbit_prop_Sampson(a_G,e_G,rad2deg(nu_init_G),t,mu);
[nu_fin_L2,k_L] = kepler_orbit_prop_Sampson(a_L,e_L,rad2deg(nu_init_L),t2,mu);
[nu_fin_G2,k_G] = kepler_orbit_prop_Sampson(a_G,e_G,rad2deg(nu_init_G),t2,mu);


[r_vec_L1, r_dot_vec_L1] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_L,RAAN_L,i_L,nu_fin_L1,mu);
[r_vec_G1, r_dot_vec_G1] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_G,RAAN_G,i_G,nu_fin_G1,mu);
[r_vec_L2, r_dot_vec_L2] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_L,RAAN_L,i_L,nu_fin_L2,mu);
[r_vec_G2, r_dot_vec_G2] = Radius313Euler_to_NPositionVelocity_SpaceApes(a_G,RAAN_G,i_G,nu_fin_G2,mu);
[R_N_to_Rc_0] = DCM_N_to_Rc_SpaceApes(r_vec_L1,r_vec_G1);
[R_N_to_Rc_1] = DCM_N_to_Rc_SpaceApes(r_vec_L2,r_vec_G2);
R_dot = (R_N_to_Rc_1-R_N_to_Rc_0)/.1;
omega_skew = R_dot'/(R_N_to_Rc);
omega_Rc_rel_N_as_N = [0;0;0];
omega_Rc_rel_N_as_N = [omega_skew(2,1);-omega_skew(3,1);omega_skew(3,2)];
[q_Rc_to_B, omega_B_rel_Rc] = AttitudeError_SpaceApes(q_N_to_B,omega_B_rel_N,R_N_to_Rc,omega_Rc_rel_N_as_N);
