%%
n_values = [5, 10, 20, 50]; % Proviamo diversi valori di n
figure; 
hold on;
grid on;
for k = 1:length(n_values)
    n = n_values(k);
    N = n - 1;       % Numero di incognite (punti interni)
    h = 1 / n;       % Spaziatura della griglia    

    % linspace(0, 1, n+1) crea n+1 punti equispaziati tra 0 e 1 (inclusi i bordi)
    x = linspace(0, 1, n+1)'; 
    x_int = x(2:end-1); % Seleziono solo i punti interni (da x_1 a x_N)
    
    % diag(vett, 0) mette il vettore sulla diagonale principale
    % diag(vett, 1) lo mette sulla sopradiagonale, diag(vett, -1) sulla sottodiagonale
    diag_princ = 2 * ones(N, 1);
    diag_sec = -1 * ones(N-1, 1);
    Ah = (1/h^2) * (diag(diag_princ, 0) + diag(diag_sec, 1) + diag(diag_sec, -1));
    % La forza è f(x) = -1 costante. 
    b = 10 * sin(3 * pi * x_int);     
    %Risoluzione del sistema lineare Ah * U = b
    U_int = Ah \ b; 
    U_completa = [0; U_int; 0];
    plot(x, U_completa, '.-', 'LineWidth', 1.5, 'DisplayName', ['n = ', num2str(n)]);
end
xlabel('Posizione x sul filo');
ylabel('Deformazione u(x)');
title('Profilo del filo elastico con f(x) = 10sin(3pix)');
legend('Location', 'best');

%All'aumentare di n (ovvero al diminuire del passo della griglia h=n1​), 
%la soluzione numerica (discreta) converge alla soluzione esatta (continua) 
% dell'equazione differenziale. Cioè prima è più spigolosa

%%
function U_int = risolvi_filo_sparso(N, h, b)
    % Questa funzione risolve il sistema per il filo elastico
    % sfruttando la struttura tridiagonale 
    % Input: N (numero di incognite), h (passo griglia), b (vettore termini noti)
    % Output: U_int (vettore soluzione nei punti interni)
    d = (2 / h^2) * ones(N, 1);    % Diagonale principale Ah
    a = (-1 / h^2) * ones(N-1, 1); % Sottodiagonale Ah
    c = (-1 / h^2) * ones(N-1, 1); % Sopradiagonale Ah
    l = zeros(N-1, 1);
    u = zeros(N, 1);
    y = zeros(N, 1);
    U_int = zeros(N, 1);

    % --- FASE 1: Fattorizzazione LU ---
    u(1) = d(1);
    for i = 2:N
        l(i-1) = a(i-1) / u(i-1); 
        u(i) = d(i) - l(i-1) * c(i-1);
    end

    % --- FASE 2: Sostituzione in avanti (Ly = b) ---
    y(1) = b(1);
    for i = 2:N
        y(i) = b(i) - l(i-1) * y(i-1);
    end

    % --- FASE 3: Sostituzione all'indietro (U * U_int = y) ---
    U_int(N) = y(N) / u(N);
    for i = N-1:-1:1
        U_int(i) = (y(i) - c(i) * U_int(i+1)) / u(i);
    end
end

%test 

n = 876;             
N = n - 1;         
h = 1 / n;         
b = -1 * ones(N, 1); 
U_sparso = risolvi_filo_sparso(N, h, b);
disp('Soluzione con algoritmo ottimizzato (sparso):');
disp(U_sparso);

diag_princ = 2 * ones(N, 1);
diag_sec = -1 * ones(N-1, 1);
Ah = (1/h^2) * (diag(diag_princ, 0) + diag(diag_sec, 1) + diag(diag_sec, -1));
U_denso = Ah \ b;
disp('Soluzione con backslash di MATLAB (matrice piena):');
disp(U_denso);
% Se l'algoritmo è corretto, la differenza tra le due soluzioni
% deve essere praticamente zero (a meno di arrotondamenti di macchina)
errore = norm(U_sparso - U_denso, inf);
disp(['Differenza massima tra i due metodi: ', num2str(errore)]);