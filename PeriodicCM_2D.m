                %%%%%%%%%% ========== ExpansionChamber2D ========== %%%%%%%%%%
% =============================================================================================
% Author: Adriano M. Goto
% Date: 08/04/2020
% ---------------------------------------------------------------------------------------------
% Code overview: Implementation of the bidimensional transfer matrix by using the analytical 
%                solution for circular ducts according to Selamet's paper: "THE EFFECT OF 
%                LENGTH ON THE ACOUSTIC ATTENUATION PERFORMANCE OF CONCENTRIC EXPANSION 
%                CHAMBERS: ANANALYTICAL, COMPUTATIONAL AND EXPERIMENTAL INVESTIGATION" (1997) 
% ---------------------------------------------------------------------------------------------
%
% =============================================================================================

%%%%% ---------- Cleaning ---------- %%%%%
    clear;
    close all;
    clc

%%%%% ---------- Expansion chamber data ---------- %%%%%    
    Data_Silencer3;

%%%%% ---------- Parameters of numerical solution of the characteristic equation ---------- %%%%%     
    Nmax = 20;      % Maximuum number of iterations        
    delta = 1e-2;   % Secant method step 
    tol = 1e-10;    % Error tolerance    
    Nmode = 10;      % Number of extra wave modes
    warning off;
    
%%%%% ---------- Finding roots ---------- %%%%%       
    alpha = 0.1:0.01:100;
    F = besselj(1,alpha);
    [Nr,indr] = Aux_VerifyRoots(F); % Identify the position of the potential roots
    [alpha_n] = Aux_BesselJZeros(alpha,Nmax,tol,delta,indr(1:Nmode+1)); % Obtain the roots
    alpha_n = [0; alpha_n(1:end-1)]; % Including the first root for plane wave Beta_n=0

%%%%% ---------- Vectors ---------- %%%%% 
    %%% ---------- Axial wavenumbers ---------- %%%
        kIn = zeros(Nmode+1,length(freq));
        kIIn = kIn;
        kIIn_curves = zeros(Nmode+1,1);
        
    %%% ---------- Transmission loss ---------- %%%
        TL = zeros(1,length(freq)); 
        
    %%% ---------- Bragg Wavenumber ---------- %%%
        kB = zeros(1,length(freq)); 
    
    %%% ---------- Forced response ---------- %%%
        FRF = zeros(1,length(freq));
    
%%%%% ---------- Frequency loop ---------- %%%%%    
    for cont=1:length(freq)
        % ---------- Axial wavenumbers ---------- %
        ko = 2*pi*freq(cont)/co;
        ko = ko*(1-1i*eta/2);
        kIn = Aux_AxialWavenumber(ko,alpha_n/r1);
        kIIn = Aux_AxialWavenumber(ko,alpha_n/r2);
        
        % ---------- Wavenumbers curves for chamber region ---------- % 
        kIIn_curves(:,cont) = kIIn; % For plotting if you wondering get the dispersion curves
        
        % ---------- Wave Coefficients ---------- %
        [Xa,Xt] = Aux_AlphaCoef(r1,r2,alpha_n,kIn,kIIn,Lc,Nmode,1);
        Ba = Xa(1:Nmode+1,1);           
        Bt = Xt(1:Nmode+1,1);
        Ea = Xa(3*Nmode+4:4*Nmode+4,1);
        Et = Xt(3*Nmode+4:4*Nmode+4,1);
        
        % ---------- Bidimensional transfer matrix ---------- %
            % Assembling
            T11 = (1 + Bt(1))/(2*Et(1));
            T21 = (1 - Bt(1))/(2*Et(1));
            T12 = (1 + Ba(1))/Ea(1) - T11;
            T22 = (1 - Ba(1))/Ea(1) - T21;
            Tm = [ T11 Y*T12 ; T21/Y T22];
            Td = Aux_MatrixDuct(rho,co,Sd,ko,Ld);
            Tcell = Td*Tm*Td;
        
            % Bragg wavenumber for 2D TM
            [kB(cont),phi,lambda] = Aux_BraggWavenumber(Tcell);
        
            % Anechoic condition for 2D TM
            [v1,v2] = Aux_AnechoicConditions(kB(cont),phi,h,Nc,Y);
            
            % Forced response
            [P,V] = Aux_WaveExpanctionF(phi(:,1),lambda(1),Nc,v1,v2); 
            FRF(cont) = P(end)/V(1);
            
            % Transmission loss for 2D transfer matrix
            Tper = mpower(Tcell,Nc);
            aux_tl = 0.5*abs( Tper(1,1) + Tper(1,2)/Y + Tper(2,1)*Y + Tper(2,2));   
            TL(cont) = 20*log10(aux_tl);
    end
    
%%%%% ---------- Plotting ---------- %%%%% 
    %%% ---------- Transmission loss ---------- %%%
        figure;
        plot(freq,TL,'k','linewidth',2)
        grid on;
        xlabel('Frequency [Hz]'); ylabel('TL [dB]');
        
    
    %%% ---------- Dispersion diagram ---------- %%%
        figure;
        subplot(211)
        plot(freq,abs(real(kB)),'k','linewidth',2); 
        hold on;
        plot(freq,imag(kB),'k:','linewidth',2);
        legend('Real','Imag')
        grid on;
        xlabel('Frequency [Hz]'); ylabel('k_cL_c');
        title('Dispersion diagram')
        
    %%% ---------- Forced response ---------- %%%
        subplot(212)
        plot(freq, 20*log10(abs(FRF)), 'k','linewidth',2);
        grid on;
        xlabel('Frequency [Hz]');ylabel('SPL [dB, ref.Pa*s/m^3]');
        title('Forced response') 
 
    
    


    
    
    
    