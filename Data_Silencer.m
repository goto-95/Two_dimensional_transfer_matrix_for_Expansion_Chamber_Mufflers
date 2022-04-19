            %%%%% ---------- Data_Silencer ---------- %%%%%
% =============================================================================== % 
% Acoustical silencer parameters
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
    Lc = 104e-3;       % Chamber length [m]
    Ld = 77.5e-3;
    r1 = 53e-3/2;   
    r2 = 150e-3/2;   
    Sc = pi*r2^2;
    Sd = pi*r1^2;
    Y = (rho*co)/Sd;
    Yc = (rho*co)/Sc;
    Nc = 1;            % Number of cells
    h = 2*Ld+Lc;
    m=(r2/r1)^2;
    


