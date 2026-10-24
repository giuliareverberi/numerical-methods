function [valore] = interpol(f, a, b, n)
x = linspace(a, b, n+1);
y = f(x);
x_grafica = linspace(a, b, 100);
l = length(x_grafica);
valore = zeros(1, l);
for k = 1:l
    base = zeros(1, n+1);
    for i = 1:(n+1)
        tnp = 1;
        for j = 1:(n+1)
            if i ~= j
                tnp = tnp * (x_grafica(k) - x(j)) / (x(i) - x(j));
            end
        end
    base(i) = tnp;
    end
    valore(k) = y * base';
end
end