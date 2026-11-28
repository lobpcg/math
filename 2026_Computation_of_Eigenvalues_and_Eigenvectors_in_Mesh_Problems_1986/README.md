# Computation of Eigenvalues and Eigenvectors in Mesh Problems: Algorithms and Error Estimates

English translation (2026) of the 1986 Russian monograph:  
**А. В. Князев**, *Вычисление собственных значений и векторов в сеточных задачах: алгоритмы и оценки погрешности*, Отдел вычислительной математики АН СССР, Москва, 1986.
**A.V. Kni︠a︡zev** (**А. В. Князев**), *Vychislenie sobstvennykh znacheniĭ i vektorov v setochnykh zadachakh : algoritmy i ot︠s︡enki pogreshnosti* (*Вычисление собственных значений и векторов в сеточных задачах: алгоритмы и оценки погрешности*), Department of Numerical Mathematics, USSR Academy of Sciences (Отдел вычислительной математики АН СССР), Moscow, 1986 ([LCCN 87157255](https://loc.gov)).

## Abstract
The work studies solution methods for symmetric algebraic eigenvalue problems from mesh discretizations, establishing convergence rate estimates for vector and subspace iterations (including auxiliary operator variants), asymptotic properties, and error estimates for the Temple–Lehmann and Rayleigh–Ritz methods, alongside an extensive bibliography.

Analyzed k_translation_en.toc:L1-38

Here is a ready-to-paste `## Contents` section for the GitHub `README.md` (remove any row for optional files you chose not to upload):

## Contents

| File | Description |
| --- | --- |
| [`k_translation_en.pdf`](k_translation_en.pdf) | Compiled English translation (129 pages, XeLaTeX). |
| [`k_translation_en.tex`](k_translation_en.tex) | Full LaTeX source (XeLaTeX, TikZ figures; mathematical misprints from the 1986 original are preserved verbatim and documented in `% [math note: ...]` comments). |
| [`k_references.bib`](k_references.bib) | Complete BibTeX database (679 entries; 6 duplicates suppressed in the English edition via `en_skip = {1}`, leaving 673 printed references with 466 DOIs and 193 verified URLs). |
| [`k_monograph_en.bst`](k_monograph_en.bst) | Custom `natbib` BibTeX style for the English edition (handles clickable DOIs/URLs and `en_skip` deduplication). |
| [`k_translation_en.bbl`](k_translation_en.bbl) | Pre-built bibliography for arXiv submission (regenerated from `k_references.bib` and `k_monograph_en.bst`). |

### Building from source

```bash
xelatex k_translation_en
bibtex k_translation_en
xelatex k_translation_en
xelatex k_translation_en
```
```

## Citation

If you reference this work, please cite the 2026 English translation together with the original 1986 Russian monograph:

```bibtex
@misc{Knyazev2026_1986mesh,
  author        = {Knyazev, Andrew V.},
  title         = {Computation of Eigenvalues and Eigenvectors in Mesh Problems: Algorithms and Error Estimates (English translation of the 1986 Russian monograph)},
  year          = {2026},
  eprint        = {2611.XXXXX},
  archivePrefix = {arXiv},
  primaryClass  = {math.NA},
  related       = {Knyazev:1986:CEE},
  relatedtype   = {translationof},
  note          = {English translation of the original Russian monograph: A. V. Knyazev, "Vychislenie sobstvennykh znachenii i vektorov v setochnykh zadachakh: algoritmy i otsenki pogreshnosti" "Вычисление собственных значений и векторов в сеточных задачах: алгоритмы и оценки погрешности," Dept. of Numerical Mathematics, USSR Academy of Sciences (OVM AN SSSR), Moscow, 1986, LCCN 87157255. Digitized and translated with AI assistance and verified by the author. Posted with permission of the Marchuk Institute of Numerical Mathematics RAS (INM RAS). LaTeX source available at https://github.com/lobpcg/math/blob/main/2026_Computation_of_Eigenvalues_and_Eigenvectors_in_Mesh_Problems_1986},
  abstract      = {This monograph is an authorized English translation of the author's 1986 Russian book published by the Department of Numerical Mathematics of the USSR Academy of Sciences (Moscow, 1986, LCCN 87157255). The work studies solution methods for symmetric algebraic eigenvalue problems arising from mesh discretizations, establishing convergence rate estimates for vector and subspace iterations (including auxiliary operator variants), asymptotic properties, and error estimates for the Temple-Lehmann and Rayleigh-Ritz methods, alongside an extensive bibliography.}
}

@book{Knyazev:1986:VSZ,
  author    = {A.V. Kni︠a︡zev},
  title     = {Vychislenie sobstvennykh znacheniĭ i vektorov v setochnykh zadachakh : algoritmy i ot︠s︡enki pogreshnosti},
  publisher = {Department of Numerical Mathematics, USSR Academy of Sciences},
  address   = {Moscow},
  year      = {1986},
  lccn      = {87157255},
  language  = {Russian},
  note      = {Original Cyrillic: А. В. Князев, Вычисление собственных значений и векторов в сеточных задачах: алгоритмы и оценки погрешности. English title: Computation of Eigenvalues and Eigenvectors in Mesh Problems: Algorithms and Error Estimates},
  url       = {https://loc.gov}
}
or
@book{Knyazev:1986:CEE,
  author    = {A. V. Knyazev},
  title     = {Computation of Eigenvalues and Eigenvectors for Mesh Problems: Algorithms and Error Estimates},
  publisher = {Department of Numerical Mathematics, USSR Academy of Sciences},
  address   = {Moscow},
  year      = {1986},
  language  = {Russian},
  note      = {In Russian. Original title: Вычисление собственных значений и векторов в сеточных задачах: алгоритмы и оценки погрешности},
  url       = {https://www.researchgate.net/publication/245739700_Computation_of_eigenvalues_and_eigenvectors_for_mesh_problems_algorithms_and_error_estimates}
}
```

*(Replace `2611.XXXXX` with your assigned arXiv identifier once posted.)*

## Copyright and License
* **Original Russian Edition:** Copyright © 1986 Department of Numerical Mathematics, USSR Academy of Sciences (Отдел вычислительной математики АН СССР).
* **English Translation & LaTeX Edition (2026):** Prepared and hosted for non-commercial scholarly and academic reading with permission from the Marchuk Institute of Numerical Mathematics of the Russian Academy of Sciences (INM RAS). All rights reserved; commercial use or redistribution requires permission.
