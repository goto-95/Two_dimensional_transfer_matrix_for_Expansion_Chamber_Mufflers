            %%%%% ---------- Data_Silencer ---------- %%%%%
% =============================================================================== % 
% Acoustical silencer parameters taken from from A. Selamet (199) - ""
% =============================================================================== %

%%%%% ----- Frequency range ----- %%%%%   
    fo   = 1;       % Initial frequency [Hz]
    fmax = 3e3;     % Final frequency [Hz]
    df = 2.5;         % Frequency step [Hz]
    freq = fo:df:fmax; 
    omega = 2*pi*freq;

%%%%% ----- Properties ----- %%%%%
    eta = 1.8e-5;   % Viscosidade do ar [Pa*s]
    rho = 1.204;    % Air density [kg/m^3]
    co  = 343.3;    % Sound speed in air [m/s]
       
%%%%% ----- Acoustical silencer parameters ----- %%%%%    
    Lc = 100e-3;   % Chamber length [m]
    Ld = 68e-3;
    d = 60e-3;      % Inlet duct diameter [m]
    Dc = 150e-3;    % Expansion chamber diameter [m]
    r1 = d/2;       % Inlet duct radius [m]
    r2 = Dc/2;      % Inner perforated duct radius [m]
    Sc = pi*r2^2;
    Sd = pi*r1^2;
    Y = (rho*co)/Sd;
    Nc = 3;         % Number of cells
    h = 2*Ld+Lc;
    m=(r2/r1)^2;
    


