%eulero esplicito
function [y, t] = eulero_espl(f, tspan, y0, N)
   m = length(y0);
   y = ones(N + 1, m);
   t0 = tspan(1);
   tf = tspan(2);
   dt = (tf - t0) / N;
   t = t0 : dt : tf;
   y(1,:) = y0;
   for n = 1 : N 
       y(n + 1, :) = y(n, :) + dt * f(t(n), y(n, :))';
   end
end