function [v1,v2] = Aux_AnechoicConditions(kB,phi,h,Nc,Y)
    % =====================================================================
    %%%%%%%%%% ========== Aux_AnechoicConditions ========== %%%%%%%%%% 
    %%%%% ----- Code overview ----- %%%%%
    %   Auxiliar function to calculate the inlet and the outlet volume flux
    %   under the anechoic condition
    %
    %%%%% ----- Arguments ----- %%%%%
    % kB   -> Bragg wavenumber
    % phi  -> Eigenvectors of the transfer matrix
    % h    -> Total length of the periodic cell
    % Nc   -> Number of cells
    % Y    -> Characteristic impedance
    %          
    %%%%% ----- Saída ----- %%%%%
    % v1 -> Inlet volume flux
    % v2 -> Outlet volume flux
    % =====================================================================
    
    q1 = kB/h;
    q2 = -q1;

    I1 = phi(1,1) - (phi(2,1)/phi(2,2))*phi(1,2)*exp(-1i*(q1-q2)*h*Nc);
    R1 = ( 1-exp(-1i*(q1-q2)*h*Nc) )*phi(2,1);
    In = ( phi(1,1) - (phi(2,1)/phi(2,2))*phi(1,2) )*exp(-1i*q1*h*Nc);
    
    v1 = (-I1+R1)/Y;
    v2 = -(In/Y);
end