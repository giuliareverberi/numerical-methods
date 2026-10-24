# Numerical Root-Finding Algorithms in MATLAB

A comprehensive MATLAB suite implementing fundamental numerical methods for finding roots of non-linear scalar equations and non-linear systems.

## Implemented Methods

1. **Scalar Root-Finding:**
   * **Bisection Method:** Guaranteed convergence for continuous functions with sign change.
   * **Newton-Raphson Method:** Quadratic convergence for simple roots.
   * **Secant Method:** Derivative-free linear-subquadratic convergence.
   * **Fixed-Point Iteration:** Parametric relaxation ($\lambda$) tuning.
2. **Hybrid Newton-Bisection Solver:** Combines Bisection robustness with Newton-Raphson speed.
3. **2D Non-Linear Systems:** Multivariable fixed-point iteration using relaxation parameters ($\omega$).
4. **Convergence Order Benchmarking:** Experimental error analysis comparing simple vs. multiple root convergence rates.

## Usage
Run the only file on MATLAB to reproduce convergence tables and execution logs.

## Author
* **Giulia Reverberi**
