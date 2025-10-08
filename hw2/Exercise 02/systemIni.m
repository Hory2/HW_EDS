% Initialization file for a three-phase two-level converter assuming open-loop 
% conrtol with SVM
%
% Control of Electrical Drive Systems, TAU, Tampere
% Petros Karamanakos, September 2025

clear functions         % clear all persistent variables

%% Rated parameters (SI)

% voltage (V)
V_rat = 400;
% frequency (Hz)
f_rat = 50;


%% Inverter parameters (SI)

% total dc-link voltage (V)
Vdc_nom_SI = 550;

%% Base values
Vb=V_rat*sqrt(2);
wb=2*pi()*f_rat;
w_b=wb;

% to be added...

%% inverter parameters (pu)

% total dc-link voltage 
Vdc = 550/Vb; % to be added

%% sampling interval
Ts = 1e-6;
Tc = 10e-6;

%% controller setting

% desired voltage (pu)
v_ref = 1.155 ;% to be added
v_ref=1;
% angular frequency
% omega = 2*pi()*f_rat ;% to be added
omega=1;
% pulse ratio
PWMrat = 39; % to be added


