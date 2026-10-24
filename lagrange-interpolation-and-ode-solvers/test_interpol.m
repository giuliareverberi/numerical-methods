%% Script di test per la funzione interpol
n = 5; % Grado del polinomio (puoi cambiarlo per vedere come varia)
x_grafica = linspace(0, 1, 100); % Verrà aggiornato nei singoli test

% --- CASO A ---
f_a = @(x) sin(3*x);
p_a = interpol(f_a, 0, 2*pi, n);
visualizza_test(f_a, p_a, 0, 2*pi, 'Test A: sin(3x)');

% --- CASO B ---
f_b = @(x) log(x);
p_b = interpol(f_b, 1, 1.5, n);
visualizza_test(f_b, p_b, 1, 1.5, 'Test B: log(x)');

% --- CASO C ---
f_c = @(x) exp(x);
p_c = interpol(f_c, 0, 1, n);
visualizza_test(f_c, p_c, 0, 1, 'Test C: e^x');

% --- CASO D ---
f_d = @(x) x.^5 + 3*x.^4 + 2*x.^3 - x.^2 - 5 + 1;
p_d = interpol(f_d, -5, 5, n);
visualizza_test(f_d, p_d, -5, 5, 'Test D: Polinomio');

% --- CASO E (Funzione di Runge) ---
f_e = @(x) 1./(1 + x.^2);
p_e = interpol(f_e, -5, 5, n);
visualizza_test(f_e, p_e, -5, 5, 'Test E: 1/(1+x^2)');

% --- CASO F ---
f_f = @(x) abs(x);
% Test range 1
p_f1 = interpol(f_f, 0, 5, n);
visualizza_test(f_f, p_f1, 0, 5, 'Test F1: |x| su [0,5]');
% Test range 2
p_f2 = interpol(f_f, -3, 2, n);
visualizza_test(f_f, p_f2, -3, 2, 'Test F2: |x| su [-3,2]');

% --- CASO G ---
f_g = @(x) sin(x.^2);
p_g = interpol(f_g, -5, 5, n);
visualizza_test(f_g, p_g, -5, 5, 'Test G: sin(x^2)');

% --- CASO H ---
f_h = @(x) abs(sin(x.^2));
p_h = interpol(f_h, -5, 5, n);
visualizza_test(f_h, p_h, -5, 5, 'Test H: |sin(x^2)|');

% --- CASO I ---
f_i = @(x) sign(x);
p_i = interpol(f_i, -5, 5, n);
visualizza_test(f_i, p_i, -5, 5, 'Test I: sgn(x)');

% Funzione ausiliaria per il plot (da mettere in fondo allo script)
function visualizza_test(f, p, a, b, titolo)
    figure;
    xx = linspace(a, b, 100);
    plot(xx, f(xx), 'r--', 'LineWidth', 1.5); hold on;
    plot(xx, p, 'b-', 'LineWidth', 1.5);
    title(titolo);
    legend('Funzione Originale', 'Polinomio Interpolante');
    grid on;
end