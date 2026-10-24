%Problema della membrana elastica (2D): Confronto tempi Soluzione Lineare

% Scegliamo valori di n non troppo grandi! 
% Ricorda che la matrice sarà (n-1)^2 x (n-1)^2. 
n_values = [10, 20, 30, 40, 60, 80];
tempi_full = zeros(length(n_values), 1);
tempi_sparse = zeros(length(n_values), 1);

fprintf('\nAvvio calcolo tempi per la Membrana 2D (A*U = b)...\n');

for i = 1:length(n_values)
    n = n_values(i);
    N = n - 1;       % Incognite su una singola riga/colonna della griglia
    N_tot = N^2;     % Numero TOTALE di incognite nel quadrato
    h = 1 / n;
    
    % --- 1. COSTRUZIONE MATRICE ELEGANTE ---
    % Creiamo il blocco G (matrice tridiagonale NxN)
    e = ones(N, 1);
    G = spdiags([-e, 4*e, -e], [-1, 0, 1], N, N);
    
    % Creiamo la matrice identità NxN per i blocchi fuori diagonale
    I_N = speye(N);
    
    % Usiamo il prodotto di Kronecker per assemblare l'intera matrice a blocchi.
    % È la traduzione in codice della matrice a blocchi della scheda.
    T_off = spdiags([-ones(N,1), -ones(N,1)], [-1, 1], N, N); % struttura blocchi -I
    A_sparse = kron(I_N, G) + kron(T_off, I_N);
    % Nota: se serve dividere per h^2, decommenta la riga sotto (non cambia i tempi)
    % A_sparse = (1/h^2) * A_sparse; 
    
    % --- 2. CONVERSIONE A MATRICE PIENA ---
    A_full = full(A_sparse);
    
    % Termine noto fittizio (vettore colonna di N^2 elementi)
    b = ones(N_tot, 1); 
    
    % --- Test Tempo: Matrice Piena ---
    tic; 
    % Usiamo l'operatore backslash (\) che è lo standard di MATLAB per risolvere
    % i sistemi lineari (sotto il cofano applica Gauss/LU)
    U_full = A_full \ b; 
    tempi_full(i) = toc; 
    
    % --- Test Tempo: Matrice Sparsa ---
    tic;
    U_sparse = A_sparse \ b;
    tempi_sparse(i) = toc;
    
    fprintf('n = %2d (Matrice %4dx%4d) | Tempo Piena: %6.4f s | Tempo Sparsa: %6.6f s\n', ...
            n, N_tot, N_tot, tempi_full(i), tempi_sparse(i));
end

% --- Plot dei risultati ---
figure('Name', 'Confronto Tempi 2D: Piena vs Sparsa', 'NumberTitle', 'off');

% Grafico Lineare
subplot(1,2,1);
plot(n_values, tempi_full, 'r-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'r'); hold on;
plot(n_values, tempi_sparse, 'b-s', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
grid on;
xlabel('Valore di n (Suddivisioni lato)');
ylabel('Tempo di calcolo (secondi)');
title('Tempi di Soluzione: Scala Lineare');
legend('Piena', 'Sparsa', 'Location', 'northwest');

% Grafico Log-Log (Complessità)
subplot(1,2,2);
loglog(n_values, tempi_full, 'r-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'r'); hold on;
loglog(n_values, tempi_sparse, 'b-s', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
grid on;
xlabel('Valore di n (Suddivisioni lato)');
ylabel('Tempo di calcolo (secondi)');
title('Tempi di Soluzione: Scala Logaritmica');
legend('Piena', 'Sparsa', 'Location', 'northwest');