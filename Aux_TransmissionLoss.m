function [at] = Aux_TransmissionLoss(rho,co,A,Lc,Ld,Nc,T)
    %%%%%%%%%% ========== TransmissionLoss ========== %%%%%%%%%% 
    %%%%% ----- Descrição ----- %%%%%
    %   Função para retornar o coeficiente de transmissão at para um
    %   sistema de dutos microperfurados
    %
    %%%%% ----- Parâmetros de entrada ----- %%%%%
    % L       -> Comprimento da mufla
    % d       -> Distância entre as muflas
    % Nc      -> Número de células
    % lambda  -> Autovalores
    % phi     -> Autovetores
    %          
    %%%%% ----- Saída ----- %%%%%
    % at      -> Coeficiente de transmissão
    % =====================================================================
    
    Lt=Lc+2*Ld;
    Y = (rho*co)/A;
    HL = [1/2 -Y/2 ; 1/2 Y/2];
    H0 = [1 1 ; -1/Y 1/Y];
    T = HL*T*H0;
   
        
    % Autovalores e autovetores de T
    [phi,lambda] = eig(T);
    lambda = diag(lambda);
    [~,ind]=sort(abs(lambda));
    lambda = lambda(ind);
    phi = phi(:,ind);
    
    q = log(lambda)/(-1i*Lt);
    
    q1 = q(1);
    q2 = q(2);
    v1i = phi(1,1); v1r = phi(2,1);
    v2i = phi(2,1); v2r = phi(2,2);

    ab = - ( exp(-1i*q1*Lt*Nc)*v1r)/( exp(-1i*q2*Lt*Nc)*v2r);
    den = v1i + ab*v2i;
    num = exp(-1i*q1*Lt*Nc)*v1i + exp(-1i*q2*Lt*Nc)*ab*v2i ;
    at = num/den;
end