%% Development Information
% MAE 466 Spacecraft Dynamics
% Space Apes Project Development
% SpaceApes_Task9
% propogates quaternion and omega for sun pointing frame
%
% inputs: initial quaternion and omega
% inputs: inertia matrix
% inputs: T_i, Zeta_i
%
% output: quaternion and omega
% 
% requires omega_kinematics_Sampson
% requires q_kinematics_Sampson
% requires attitude_error_SpaceApes
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
% Nov. 2022         Cameron S.       
% Nov. 2022         Noah    S.
runtime = 400; % seconds
h = 1; % timestep in seconds
t = 0; % dummy variable for functions
q_N_to_B_init = [(1/3);(2/5);(-8/15);(2/3)];
omega_B_rel_N_as_B_init = deg2rad([1;1.75;-2.2]); %rad/s
I_B = [10 0 0; 0 5 0; 0 0 7.5]; %kgm^2
T_i = 120; %seconds
zeta = 1;
% define control coefficients
K_D = norm((2*I_B)/T_i);
K_P = norm(inv(I_B)*(K_D/zeta)^2);
% establish state vector
X = zeros(runtime+1,7);
X(1,:)= [q_N_to_B_init(1) q_N_to_B_init(2) q_N_to_B_init(3) q_N_to_B_init(4) omega_B_rel_N_as_B_init(1) omega_B_rel_N_as_B_init(2) omega_B_rel_N_as_B_init(3)];
% sun pointing quaternion
    R_N_to_Rs = [-1 0 0; 0 0 1; 0 1 0];
    omega_Rs_rel_N = [0;0;0];
% implement Runge-Kutta
for i = [1:h:runtime] 
    % establish starting variables
    omega_i = [X(i,5);X(i,6);X(i,7)];
    q_i = [X(i,1);X(i,2);X(i,3);X(i,4)];
    % find control torque
    % sun pointing error
    [q_Rs_to_B, omega_B_rel_Rs] = AttitudeError_SpaceApes(q_i,omega_i,R_N_to_Rs,omega_Rs_rel_N);
    qv_Rs_to_B = [q_Rs_to_B(2);q_Rs_to_B(3);q_Rs_to_B(4)];
    % solve for torque
    u = -(K_P*qv_Rs_to_B)-(K_D*omega_B_rel_Rs);
    %k1
    omegadotk1 = omega_kinematics_Sampson(t,omega_i,I_B,u);
    qdot1 = q_kinematics_Sampson(t,q_i,omega_i);
    k1 = [qdot1(1);qdot1(2);qdot1(3);qdot1(4);omegadotk1(1);omegadotk1(2);omegadotk1(3)];
    % k2
    omega_i2 = omega_i+((h/2)*[k1(5);k1(6);k1(7)]);
    q_i2 = q_i+((h/2)*[k1(1);k1(2);k1(3);k1(4)]);
    omegadotk2 = omega_kinematics_Sampson(t,omega_i2,I_B,u);
    qdot2 = q_kinematics_Sampson(t,q_i2,omega_i);
    k2 = [qdot2(1);qdot2(2);qdot2(3);qdot2(4);omegadotk2(1);omegadotk2(2);omegadotk2(3)];
    %k3
    omega_i3 = omega_i+((h/2)*[k2(5);k2(6);k2(7)]);
    q_i3 = q_i+((h/2)*[k2(1);k2(2);k2(3);k2(4)]);
    omegadotk3 = omega_kinematics_Sampson(t,omega_i3,I_B,u);
    qdot3 = q_kinematics_Sampson(t,q_i3,omega_i);
    k3 = [qdot3(1);qdot3(2);qdot3(3);qdot3(4);omegadotk3(1);omegadotk3(2);omegadotk3(3)];
    %k4
    omega_i4 = omega_i+(h*[k3(5);k3(6);k3(7)]);
    q_i4 = q_i+(h*[k3(1);k3(2);k3(3);k3(4)]);
    omegadotk4 = omega_kinematics_Sampson(t,omega_i4,I_B,u);
    qdot4 = q_kinematics_Sampson(t,q_i4,omega_i);
    k4 = [qdot4(1);qdot4(2);qdot4(3);qdot4(4);omegadotk4(1);omegadotk4(2);omegadotk4(3)];
    %find xdot for i
    Xdot = k1+2*k2+2*k3+k4;
    %find x(i+h)
    X_iplush = X(i,:)'+((h/6)*Xdot);
    % enforce constraint
    q_iplush = [X_iplush(1);X_iplush(2);X_iplush(3);X_iplush(4)];
    q_iplush = q_iplush/norm(q_iplush);
    X_iplush(1:4,1) = q_iplush;
    % X_iplush and insert into state vector
    X_iplush = X_iplush';
    X(i+h,:) = X_iplush;
end
endtime = runtime+1;
omega_time = [X(endtime,5);X(endtime,6);X(endtime,7)];
H_B_time = I_B*omega_time;
T_time = .5*omega_time'*I_B*omega_time;
q_N_to_B_time = [X(endtime,1);X(endtime,2);X(endtime,3);X(endtime,4)];
R_N_to_B_time = q_to_DCM_Sampson(q_N_to_B_time);
H_N_time = R_N_to_B_time'*H_B_time;
