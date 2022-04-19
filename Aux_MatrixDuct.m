function [Te]= Aux_MatrixDuct(rho,co,A,k,L)   
    %%%%%%%%%% ========== Aux_Matrix Duct ========== %%%%%%%%%% 
    %%%%% ----- Overview ----- %%%%%
    %   Function for computing the duct transfer matrix
    %
    %%%%% ----- Input ----- %%%%%
    % rho -> Density [kg/m^3]
    % co  -> Sound speed in air [m/s]
    % A   -> Cross-section area of the duct
    % k   -> Wavenumber
    % L   -> Duct length
    %
    %%%%% ----- Output ----- %%%%%
    % Te  -> Transfer matrix
    % =====================================================================
    
    % Characteristic impedance for volume velocity
    Y = (rho*co)/A;
                  
    % Transfer matrix
    Te = [ cos(k*L)        1j*Y*sin(k*L) ;
           1i*sin(k*L)/Y      cos(k*L)  ];
       
end
    
    