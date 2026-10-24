%%
%es 1
function [x] = bisezione(f, a, b)
    if f(a) * f(b) > 0
        error('f(a) e f(b) devono avere segni opposti!');
    end
    massimo = 100;
    tolleranza = 1e-6;
    for k = 1:massimo
        c = (a + b) / 2;
        x = c;
        if abs(f(c)) < tolleranza
            return;
        end
        if f(a)*f(c) < 0
            b = c;
        end
        if f(a)*f(c) >= 0
            a = c;
        end
    end
end


f = @(x) x.^3 - exp(x) ;
disp(bisezione(f, 3, 5))

%%
%es 2
function [x, x_hist] = newton(f, df, x0, tol, max_iter)    
    x_hist = [];
    x = x0; 
    for iter = 1:max_iter
        fx = f(x);
        dfx = df(x);
        if dfx == 0
            error('Derivata nulla in x = %f: fallimento', x);
        end

        x_nuovo = x - (fx / dfx);
        x_hist = [x_hist; x_nuovo];
        if abs(x_nuovo - x) < tol
            x = x_nuovo; 
            return;      
        end
        x = x_nuovo;
    end
    warning('Raggiunto il numero massimo di iterazioni (%d) senza convergenza.', max_iter);
end

f = @(x) x.^3 - exp(x) ;
df = @(x) 3*x.^2 - exp(x);
tolleranza = 1e-6;
max_iter = 100;
x0 = 4;
disp(newton(f, df, x0, tolleranza, max_iter))

%%
%es 3: metodo secanti
function [x, x_hist] = secanti(f, x0, x1, tol, massimo)
    x_hist = []; 
    for k = 1:massimo
        fx0 = f(x0);
        fx1 = f(x1);
        if (fx1 - fx0) == 0
            error('Divisione per zero nel metodo delle secanti.');
        end
        x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0);
        x_hist = [x_hist; x2]; 
        if abs(x2 - x1) < tol
            x = x2;
            return;
        end
        x0 = x1;
        x1 = x2;
    end
    x = x2;
end

f = @(x) x.^3 - exp(x) ;
tolleranza = 1e-6;
max_iter = 100;
x0 = 4;
x1 = 5;
disp(secanti(f, x0, x1, tolleranza, max_iter))

%%
%es 3
n_valori = [2, 10, 100]; 
tol = 1e-10;    
massimo = 50;   
for n = n_valori
    fprintf('\n========================================================\n');
    fprintf(' Confronto per f(x) = x^2 - %d = 0  (Radice esatta: %g)\n', n, sqrt(n));
    fprintf('========================================================\n');

    f = @(x) x.^2 - n;
    df = @(x) 2*x;
    radice_esatta = sqrt(n);
    
    x0_newton = n/2; 
    x0_sec = n/2;
    x1_sec = (n/2) + 0.1; 
    [~, hist_newton] = newton(f, df, x0_newton, tol, massimo);
    [~, hist_sec]    = secanti(f, x0_sec, x1_sec, tol, massimo);
    err_newton = abs(hist_newton - radice_esatta);
    err_sec    = abs(hist_sec - radice_esatta);
    iterazioni_max = max(length(err_newton), length(err_sec));
    
    % Intestazione Tabella
    fprintf('  k  |  Errore Secanti      |  Errore Newton\n');
    fprintf('--------------------------------------------------------\n');
    
    % Stampa riga per riga
    for k = 1:iterazioni_max
        % Se il metodo delle secanti ha ancora iterazioni da stampare:
        if k <= length(err_sec)
            e_sec = sprintf('%1.4e', err_sec(k));
        else
            e_sec = '      -       '; % Ha già finito di convergere
        end
        
        % Se il metodo di Newton ha ancora iterazioni da stampare:
        if k <= length(err_newton)
            e_new = sprintf('%1.4e', err_newton(k));
        else
            e_new = '      -       '; % Ha già finito di convergere
        end
        
        % Stampa la riga della tabella
        fprintf(' %2d  |  %s       |  %s\n', k, e_sec, e_new);
    end
    fprintf('\n');
end

%%
%es 4: metodo punto fisso

function [x , k] = puntofisso(f, lambda, x0, tol, max_iter)
    g = @(x) lambda * f(x) + x; 
    x = x0;
    for k = 1:max_iter
        x_nuovo = g(x);
        if abs(x_nuovo - x) < tol
            x = x_nuovo;
            return; 
        end
        x = x_nuovo; 
    end
    warning('Il metodo del punto fisso non ha raggiunto la tolleranza richiesta (lambda = %f).', lambda);
end

f = @(x) x.^3 - exp(x) ;
tolleranza = 1e-6;
max_iter = 100;
x0 = 4;
lambda = 0.00000001;
disp(puntofisso(f, lambda, x0, tolleranza, max_iter))

%%
%es 4
f = @(x) x.^2 - 3;
df = @(x) 2*x; 
x0 = 2.0; 
tol = 1e-6;
max_iter = 1000;
valori_lambda = [-0.05, -0.1, -0.2, -0.25, -0.3, -0.39];

fprintf('Ricerca dello zero di f(x) = x^2 - 3 con Punto Fisso\n');
fprintf('Punto di partenza x0 = %.2f\n', x0);
fprintf('------------------------------------------------------\n');
fprintf('  Lambda    |  Iterazioni  |  Soluzione stimata\n');
fprintf('------------------------------------------------------\n');

for i = 1:length(valori_lambda)
    lam = valori_lambda(i);
    [soluzione, iterazioni] = puntofisso(f, lam, x0, tol, max_iter);
    if iterazioni < max_iter
        fprintf(' %8.2f  | %6d       |  %.8f\n', lam, iterazioni, soluzione);
    else
        fprintf(' %8.2f  | Non conv.    |  %s\n', lam, '---');
    end
end
fprintf('------------------------------------------------------\n');

%%
%es 5

f = @(x) exp(x) - 1;       % radice semplice in y=0
df = @(x) exp(x);
g = @(x) x.^2;             % Radice doppia in y=0
dg = @(x) 2*x;
x0 = 1;                    
tol = 1e-12;              
max_it = 50;               
y_true = 0;      

fprintf('--- TEST 1: RADICE SEMPLICE (f(x) = e^x - 1) ---\n');
x = x0;
for k = 1:max_it
    x_new = x - f(x)/df(x);
    err = abs(x_new - y_true);
    fprintf('Iterazione %d: Errore = %.2e\n', k, err);
    
    if err < tol, break; end
    x = x_new;
end

fprintf('\n--- TEST 2: RADICE DOPPIA (g(x) = x^2) ---\n');
x = x0;
for k = 1:max_it
    x_new = x - g(x)/dg(x);
    err = abs(x_new - y_true);
    fprintf('Iterazione %d: Errore = %.2e\n', k, err);
    
    if err < tol, break; end
    x = x_new;
end

%%
%es 6
f = @(x) x.^3 - 2*x + 2; 
df = @(x) 3*x.^2 - 2;
a = -3;
b = 1;  
tol = 1e-10;
max_it = 100;
if f(a) * f(b) > 0
    error('La funzione deve cambiare segno nell''intervallo');
end

x = (a + b) / 2; 
fprintf('it |      x_k       |    f(x_k)    |  Metodo\n');
fprintf('-----------------------------------------------\n');

for k = 1:max_it
    f_val = f(x);
    df_val = df(x);
    if k > 1
    end
    if abs(f_val) < tol || (b - a) < tol
        fprintf('%2d | %12.8f | %10.2e | Terminato (Tol raggiunta)\n', k, x, f_val);
        break;
    end
    
    newton_ok = false;
    if df_val ~= 0
        x_newton = x - f_val / df_val;
        
        if x_newton > a && x_newton < b
            x = x_newton;
            metodo_usato = 'Newton   ';
            newton_ok = true;
        end
    end
    
    if ~newton_ok
        c = (a + b) / 2;
        if f(a) * f(c) < 0
            b = c;
        else
            a = c;
        end
        
        x = (a + b) / 2;
        metodo_usato = 'Bisezione';
    end
    
    fprintf('%2d | %12.8f | %10.2e | %s\n', k, x, f_val, metodo_usato);
end

%%
%es 7 

tol = 1e-10;
max_it = 100;
omega = 0.5; % Fattore di rilassamento per garantire la convergenza
x = 0.1; 
y = 0.1;
fprintf('it |      x         |      y         |    Errore\n');
fprintf('---------------------------------------------------\n');

for k = 1:max_it
    x_old = x;
    y_old = y;
    
    % Trasformazione di punto fisso con rilassamento
    % Cerchiamo la soluzione nel primo quadrante (y > 0)
    g1 = 1 - sqrt(1 - y_old^2);
    g2 = sqrt(1 - x_old^2);
    
    x = (1 - omega) * x_old + omega * g1;
    y = (1 - omega) * y_old + omega * g2;
    
    err = norm([x - x_old, y - y_old]);
    fprintf('%2d | %12.8f | %12.8f | %10.2e\n', k, x, y, err);
    
    if err < tol
        fprintf('---------------------------------------------------\n');
        fprintf('Convergenza raggiunta in %d iterazioni.\n', k);
        fprintf('Punto di intersezione: (%.4f, %.4f)\n', x, y);
        break;
    end
end


