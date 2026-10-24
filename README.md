# Numerical Methods in MATLAB

A collection of MATLAB implementations of classical numerical methods, developed for the Numerical Methods course. Each folder is a self-contained project covering one topic: root finding, interpolation and ODEs, iterative solvers, orthogonalization, eigenvalue computation, sparse matrices and PDE discretization, and image compression.

## Repository contents

```
numerical-methods/
├── numerical-root-finding-algorithms/
│   └── radice.m
├── lagrange-interpolation-and-ode-solvers/
│   ├── interpol.m
│   ├── test_interpol.m
│   ├── test_errore_interpol.m
│   └── eulero_espl.m
├── qr-orthogonalization-gram-schmidt/
│   ├── gram_schmidt.m
│   └── gram_schmidt_modificato.m
├── eigenvalue-numerical-methods/
│   └── autovalori.m
├── sparse-matrices-pde-discretization/
    ├── analisi_fillin_lu.m
    ├── filo_elastico.m
    └── membrana_elastica_2D.m

```

## Projects

### 1. Numerical Root-Finding Algorithms (`numerical-root-finding-algorithms`)
Methods for finding roots of nonlinear scalar equations and nonlinear systems.
* **Bisection:** guaranteed convergence for continuous functions with a sign change.
* **Newton-Raphson:** quadratic convergence for simple roots.
* **Secant method:** derivative-free, with superlinear convergence (order ≈ 1.618) for simple roots.
* **Fixed-point iteration:** tuning of a relaxation parameter (λ).
* **Hybrid Newton-Bisection solver:** combines the robustness of bisection with the speed of Newton-Raphson.
* **2D nonlinear systems:** multivariable fixed-point iteration with relaxation parameters (ω).
* **Convergence order estimation:** experimental error tables and estimated order for Newton on a simple root (≈ 2) and a double root (≈ 1).

### 2. Lagrange Interpolation & ODE Solvers (`lagrange-interpolation-and-ode-solvers`)
* **Lagrange interpolation (`interpol.m`):** builds the Lagrange basis polynomials and evaluates them on a uniform grid over a closed interval [a, b].
* **Test bench (`test_interpol.m`):** tests on smooth functions (sin(3x), log(x), eˣ), Runge's example 1/(1+x²), the non-differentiable |x| and the step function sgn(x).
* **Error convergence (`test_errore_interpol.m`):** maximum approximation error as the polynomial degree increases.
* **Explicit Euler method (`eulero_espl.m`):** vectorized O(h) solver for systems of first-order initial value problems.

### 3. QR Orthogonalization: Gram-Schmidt (`qr-orthogonalization-gram-schmidt`)
* **Classical Gram-Schmidt (`gram_schmidt.m`):** projects against the original vectors; in floating-point arithmetic it can lose orthogonality severely on ill-conditioned matrices.
* **Modified Gram-Schmidt (`gram_schmidt_modificato.m`):** projects against the updated vectors, which gives much better numerical orthogonality.

### 4. Eigenvalue Numerical Methods (`eigenvalue-numerical-methods`)
Iterative methods for eigenvalues and eigenvectors.
* **Power method:** dominant eigenvalue and eigenvector.
* **Inverse power method:** eigenvalue of smallest magnitude.
* **Iterative QR algorithm:** full spectrum of a square matrix through successive QR factorizations.

### 5. Sparse Matrices & PDE Discretization (`sparse-matrices-pde-discretization`)
* **1D elastic wire (`filo_elastico.m`):** boundary value problem solved with a tridiagonal LU solver, compared against MATLAB's dense backslash.
* **2D elastic membrane / Poisson equation (`membrana_elastica_2D.m`):** block matrices built with `kron` and sparse diagonals with `spdiags`.
* **LU fill-in analysis (`analisi_fillin_lu.m`):** visualization of fill-in with `spy`, and timing comparison between dense and sparse solvers.

## Usage
1. Clone the repository and open MATLAB in the folder of the project you want to run.
2. Run the main script of that project (e.g. `radice.m`, `test_interpol.m``). 

**Requirements:** MATLAB 

## Author
* **Giulia Reverberi**
