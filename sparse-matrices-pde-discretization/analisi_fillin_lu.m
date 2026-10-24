%% PARTE 1: ANALISI DELLA SPARSITÀ NEL CASO 1D (FILO ELASTICO)
n = 20; 
N = n - 1;
h = 1 / n;

% 1. Costruzione della matrice Ah tridiagonale in formato sparso
e = ones(N, 1);
A_h = (1/h^2) * spdiags([-e, 2*e, -e], [-1, 0, 1], N, N);

% 2. Calcolo della fattorizzazione LU senza pivoting
[L, U] = lu(A_h);

% 3. Visualizzazione della struttura di sparsita con spy
figure('Name', 'Analisi Sparsità LU 1D', 'NumberTitle', 'off');

subplot(1, 3, 1);
spy(A_h);
title('A_h (Tridiagonale)');

subplot(1, 3, 2);
spy(L);
title('L (Bidiagonale Inf.)');

subplot(1, 3, 3);
spy(U);
title('U (Bidiagonale Sup.)');

%% PARTE 2: ANALISI DEL FENOMENO DI FILL-IN NEL CASO 2D (MEMBRANA / POISSON)
n = 15; 
N = n - 1;

% 1. Costruzione della matrice di Poisson 2D in formato sparso
A_h = gallery('poisson', N);

% 2. Calcolo della fattorizzazione LU
[L, U] = lu(A_h);

% 3. Visualizzazione della perdita di sparsità (Fill-in)
figure('Name', 'Analisi Sparsità LU 2D (Fenomeno del Fill-in)', 'NumberTitle', 'off');

subplot(1, 3, 1);
spy(A_h);
title('A_h (Pentadiagonale)');

subplot(1, 3, 2);
spy(L);
title('L (Banda riempita)');

subplot(1, 3, 3);
spy(U);
title('U (Banda riempita)');

% 4. Valutazione quantitativa dell'incremento di elementi non nulli
disp('--- Risultati Analisi Fill-in (Membrana 2D) ---');
elementi_Ah = nnz(A_h);
elementi_L = nnz(L);
elementi_U = nnz(U);

fprintf('Elementi non nulli in A_h: %d\n', elementi_Ah);
fprintf('Elementi non nulli in L:   %d\n', elementi_L);
fprintf('Elementi non nulli in U:   %d\n', elementi_U);
fprintf('I fattori L e U contengono circa %.1f volte gli elementi di A_h!\n', ...
        (elementi_L + elementi_U) / elementi_Ah);
disp('Dimostrazione empirica: nel caso 2D la struttura sparsa viene persa nei fattori LU.');

