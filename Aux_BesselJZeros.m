function [alpha_n] = Aux_BesselJZeros(alpha,Nmax,tol,delta,indroots)
    %   ===============================================================================
    %%%%%%%%%% ========== EigenFunction ========== %%%%%%%%%% 
    %%%%% ----- Description ----- %%%%%
    %   Function for solve the charateristic equation for radial modes of 
    %   the expansion 
    %
    %%%%% ----- Arguments ----- %%%%%
    % alpha    -> Value of roots alpha [m]
    % Nmax     -> Maximuum number of iterations
    % tol      -> Error tolerance
    % delta    -> Step of iteration on modified secant method
    % indroots -> Roots index on alpha vector 
    %
    %%%%% ----- Answer ----- %%%%%
    % alpha_n  -> N-th eigenvalues axial wavenumber 
    % ===============================================================================
    ind1 = indroots(1,:);
    Nroots = length(ind1);
    
    alpha_n =  zeros(Nroots,1);
    for cont=1:Nroots  
        [alpha_n(cont), ~] = Aux_Bessel(alpha(ind1(cont)),Nmax,tol,delta);
    end
end
    