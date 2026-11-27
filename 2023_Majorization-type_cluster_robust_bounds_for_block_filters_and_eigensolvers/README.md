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
