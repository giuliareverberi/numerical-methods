%% TEST ERRORE CON FUNZIONE ORIGINALE
f = @(x) exp(x); % Funzione test
a_intervallo = 0; 
b_intervallo = 1;
n_valori = 1:15; % Testiamo da n=1 a n=15
norme_infinito = zeros(size(n_valori));

fprintf('n \t | \t Norma Infinito (sui 100 punti di test)\n');
fprintf('--------------------------------------------------\n');

for i = 1:length(n_valori)
    n = n_valori(i);
    
    % Chiamiamo la tua funzione originale
    % Essa restituisce 'valore' calcolato su 100 punti tra a e b
    p_interp = interpol(f, a_intervallo, b_intervallo, n);
    
    % Generiamo gli stessi 100 punti che la tua funzione crea internamente
    % per poter calcolare l'errore (f_reale - p_interp)
    x_interni = linspace(a_intervallo, b_intervallo, 100);
    y_reale = f(x_interni);
    
    % Calcolo Norma Infinito: max |f(x) - p(x)|
    errore_vett = abs(y_reale - p_interp);
    norme_infinito(i) = max(errore_vett);
    
    fprintf('%d \t | \t %e\n', n, norme_infinito(i));
end

%% Grafico dell'errore all'aumentare di n
figure;
semilogy(n_valori, norme_infinito, '-sb', 'LineWidth', 2, 'MarkerFaceColor', 'b');
grid on;
xlabel('Grado del polinomio (n)');
ylabel('Errore Massimo (Norma Infinito)');
title('Grafico dell''errore all''aumentare dei nodi');