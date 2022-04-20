            %%%%% ---------- Data_Silencer ---------- %%%%%
% =============================================================================== % 
% Acoustical silencer parameters for the manufactured ECM
% =============================================================================== %

%%%%% ----- Frequency range ----- %%%%%   
    fo   = 1;           % Initial frequency [Hz]
    fmax = 3e3;         % Final frequency [Hz]
    df = 2.5;           % Frequency step [Hz]
    freq = fo:df:fmax;  % Frequency vector [Hz]
    omega = 2*pi*freq;  % Angular frequency vector [rad/s]

%%%%% ----- Properties ----- %%%%%
    eta = 1.8e-5;   % Air viscosity [Pa*s]
    rho = 1.204;    % Air density [kg/m^3]
    co  = 343.3;    % Sound speed in air [m/s]
       
%%%%% ----- Acoustical silencer parameters ----- %%%%%    
    Lc = 104e-3;       % Chamber length [m]
    Ld = 77.5e-3;      % Inlet/outlet duct length
    Dd = 53e-3;        % Inlet/outlet duct diameter [m]   
    rd = 53e-3/2;      % Inlet/outlet duct radius [m]  
    Dc = 53e-3;        % Expansion chamber diameter [m] 
    rc = Dc/2;         % Expansion chamber radius [m]
    Sc = pi*rc^2;      % Transversal chamber area [m^2]
    Sd = pi*rd^2;      % Transversal duct area [m^2]
    Y = (rho*co)/Sd;   % Volume velocity impedance for the duct [Pa*s/m^3]
    Yc = (rho*co)/Sc;  % Volume velocity impedance for the chamber [Pa*s/m^3]
    Nc = 1;            % Number of cells
    h = 2*Ld+Lc;       % Length of the cell [m]
    


