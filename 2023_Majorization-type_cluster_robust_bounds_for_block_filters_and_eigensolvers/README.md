Numerical examples for the paper "Majorization-type cluster robust bounds for block filters and eigensolvers"
https://arxiv.org/abs/2201.04517
https://epubs.siam.org/doi/abs/10.1137/23M1551729

`example1.m` illustrates several bound curves for the block Chebyshev and Lanczos methods; see Subsection 5.1. The novel majorization bounds (4.4) and (4.5) with tuplewise convergence factors are more accurate than the bounds (4.6) and (4.7) with scalar convergence factors.

`example2.m` is a further numerical comparison where the relevant eigenvalues are clustered; see Subsection 5.2. 

`thm3_5.m` checks the validity of Theorem 3.5 concerning the abstract block iteration (1.2). The contained bound deals with normal matrices and is more general than (4.4).

`thm3_8.m` is a similar validity check for Theorem 3.8 with a more general form of (4.5).

Dependencies:

`majle.m` is a tool for checking majorization relations; available in https://www.mathworks.com/matlabcentral/fileexchange/26962-majorization-check .

`subspacea.m` is a tool for computing principal angles; available in https://www.mathworks.com/matlabcentral/fileexchange/55-subspacea-m .

## Citation

If you use these numerical examples or reference the results in your research, please cite the published paper:

```bibtex
@article{zhou2023sharp,
  title={Sharp Majorization-Type Cluster Robust Bounds for Block Filters and Eigensolvers},
  author={Zhou, Ming and Argentati, Merico E. and Knyazev, Andrew V. and Neymeyr, Klaus},
  journal={SIAM Journal on Matrix Analysis and Applications},
  volume={44},
  number={4},
  pages={1852--1878},
  year={2023},
  doi={10.1137/23M1551729},
  url={https://siam.org}
}
```

### Preprint & Software

* **arXiv Preprint:** M. Zhou, M. E. Argentati, A. V. Knyazev, and K. Neymeyr, *"Majorization-type cluster robust bounds for block filters and eigensolvers,"* [arXiv:2201.04517](https://arxiv.org/abs/2201.04517), 2022.
* **Code Repository:** [https://github.com/lobpcg/math/tree/main/2023_Majorization-type_cluster_robust_bounds_for_block_filters_and_eigensolvers](https://github.com/lobpcg/math/tree/main/2023_Majorization-type_cluster_robust_bounds_for_block_filters_and_eigensolvers)
