# constant-rank-quadratic-twists
Magma code for constructing and verifying rank-1 quadratic twist families via Frey’s table and Waldspurger’s theorem.

# Constant-Rank Quadratic Twist Families via Frey’s Table and Waldspurger’s Theorem

This repository contains the Magma code used to support the computational examples appearing in the paper

**Seungjae Lee and Ilker Inam**
*Constant-Rank Quadratic Twist Families via Frey’s Table and Waldspurger’s Theorem*

---

## Authors

* **Seungjae Lee**
  Kyungpook National University, Institute for Mathematical Convergence, Daegu, South Korea
  [seungjae@knu.ac.kr](mailto:seungjae@knu.ac.kr)

* **Ilker Inam**
  Bilecik Seyh Edebali University, Department of Mathematics, 11200 Bilecik, Turkey
  [ilker.inam@gmail.com](mailto:ilker.inam@gmail.com)
  [ilker.inam@bilecik.edu.tr](mailto:ilker.inam@bilecik.edu.tr)

---

## Purpose of this repository

The main goal of this repository is computational reproducibility. In particular, it provides:

* the list of selected Frey elliptic curves considered in the paper,
* the corresponding square-free twist parameters (d_0) appearing in Table 1,
* Magma scripts for checking the conductor, root number, and analytic rank of the quadratic twists,
* scripts for exploring additional square-free twists in the same congruence classes.

This repository is intended to support the computational aspect of the paper.
It does **not** replace the theoretical arguments in the article.

---

## Repository structure

```
constant-rank-quadratic-twists/
├── README.md
├── LICENSE
├── CITATION.cff
├── magma/
│   ├── frey_table_data.m
│   ├── verify_frey_table.m
│   ├── search_rank1_family.m
│   └── utilities.m
├── output/
│   └── .gitkeep
└── paper/
    └── LI-Paper-2026.pdf
```

---

## Software requirements

The scripts were written for Magma and assume that elliptic curves can be accessed via their Cremona labels, for example:

```
E := EllipticCurve("11a1");
```

If your Magma installation uses a different interface, you may need to adapt this line.

---

## How to verify Table 1

From within Magma, run:

```
load "magma/verify_frey_table.m";
```

This script checks each curve in the table and computes the analytic rank of each listed quadratic twist.

---

## How to search for additional twists

To search for further square-free twists in the same congruence classes modulo (4N), run:

```
load "magma/search_rank1_family.m";
```

This script searches through a prescribed range and records twists with analytic rank (1).

---

## Notes

The phrase “Verified in Magma” in Table 1 means that the listed examples were checked computationally using the scripts in this repository.

---

## Citation

If you use these computations, please cite the associated paper.
