function [kz] = Aux_AxialWavenumber(ko,kr)
    %   ===============================================================================
    %%%%%%%%%% ========== Aux_AlphaCoef ========== %%%%%%%%%% 
    %%%%% ----- Description ----- %%%%%
    %   Function to compute correctly the wavenumber for any wave mode type
    %
    %%%%% ----- Input ----- %%%%%
    % ko -> Absolute wavenumber 
    % kr -> Radial wavemode obtained from the characteristic equation
    %
    %%%%% ----- Output ----- %%%%%
    % kz -> Axial wavenumber
    % 
    % ===============================================================================
    
    kz = zeros(length(kr),1);
    for n=1:length(kr)
        if ko>=kr(n)
            kz(n) = sqrt(ko^2-kr(n)^2);
        else
            kz(n) = 1j*sqrt(kr(n)^2-ko^2);
        end
    end
end
    
    