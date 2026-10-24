# Polynomial Interpolation & Initial Value Problem Solvers in MATLAB

MATLAB algorithms for functional approximation via Lagrange interpolation and numerical integration of Ordinary Differential Equations (ODEs).

## Features & Implementations

1. **Lagrange Polynomial Interpolation (`interpol.m`):**
   * Construction of Lagrange basis polynomials $L_i(x) = \prod_{j \neq i} \frac{x - x_j}{x_i - x_j}$.
   * Uniform grid evaluation over arbitrary closed intervals $[a, b]$.

2. **Functional Test Bench (`test_interpol.m`):**
   * Multi-case validation across smooth functions ($\sin(3x)$, $\log(x)$, $e^x$), Runge's phenomenon ($1/(1+x^2)$), non-differentiable target functions ($|x|$), and step functions ($\operatorname{sgn}(x)$).

3. **$L_\infty$ Error Convergence Analysis (`test_errore_interpol.m`):**
   * Empirical evaluation of maximum approximation error $\|f(x) - p_n(x)\|_\infty$ across increasing polynomial degrees $n$.

4. **Explicit Euler Method (`eulero_espl.m`):**
   * Vectorized $O(h)$ numerical integration scheme for systems of first-order Initial Value Problems (IVPs) $y' = f(t, y)$.

## Usage
Run `test_interpol.m` in MATLAB to generate comparative plots between original analytical functions and their interpolating polynomials.

## Author
* **Giulia Reverberi**
