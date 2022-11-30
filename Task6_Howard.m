%% == Task 6 ==
clear
clc
PlanetData = loadPlanetReferenceData;
mu = PlanetData.Mars.mu; %km^3/s^2
r_mars = PlanetData.Mars.planet_radius; %km
a_LMO = 400+r_mars; %km
a_AMO = 17028.01+r_mars; %km
e_LMO=0;
e_AMO=0;
i_LMO=deg2rad(30);
i_AMO=0;
RAAN_LMO=deg2rad(20);
RAAN_AMO=0;
nu_LMO=deg2rad(60);
nu_AMO=deg2rad(250);

%
t = 330; %sec
n_L = sqrt(mu/a_LMO^3); %rad/s
n_G = sqrt(mu/a_AMO^3); %rad/s
nu_330_AMO = nu_AMO + ((330/330)*(2*pi()));
[r_N_AMO_330,r_dot_N_AMO_330] = radius313Euler_to_NPositionVelocity_SpaceApes(r_orbit_AMO, RAAN_AMO, incl_AMO, nu_330_AMO, theta_dot_AMO)
[T6_R_N_to_Rc] = DCM_N_to_Rc_SpaceApes(r_N_LMO_0,r_N_AMO)
[T6_R_N_to_Rc_330sec] = DCM_N_to_Rc_SpaceApes(r_N_LMO_330,r_N_AMO_330)
tStep = 0.1;
t = (0:tStep:330+tStep);
r_N_LMO_vec = zeros(3,length(t));
r_N_AMO_vec = zeros(3,length(t));
r_dot_N_LMO_vec = zeros(3,length(t));
r_dot_N_AMO_vec = zeros(3,length(t));
T6_R_N_to_Rc_vec = zeros(9,length(t));
for i = (1:length(t))
    T6_nu_vec_LMO(i) = nu_LMO + ((t(i)/T_LMO)*(2*pi()));
    T6_nu_vec_AMO(i) = nu_AMO + ((t(i)/T_AMO)*(2*pi()));
    
    [r_N_LMO_vec(:,i),r_dot_N_LMO_vec(:,i)] = Radius313Euler_to_NPositionVelocity_SpaceApes(r_orbit_LMO, RAAN_LMO, incl_LMO, T6_nu_vec_LMO(i), theta_dot_LMO);
    [r_N_AMO_vec(:,i),r_dot_N_AMO_vec(:,i)] = radius313Euler_to_NPositionVelocity_SpaceApes(r_orbit_AMO, RAAN_AMO, incl_AMO, T6_nu_vec_AMO(i), theta_dot_AMO);
    [T6_R_N_to_Rc_squarrr] = DCM_N_to_Rc_SpaceApes(r_N_LMO_vec(:,i),r_N_AMO_vec(:,i));
    T6_R_N_to_Rc_vec(:,i) = reshape(T6_R_N_to_Rc_squarrr,[9,1]);
end
T6_R_N_to_Rc_dot_vec = zeros(9,length(t));
T6_om_Rc_rel_N_as_N = zeros(3,length(t));
for j = (1:i-1)
       
    T6_R_N_to_Rc_dot_vec(:,j) = (T6_R_N_to_Rc_vec(:,j+1) - T6_R_N_to_Rc_vec(:,j)) ./ tStep;
    T6_R_N_to_Rc_sqaur = reshape(T6_R_N_to_Rc_vec(:,j), [3,3]);
    T6_R_N_to_Rc_dot_sqaur = reshape(T6_R_N_to_Rc_dot_vec(:,j), [3,3]);
    T6_om_Rc_rel_N_as_N_skew = -(T6_R_N_to_Rc_sqaur)'*(T6_R_N_to_Rc_dot_sqaur);
    
    T6_om_Rc_rel_N_as_N(:,j) = [T6_om_Rc_rel_N_as_N_skew(3,2);T6_om_Rc_rel_N_as_N_skew(1,3);T6_om_Rc_rel_N_as_N_skew(2,1)];
end
