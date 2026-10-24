# Gram-Schmidt Orthogonalization & Numerical Stability in MATLAB

This repository implements the Classical Gram-Schmidt (CGS) and Modified Gram-Schmidt (MGS) algorithms for QR decomposition, highlighting the floating-point numerical stability differences between both formulations.

## Mathematical Overview

* **Classical Gram-Schmidt (CGS):** Computes projections against uncorrected vectors, susceptible to loss of orthogonality under finite-precision arithmetic $\mathcal{O}(\epsilon \kappa(A))$.
* **Modified Gram-Schmidt (MGS):** Replaces projections with orthogonalization against intermediate updated vectors, significantly improving numerical orthogonality.

## Repository Contents

* `gram_schmidt.m`: Implementation of the Classical Gram-Schmidt algorithm.
* `gram_schmidt_modificato.m`: Numerically stable Modified Gram-Schmidt implementation.

## Usage
Open MATLAB and run the decomposition on a target matrix $A$

## Author
* **Giulia Reverberi**
