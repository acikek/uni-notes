#import "lecture-template.typ": *

#set document(
  title: "MATH 108A Midterm 1 Exercises",
  date: datetime(day: 8, month: 2, year: 2026),
)

#show: template

// 13-01-26

#exercise[
  Prove:

  + Any field is a vector space over itself.

  + For any field $FF$, the set $FF^n$ is a vector space over $FF$.

  + $CC$ is a vector space over $RR$.
]

#exercise[
  Define multiplication on $FF^S$ as follows:

  $
    (f dot g)(s) = f(s) dot g(s) thick forall s in S.
  $

  Determine whether $FF^S$ is a field, and justify your answer.
]

#exercise[
  Suppose $W$ is a subset of $FF^4$ where

  $
    W = { \(x_1, x_2, x_3, x_4\) in FF^4 : x_3 = 5x_4 }.
  $

  Show that $W$ is a subspace of $FF^4$.
]

#exercise[
  Prove that the set of _continuous_ real functions is a subspace of the set of all  real functions.
]

#exercise[
  Prove that the intersection of an arbitrary number of subspaces, not just finitely many, is also a subspace.
]

#exercise[
  Let $S$ be the set defined as

  $
    S := { mat(a, a; a, b) : a, b in RR }.
  $

  + Prove that $S$ is a subspace of $M_(2 times 2)(FF)$.

  + Give a basis for $S$.
]

#pagebreak()

#exercise[
  Consider $S = { (x, y, z) in RR^3 : x + y + z = 0 }$.

  + Show that $S$ is a subspace of $RR^3$.

  + Find a basis for $S$.
]

#exercise[
  Show that $beta = { 1 }$ is a basis for the vector space $CC(CC)$, then deduce that the dimension of this space is $1$.
]

#exercise[
  Prove that $beta_m := { 1, x, x^2, ..., x^m }$ is a basis for $P_m (FF)$.
]

#exercise[
  Let $S_(3 times 3)$ be the set of all $3 times 3$ real symmetric matrices. Then, we define a basis:

  $
    beta_(3 times 3) = { mat(1, 0, 0; 0, 0, 0; 0, 0, 0), mat(0, 1, 0; 1, 0, 0; 0, 0, 0), mat(0, 0, 1; 0, 0, 0; 1, 0, 0), mat(0, 0, 0; 0, 1, 0; 0, 0, 0), mat(0, 0, 0; 0, 0, 1; 0, 1, 0), mat(0, 0, 0; 0, 0, 0; 0, 0, 1) }
  $

  Verify that $beta_(3 times 3)$ is a basis by showing that it spans $S_(3 times 3)$ while also being linearly independent.
]

#exercise[
  + Prove $S$, the set of $n times n$ real diagram matrices, is a subspace of $M_(n times n)(RR)$.

  + Show that $beta$ is a basis for $S$, where

    $
      beta = { E^(i i) : 1 <= i <= n } = { E^(11), E^(22), ..., E^(n n) }.
    $
]

#exercise[
  Suppose $S$ is a subspace of $RR^5$ with a basis $beta$ such that

  $
    S = { \(x_1, x_2, x_3, x_4, x_5\) in RR^5 : x_1 + x_3 + x_5 = 0, thick x_2 = x_4 }, \
    beta = { (0, 1, 0, 1, 0), (1, 0, -1, 0, 0), (0, 0, -1, 0, 1) }.
  $

  We can extend $beta$ to a basis for $RR^5$. One such basis is

  $
    gamma = beta union { (0, 0, 0, 1, 0), (0, 0, 1, 0, 0) }.
  $

  Prove $gamma$ is a basis for $RR^5$.
]
