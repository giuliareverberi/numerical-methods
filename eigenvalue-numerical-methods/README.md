# Numerical Eigenvalue Solvers in MATLAB

MATLAB implementations of classical iterative methods for computing matrix eigenvalues and eigenvectors in Numerical Linear Algebra.

## Algorithms Included

1. **Power Method (`potenze.m`):** Computes the dominant eigenvalue and its associated eigenvector using iterative matrix-vector multiplication and normalization.
2. **Inverse Power Method (`potenze_inverse.m`):** Solves $A y = x$ at each iteration to compute the eigenvalue closest to zero (smallest magnitude).
3. **Iterative QR Algorithm (`q_r.m`):** Computes the complete spectrum of a square matrix using successive QR factorizations ($A_k = R_k Q_k$).

## Usage
Run `eigen_solvers.m` to execute tests on sample symmetric and non-symmetric matrices.

## Author
* **Giulia Reverberi**
