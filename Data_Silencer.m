            %%%%% ---------- Data_Silencer ---------- %%%%%
% =============================================================================== % 
% Acoustical silencer parameters based from from A. Selamet (1997) - "The effect 
% of length on the acoustic attenuation perfomance of concentric expansion 
% chambers"
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
    
    r1 = 53e-3/2;   
    r2 = 150e-3/2;   
    Sc = pi*r2^2;
    Sd = pi*r1^2;
    Y = (rho*co)/Sd;
    Yc = (rho*co)/Sc;
    Nc = 1;            % Number of cells
    h = 2*Ld+Lc;
    m=(r2/r1)^2;
    


