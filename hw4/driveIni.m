% Initialization file for control of an induction motor drive system
%
% Control of Electrical Drive Systems, TAU, Tampere
% Petros Karamanakos, September 2025

clear functions         % clear all persistent variables
global Ts Tc PWMrat

%% Rated machine parameters (SI)

% voltage (V)
V_rat = 400;
% current (A)
I_rat = 4.4;
% frequency (Hz)
f_rat = 50;
% speed (rpm)
n_rat = 2875; 
% power factor
cosphi = 0.85; 
% number of pole pairs
npp = floor(f_rat * 60 / n_rat);   
% rated slip --> s = (we-wr)/we (pu)
slip_rat = 1 - npp * n_rat / (60 * f_rat);  

%%  Machine paramteres (SI)

% stator resistance (Ohm)
Rs_SI = 2.7; 
% rotor restistance (Ohm)
Rr_SI = 2.4;    
% stator leakage inductance (H)
Lls_SI = 9.868e-3;   
% rotor leakage inductance (H)
Llr_SI = 11.777e-3;
% mutual inducance (H)
Lm_SI = 394.704e-3;
% inertia (kgm^2)
M_SI = 0.0027;

%% Inverter parameters (SI)

% total dc-link voltage (V)
Vdc_nom_SI = 600;

%% Base values

% to be added...
Vb=sqrt(2/3)* V_rat;
Ib=sqrt(2)*I_rat;
Zb=Vb/Ib;
wb=2*pi()*f_rat;
w_b=wb;
Tb=3/2*cosphi*npp*Vb*Ib/wb;
M_b=Tb*wb; %% nev9mmm overit ....................................................
%% Machine parameters (pu)

% stator resistance 
Rs = Rs_SI/Zb; % to be added
% rotor restistance 
Rr = Rr_SI/Zb; % to be added
% stator leakage inductance 
Xls = wb*Lls_SI/Zb; % to be added
% rotor leakage inductance 
Xlr = wb*Llr_SI/Zb; % to be added
% mutual inducance 
Xm = wb*Lm_SI/Zb; % to be added

%% inverter parameters (pu)

% total dc-link voltage 
Vdc = Vdc_nom_SI/Vb; % to be added

%% Other machine parameters (pu) and more

% moment of inertia
M = M_SI/M_b;

% deduced machine parameters 
Xs = Xls + Xm;
Xr = Xlr + Xm;
D = Xs * Xr - Xm^2;

% machine time constants
tauS = Xr * D / (Rs * Xr^2 + Rr * Xm^2);
tauR = Xr / Rr;
    
% other parameters
kr = Xm/Xr;
Rsigma = Rs + kr^2 * Rr;
sigma = 1 - (Xm^2 / (Xr * Xs));

%% sampling interval
Ts = 1e-6;
Tc = 10e-6;
%% moje motor
% isis=ones(2)*1/tauS;
% isfr=(1/tauR*ones(2)-)
j=[0 -1;1 0];
%% controller setting

% pulse ratio
PWMrat = 39;

% V/f ratio
Vf = 1% to be added

% desired mechanical speed
omegaM_ref = 0.9 % to be added

% load torque
TL_ini = 0.3 % to be added
