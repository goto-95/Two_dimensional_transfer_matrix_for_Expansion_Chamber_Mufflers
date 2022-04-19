function [kB,phi,lambda] = Aux_BraggWavenumber(T)
    % =====================================================================
    %%%%%%%%%% ========== Aux_TransmissionLoss ========== %%%%%%%%%% 
    %%%%% ----- Code overview ----- %%%%%
    %   Auxiliar function to calculate the Bragg wavenumber and the
    %   eigenvectors and eigenvalues
    %
    %%%%% ----- Arguments ----- %%%%%
    % T   -> Transfer matrix
    %          
    %%%%% ----- Saída ----- %%%%%
    % kB     -> Bragg wavenumber
    % phi    -> Eigenvectors of the transfer matrix
    % lambda -> Eigenvalues of the transfer matrix
    % =====================================================================
    
    % Eigenvalues for TM
    [phi,lambda] = eig(T);
    lambda = diag(lambda);
    [~,ind]=sort(abs(lambda));
    lambda = lambda(ind);
    phi = phi(:,ind);
        
    % Bragg wavenumber 
    kB = log(lambda(1))/(-1i);
end