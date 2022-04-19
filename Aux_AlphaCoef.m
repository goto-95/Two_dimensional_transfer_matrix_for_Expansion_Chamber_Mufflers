function [Xa,Xt] = Aux_AlphaCoef(r1,r2,alpha,kI,kII,Lc,N,A0)
    %   ===============================================================================
    %%%%%%%%%% ==========  ========== %%%%%%%%%% 
    %%%%% ----- Description ----- %%%%%
    %   
    %
    %%%%% ----- Arguments ----- %%%%%
    % r1     -> Inner perforated duct diameter [m]
    % r2     -> Outer duct diameter [m]
    % alpha  -> Eigenroots for radial modes
    % kIn    -> Axial wavenumber at the inlet/outlet duct
    % kIIn   -> Axial wavenumber at the expansion chamber
    % ko     -> Total air wavenumber [1/m]
    % Lc     -> Chamber length
    % N      -> Number of additional wave modes
    % A0     -> Plane wave excitation
    %
    %%%%% ----- Answer ----- %%%%%
    % Xa -> Wave coefficients for the anechoic conditions
    % Xt -> Wave coefficients for rigid termination conditions
    % ===============================================================================
    
    ko = kI(1);
    M11 = zeros(N+1); 
    M0 = M11;   M12 = M11;    
    M21 = M11;  M22 = M11;  
    M32 = M11;  M33 = M11;  M34 = M11; M34t = M11;
    M42 = M11;  M43 = M11;  M44 = M11; 
    v2 = zeros(N+1,1);
    
    I1 = 0.5*r1^2;
    I5 = 2*I1;
    I6 = r2^2;
    
    M11(1,1) = I1;
    M12(1,1) = -I1;
    M21(1,1) = -I5;
    M22(1,1) = -I6;
    M32(1,1) = I1*exp(-1i*ko*Lc);
    M33(1,1) = I1*exp(1i*ko*Lc);
    M34(1,1) = -I1;
    M34t(1,1) = -I5;
    M42(1,1) = I6*exp(-1i*ko*Lc);
    M43(1,1) = -I6*exp(1i*ko*Lc);
    M44(1,1) = -I5;
    v2(1) = -I5*A0;
    
    for n=2:N+1
        I2 = ((r1*r2)/alpha(n))*besselj(1,alpha(n)*r1/r2);
        M12(1,n) = -I2;
        M32(1,n) = I2*exp(1i*kII(n)*Lc);
        M33(1,n) = I2*exp(-1i*kII(n)*Lc);
        
        s=n;
        I7 = ((r1*r2)/alpha(s))*besselj(1,alpha(s)*r1/r2);
        M21(s,1) = -ko*I7;
        M44(s,1) = ko*I7;
        v2(s) = -ko*I7*A0;
    end
    
    
    for s=2:N+1
        for n=2:N+1
            I3 = I1*besselj(0,alpha(n))^2;
            I4 = ( (r1/r2)*alpha(n)*besselj(0,alpha(s))*besselj(1,alpha(n)*r1/r2))...
                /( (alpha(n)/r2)^2 -(alpha(s)/r1)^2 );
            I8 = ( (r1/r2)*alpha(s)*besselj(0,alpha(n))*besselj(1,alpha(s)*r1/r2))...
                  /( (alpha(s)/r2)^2 -(alpha(n)/r1)^2 );
            I9 = 0.5*I6*besselj(0,alpha(n))^2;
            
            M12(s,n) = -I4;
            M21(s,n) = kI(n)*I8;
            M32(s,n) = I4*exp(1i*kII(n)*Lc);
            M33(s,n) = I4*exp(-1i*kII(n)*Lc);
            M44(s,n) = -kI(n)*I8;
            
            if n==s
                M11(s,n) = I3;
                M22(s,n) = kII(n)*I9;
                M34(s,n) = -I3;
                M34t(s,n) = -2*I3;
                M42(s,n) = kII(n)*I9*exp(1i*kII(n)*Lc);
                M43(s,n) = -kII(n)*I9*exp(-1i*kII(n)*Lc);
            end
            
            
        end
    end
    M13 = M12;
    M23 = -M22;
    
    % Anechoic condition
    Ma = [ M11 M12 M13 M0  ; 
          M21 M22 M23 M0  ;
          M0  M32 M33 M34 ;
          M0  M42 M43 M44 ];
      
    % Total reflection condition
    Mt = [ M11 M12 M13 M0  ; 
          M21 M22 M23 M0  ;
          M0  M32 M33 M34t ;
          M0  M42 M43 M0 ];  
    V = zeros(4*(N+1),1);
    V(1,1) = -I1*A0;
    V(N+2:2*N+2,1) = v2;
    
    Xa = Ma\V;
    Xt = Mt\V;
end
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        