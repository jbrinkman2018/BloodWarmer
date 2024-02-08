%% CAPSTONE 
%% Problem Summary:
% Calculations to determine how many batterries 
% are needed to power the device for 3 units of blood.
% For the amount of required energy calculated in our 
% heat transfer calcs, how many batteries do we need?
% How will they be configured? Where are we getting them from?

% FIND:
% 1) Required Battery capacity in Ah from Heat Transfer Calcs and 
% necessary qDot
% 2) Determine minimum current required to meet electrical Power
% constraints and doesn't drain battery too fast (1.5 L/charge time)
% 3) Determine approximate voltage required from the batteries 
% based on this current constraint. (Assuming Steady state) Need a value
% quite a bit bigger than this simply because of transient start.

% 4) from the capacity, required max voltage  of 
% INSERT_MAX_REQUIRED_VOLTAGE_HERE, and required current
% of INSERT_MIN_REQUIRED_CURRENT_HERE, what type of
% regarchable battery is cheapest and most ideal

%%  Assumptions: 
% All assumptions included in heat transfer calculations
% Ideal/fully charged batteries that still meet manufacturing specs - no
% degredation of battery capacity after subsequent charges

%% Formulas/Equations:
% Energy = Power * time
% Power = Voltage * Current

%% Execution

% Ideal Design Constraints
volume_per_charge = 1500; % mL - Ideal design constraint for battery life
flow_rate = 200; % mL/min - ideal flow rate

% Heat transfer required power calculations for STEADY STATE FLOW
Temp_Heater = 70; % Celcius
SS_power = 40; % W

time = volume_per_charge/flow_rate; % minutes
time = 60*time; % seconds
energy = SS_power * time % Required energy in Joules

%{
Initial Convection calculations for tube length
rho = 1.05*10^3;
nu = .0036/rho;
k = .54;

T_tube = 70;
T_in = 4;
T_out = 38;

D = .004;

mdot = .0033;

cp = 3617;

Re = 4*mdot/(rho*pi*D*nu)

if Re<2300
    Nu = 3.66;
end


h = Nu*k/D;

R = 1/(h*pi*D);

Length = (log((T_tube-T_out)/(T_tube-T_in)))*(-mdot*cp*R)

Pr = 21;

x_fd = .05*Re*D;
x_t = x_fd*Pr;

Adjusted Calculations for entry length

if x_t>(.1*Length)
    Gz = (D/x_t)*Re*Pr;

    Nu = 3.66 + ((.0668*Gz)/(1 + .04*Gz^(2/3)));
end

h = Nu*k/D;

R = 1/(h*pi*D);

Length = (log((T_tube-T_out)/(T_tube-T_in)))*(-mdot*cp*R)

Calculations for heater at steady state
% Energy balance Egen = Eout
ro = .55; %in
ri = .25; %in
k_al = 177; %W/mK
L = 0.1524; %length of cylinder in m

dT = 80-20; %temp of tubing from room temperature

Q =(2*pi*k*L*dT)/log(ro/ri) %power in W

Calculations for Conduction Transient Response 
% Bi = hL/k;
% Fo

}%




%% Reflection

% Price: 