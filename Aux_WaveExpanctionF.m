function [P,Fe] = Aux_WaveExpanctionF(phi,mu,Nc,V0,Vn)    
    % =====================================================================
    %%%%%%%%%% ========== Aux_WaveExpansion ========== %%%%%%%%%% 
    %%%%% ----- Overview ----- %%%%%
    %   Auxiliar function to compute the inlet and outlet pressure from the
    %   know volume velocities
    %
    %%%%% ----- Arguments ----- %%%%%
    % phi  -> Eigenvectors of the transfer matrix
    % mu   -> Eigenvalues from the transfer matrix
    % Nc   -> Number of cells
    % V0   -> Volume velocity at inlet
    % VL   -> Volume velocty at outlet
    %          
    %%%%% ----- Saída ----- %%%%%
    % P  -> Pressure vector at cell junction
    % V -> Volume velocity at cell juntion
    % =====================================================================
    
    gdl = 1;
    pos = 1;
    Ra=ones(gdl,1);
    Ra(pos)=-1; 
    Ra=diag(Ra);
    R=[Ra zeros(gdl);zeros(gdl) -1*Ra];
    fi_q=phi(1:gdl,:);
    fi_F=phi(gdl+1:2*gdl,:);
    fi_star=R*phi;
    fi_star_q=fi_star(1:gdl,:);
    fi_star_F=fi_star(gdl+1:2*gdl,:);
    A=[           eye(gdl)                  (fi_F)\fi_star_F*(diag((mu).^Nc)) ; 
       (fi_star_F)\fi_F*diag((mu.^Nc))                eye(gdl)];
    Fo=[    -(fi_F)\V0 ; 
        (fi_star_F)\Vn];
    Qe=(A)\Fo;
    Q=Qe(1:gdl,:);
    Q_star=Qe(gdl+1:2*gdl,:);
    for ke=1:Nc+1
        P(:,ke)=fi_q*(diag(mu.^(ke-1)))*Q+fi_star_q*(diag(mu.^(Nc+1-ke)))*Q_star;
        Fe(:,ke)=fi_F*(diag(mu.^(ke-1)))*Q+fi_star_F*(diag(mu.^(Nc+1-ke)))*Q_star;
    end

end