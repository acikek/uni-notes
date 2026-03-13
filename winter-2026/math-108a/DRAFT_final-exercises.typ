#import "lecture-template.typ": *

#set document(
  title: "MATH 108A Final Exam Exercises",
  date: datetime(day: 8, month: 2, year: 2026),
)

#show: template

#exercise[
  Define the transformation $T_theta : RR^2 -> RR^2$ by

  $
    T_theta (x, y) = (x cos theta - y sin theta, y cos theta + x sin theta).
  $

  We call  $T_theta$ a *rotation*.

  + Prove that $T_theta$ is linear.

  + Find the matrix representation of $T_theta$.
]

#exercise[
  The transformation $T : RR^2 -> RR^2$ where $(x, y) |-> (x, 0)$ is known as the *orthogonal projection* onto the $x$-axis.

  + Prove $T$ is linear.

  + Find the projection transformation onto the $y$-axis in $RR^2$, and show that it is also linear.
]

#exercise[
  The *zero transformation* $T_0 : V -> W$ where $V$ and $W$ are vector spaces is defined by $T(v) = bold(0)_W$ for any $v in V$. Prove $T_0$ is linear.
]

#exercise[
  Let $V$ be a vector space and $u in V$ be some fixed vector. Define $T_u : V -> V$ by

  $
    T_u(v) = u + v quad forall v in V.
  $

  The transformation $T_u$ is called *translation by $u$*.

  + Prove $T_u$ is linear.

  + Show that if $u_1, u_2 in V$, then $T_(u_1 + u_2) = T_u_1 compose T_u_2$.
]

#exercise[
  Suppose $T$ and $G$ are linear transformations in $bold(L)(V, W)$.
  Then, define addition and scalar multiplication like so:

  $
    (T + G)(u) & = T(u) + G(u) quad && forall u in V \
        T(c u) & = c T(u)           && forall u in V, c in FF
  $

  Prove $bold(L)(V, W)$ is a vector space under these operations.
  // (define addition & s mul on transforms). with these addition & scalar mult ops defined on L(V, W), prove L(V, W) is a vector space
]

// feb 19

#pagebreak()

#exercise[
  Let $T : RR^3 -> RR^2$ be defined by

  $
    T(a_1, a_2, a_3) = (a_1 - a_2, 2a_3).
  $

  Show $T$ is a linear transformation.
]

#exercise[
  Determine which of the following linear transformations we have studied are one-to-one, onto, and bijective.

  + The rotation transformation $T_theta$ in $RR^2$

  + The identity transformation $I_v$

  + $T : RR^2 -> RR^2$ where $T(u, v) = (2u + v, u)$

  + Orthogonal projection onto the $x$-axis in $RR^2$

  + $T : { f : RR -> RR | f "is continuous" } --> RR$ defined by $T(f) = integral_a^b f(t) d t$ for some fixed limits $a, b in RR$

  + $T : { f : RR -> RR | f' "exists" } --> RR$ defined by $T(f) = f'(x)$ for some fixed $x in RR$

  + $T : M_(m times n)(FF) -> M_(m times n)(FF)$ mapping $A |-> A^T$

  + The zero transformation $T_0$

  + The translation transformation $T_u : V -> V$ for some fixed $u in V$

  + The transformation in *Exercise 6*
]

// 26 feb

#exercise[
  Let $T : RR^2 -> RR^3$ be defined as

  $
    T\(a_1, a_2) = \(a_1 + 3a_2, 0, 2a_1 - 4a_2)
  $

  + Prove that $T$ is linear.

  + Determine whether $T$ is onto.
]

#exercise[
  In class, we proved part (i) of the following theorem:

  #theorem(number: none)[
    Let $V$ and $W$ be finite-dimensional vector spaces with ordered basis $beta$ and $gamma$ respectively. Let $T, U : V -> W$ be linear transformations. Then

    + $[T + U]_beta^gamma = [T]_beta^gamma = [U]_beta^gamma$

    + $[c T]_beta^gamma = c[T]_beta^gamma$
  ]

  Now, prove part (ii).
  + The zero transformation $T_0$
]

#exercise[
  Prove the following proposition:

  #proposition(number: none)[
    Let $V$ be a vector space, and let $T, U_1, U_2 in bold(L)(V)$. Then

    + $T compose \(U_1 + U_2) = T compose U_1 + T compose U_2$ \
      $\(U_1 + U_2) compose T = U_1 compose T + U_2 compose T$

    + $T compose (U_1 compose U_2) = (T compose U_1) compose U_2$

    + $T compose I_V = T = I_V compose T$

    + $c(U_1 compose U_2) = (c U_1) compose U_2 = U_1 compose \(c U_2)$
  ]
]

// mar 3

#exercise[
  Prove part (ii) of the following proposition:

  #proposition(number: none)[
    Let $A$ be an $m times n$ matrix and $B$ be a $n times p$ matrix. For each $j = 1, 2, ..., p$, lt $u_j$ and $v_j$ denote the $j$th columns of $A B$ and $B$ respectively. Then

    + $u_j = A v_j$

    + $v_j = A e_j$ where $e_j$ is the $j$th vector of the standard ordered basis of $FF^n$
  ]
]

// mar 5

#exercise[
  Let $T : P_1(RR) -> RR^2$ be defined as

  $
    T(a + b x) = (a, a + b).
  $

  + Prove that $T$ is linear.

  + Prove $T$ is injective by showing $ker T = { bold(0) }$. What else does this imply?

  + Given $T^(-1)(c, d) = (c, (d - c))$, show that $T compose T^(-1) = I_(RR^2)$.

  + Show $T^(-1)$ is linear.
  // show T : P_1(R) -> R^2 T(a + bx) = (a, a + b) i. linear ii. ker T = { 0 } (to show inj and therefore surj, invertible) iii. given T-(c, d) = (c, (d - c)x), show that T o T- = I_R2 iv. show T- linear
]

// mar 10

#pagebreak()

#exercise[
  Prove the following corollary:

  #corollary(number: none)[
    Let $A$ be an $n times n$ matrix. Then $A$ is invertible if and only if $L_A$ is invertible. Moreover, $\(L_A)^(-1) = L_(A^(-1))$.
  ]
]

#exercise[
  Let $T : FF^2 -> P_1(FF)$ be defined as

  $
    T\(a_1, a_2) = a_1 + a_2 x.
  $

  Prove $T$ is an isomorphism and find $T^(-1)$.
  // T : F2 -> P1(F) def by T(a_1, a_2) = a_1 + a_2x. prove T is an isomorphism and find T-.
]

#exercise[
  Let $T : RR^3 -> RR^3$ be defined as

  $
    T(x, y, z) = (-y, x, 4z).
  $

  Prove $T$ is an isomorphism and find $T^(-1)$.
  // same, but for T : R3 -> R3 T(x, y, z) = (-y, x, 4z)
]

#exercise[
  Suppose $V$ and $W$ are finite-dimensional vector spaces such that $dim V = n$ and $dim W = m$. Let $beta$ and $gamma$ be the standard ordered bases for $V$ and $W$ respectively. Then, let $phi_beta^gamma : bold(L)(V, W) --> M_(m times n)(FF)$ be defined as

  $
    phi_beta^gamma (T) = [T]_beta^gamma wide T in bold(L)(V, W).
  $

  Prove $phi_beta^gamma$ is linear to complete the proof in lecture.
  // complete proof of thm for phi by showing phi is linear
]


