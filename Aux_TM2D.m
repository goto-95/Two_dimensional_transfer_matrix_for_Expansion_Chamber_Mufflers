function [Tm] = Aux_TM2D(ko, kIn, Xa, Xt, Y, Nmode)
    %   ===============================================================================
    %%%%%%%%%% ========== Aux_AlphaCoef ========== %%%%%%%%%% 
    %%%%% ----- Description ----- %%%%%
    %  
    %
    %%%%% ----- Arguments ----- %%%%%
    % r1     
    %
    %%%%% ----- Answer ----- %%%%%
    % 
    % ===============================================================================
    
    % Extracting
    Ba = Xa(1:Nmode+1,1);
    Bt = Xt(1:Nmode+1,1);
    Ea = Xa(3*Nmode+4:4*Nmode+4,1);
    Et = Xt(3*Nmode+4:4*Nmode+4,1);
    
    % Assemblying
    T11 = (1 + sum(Bt))/(2*sum(Et));
    T21 = (1 - sum(kIn.*Bt/ko))/(2*sum(Et));
    T12 = (1 + sum(Ba))/(sum(kIn.*Ea/ko)) - T11;
    T22 = (1 - sum(kIn.*Ba/ko))/sum(kIn.*Ea/ko) - T21;

    Tm = [ T11 Y*T12 ; T21/Y T22];
end