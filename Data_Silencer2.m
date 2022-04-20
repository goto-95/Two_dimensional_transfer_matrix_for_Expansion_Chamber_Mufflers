            %%%%% ---------- Data_Silencer ---------- %%%%%
% =============================================================================== % 
% Acoustical silencer parameters based from from A. Selamet (1997) - "The effect 
% of length on the acoustic attenuation perfomance of concentric expansion 
% chambers"
% Acoustical silencer parameters for the manufactured ECM
% =============================================================================== %

%%%%% ----- Frequency range ----- %%%%%   
    fo   = 1;           % Initial frequency [Hz]
    fmax = 3.3e3;       % Final frequency [Hz]
    df = 25;            % Frequency step [Hz]
    freq = fo:df:fmax; 
    omega = 2*pi*freq;

%%%%% ----- Properties ----- %%%%%
    eta = 1.8e-5;   % Air viscosity [Pa*s]
    rho = 1.204;    % Air density [kg/m^3]
    co  = 343.3;    % Sound speed in air [m/s]
       
%%%%% ----- Acoustical silencer parameters ----- %%%%%    
    Lc = 28.23e-2;     % Chamber length [m]
    Ld = 15e-2;        % Inlet/outlet duct length
    Dd = 60e-3;        % Inlet/outlet duct diameter [m]
    Dc = 150e-3;       % Expansion chamber diameter [m]
    rd = Dd/2;         % Inlet duct radius [m]
    rc = Dc/2;         % Inner perforated duct radius [m]
    Sc = pi*r2^2;      % Transversal chamber area [m^2]
    Sd = pi*r1^2;      % Transversal duct area [m^2]
    Y = (rho*co)/Sd;   % Volume velocity impedance for the duct [Pa*s/m^3]
    Yc = (rho*co)/Sc;  % Volume velocity impedance for the chamber [Pa*s/m^3]
    Nc =1;             % Number of cells
    h = 2*Ld+Lc;       % Length of the cell [m]     
    


