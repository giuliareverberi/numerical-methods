# PDE Discretization and Sparse Matrix Solver in MATLAB

This repository presents numerical solutions for 1D (elastic wire) and 2D (elastic membrane/Poisson equation) boundary value problems, focusing on sparse matrix structures, Kronecker product assembly, and linear solver efficiency.

## Features & Implementations

1. **1D Elastic Wire Model:**
   * Custom $O(n)$ tridiagonal LU solver (`risolvi_filo_sparso.m`) compared against standard dense matrix backslash solvers.
2. **2D Poisson Problem (Elastic Membrane):**
   * High-dimensional block matrix construction using Kronecker products (`kron`) and sparse diagonals (`spdiags`).
3. **Sparse vs. Dense Performance Benchmarking:**
   * Computation time comparisons showing $O(n^3)$ scaling for dense LU vs. linear/sub-cubic scaling for sparse solvers.
4. **LU Fill-in Analysis:**
   * Visual inspection of matrix sparsity loss during LU decomposition using MATLAB's `spy` function.

## Usage
Run the files in MATLAB to generate performance plots and fill-in sparsity diagrams.

## Author
* **Giulia Reverberi**
