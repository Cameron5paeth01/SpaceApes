function [R_N_to_Rc,omega_Rc_rel_N_as_N] = omega_Rc_rel_N_SpaceApes(r_lmo, r_gmo) 
t = 330;
Dt = 0.1;
R_N_to_Rc = DCM_N_to_Rc_SpaceApes(r_lmo, r_gmo);
R_dot_N_to_Rc = (R_N_to_Rc(t+Dt)-R_N_to_Rc(t))/Dt;
omega_Rc_rel_N_as_N = R_dot_N_to_Rc*R_N_to_Rc';
end