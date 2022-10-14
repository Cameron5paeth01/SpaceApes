%% Development Information
% MAE 476 Space Flight and Systems
% MAE 466 Spacecraft Dynamics
% MAE 484 Spacecraft Propulsion
% MAE 486 Spacecraft Design 1
% MAE 487 Spacecraft Design 2
% 
% loadPlanetReferenceData: returns a structure of planetary reference data
% 
% output[PlanetData]: A two level structure with planets and planet
%                     constants.
% 
% % List of Planetary Bodies: 
% Mercury, Venus, Earth, Moon, Mars, Jupitar, Saturn, Uranus, Neptune, Sun
% 
% % List of Structure Elements: 
%   [mu]: Gravitational parameter. Units [km^3/s^2]
%   [orbit_radius]: Average orbital radius from central body. Units [km]
%   [planet_radius]: Mean equitorial radius. Units [km]
%   [orbit_period]: Number of Earth days to orbit the Sun. Units [Earth Days]
%   [J2]: gravitational constant for body oblateness. Unitless
%   [g]: gravity at planet surface [m/s^2]
% 
% % Assumptions:
% (1) Function does not accept input.
% (2) Data from Understanding Space 3rd Ed. by Sellers 
%     Appendices B.3, D.2, D.3, and D.4
% (3) Moon refers to Earth's Moon.
% (4) AU is given in units of kilometers.
% (5) All orbits are circular
% 
% % Information Access Example
% Access Earth's gravitational constant by calling PlanetData.Earth.mu
% 
% 
% % Primary Developer Contact Information:
% Andrew Rhodes, PhD
% Teaching Assistant Professor
% Undergraduate Program Coordinator
% Statler College of Engineering & Mineral Resources
% Dept. Mechanical and Aerospace Engineering
% West Virginia University (WVU)
% andrew.rhodes@mail.wvu.edu
%
%%



function PlanetData = loadPlanetReferenceData

AU = 1.4959787066e8; % km
PlanetData.Earth.g = 9.8066; 

PlanetData.Mercury.mu = 22030;
PlanetData.Mercury.orbit_radius = 0.387*AU;
PlanetData.Mercury.planet_radius = 2439;
PlanetData.Mercury.orbit_period = 0.241;
PlanetData.Mercury.J2 = 0.00006;
PlanetData.Mercury.g = 0.378 * PlanetData.Earth.g;

PlanetData.Venus.mu = 325700;
PlanetData.Venus.orbit_radius = 0.723*AU;
PlanetData.Venus.planet_radius = 6052;
PlanetData.Venus.orbit_period = 0.615;
PlanetData.Venus.J2 = 0.000027;
PlanetData.Venus.g = 0.907 * PlanetData.Earth.g;

PlanetData.Earth.mu = 398600;
PlanetData.Earth.orbit_radius = 1*AU;
PlanetData.Earth.planet_radius = 6378.14;
PlanetData.Earth.orbit_period = 1.0;
PlanetData.Earth.J2 = 0.0010826;
PlanetData.Earth.g = 9.8066; %m/s^2

PlanetData.Moon.mu = 4602.799;
PlanetData.Moon.orbit_radius = 3.844e5;
PlanetData.Moon.planet_radius = 1738;
PlanetData.Moon.orbit_period = 0.074801; % 27.321661 solar days
PlanetData.Moon.J2 = 0.0002027;
PlanetData.Moon.g = 0.166 * PlanetData.Earth.g;

PlanetData.Mars.mu = 42828.3; %4.305e4;
PlanetData.Mars.orbit_radius = 1.524*AU;
PlanetData.Mars.planet_radius = 3396.19; %3397.2;
PlanetData.Mars.orbit_period = 1.881;
PlanetData.Mars.J2 = 0.001964;
PlanetData.Mars.g = 0.377 * PlanetData.Earth.g;

PlanetData.Jupiter.mu = 1.268e8;
PlanetData.Jupiter.orbit_radius = 5.203*AU;
PlanetData.Jupiter.planet_radius = 71492;
PlanetData.Jupiter.orbit_period = 11.857;
PlanetData.Jupiter.J2 = 0.01469562;
PlanetData.Jupiter.g = 2.36 * PlanetData.Earth.g;

PlanetData.Saturn.mu = 3.794e7;
PlanetData.Saturn.orbit_radius = 9.555*AU;
PlanetData.Saturn.planet_radius = 60268;
PlanetData.Saturn.orbit_period = 29.424;
PlanetData.Saturn.J2 = 0.01629071;
PlanetData.Saturn.g = 0.916 * PlanetData.Earth.g;

PlanetData.Uranus.mu = 5.794e6;
PlanetData.Uranus.orbit_radius = 19.22*AU;
PlanetData.Uranus.planet_radius = 25559;
PlanetData.Uranus.orbit_period = 83.747;
PlanetData.Uranus.J2 = 0.00351068;
PlanetData.Uranus.g = 0.889 * PlanetData.Earth.g;

PlanetData.Neptune.mu = 6.809e6;
PlanetData.Neptune.orbit_radius = 30.11*AU;
PlanetData.Neptune.planet_radius = 24764;
PlanetData.Neptune.orbit_period = 163.72;
PlanetData.Neptune.J2 = 0.00340843;
PlanetData.Neptune.g = 1.12 * PlanetData.Earth.g;

PlanetData.Sun.mu = 1.327124e11;

       
end











