#import "lecture-template.typ": *

#set document(
  title: "MATH 108B Notes Apr. 27, 2026",
  date: datetime(day: 27, month: 4, year: 2026),
)

#show: template

#sbox([Examples of $bold(T)$-Invariant Subspaces])[
  Let $T : V -> V$ be a linear transformation over a vector space $V$. Then the following subspaces are $T$-invariant:

  + ${ bold(0) }$, the zero subspace

  + $V$, the entire space

  + $N(T)$, the nullspace. If $x in N(T)$, then $T(x) = bold(0)$, which is also in $N(T)$.

  + $R(T)$, the range. If $y in R(T)$, then there is some $x in V$ such that $T(x) = y$. So $T(y) = T(T(x))$, meaning there is some $z in V$ such that $T(z) = T(y)$, namely $z = T(x)$. Thus $T(y) in R(T)$.

  + Any eigenspace $E_lambda$ for an eigenvalue $lambda$. Let $x in E_lambda$. Then $T(x) = lambda x$. Furthermore, $T(T(x)) = T(lambda x) = lambda T(x)$, so $T(x) in E_lambda$.

  + $W = span{ x, T(x), T(T(x)), ... }$ for any fixed vector $x in V$. Note that it suffices to show the basis vectors of $W$ map to vectors in $W$ to prove that $W$ is $T$-invariant. Hence, let $v = T^n (x)$ for some $n >= 0$. Then $T(v) = T^(n + 1)(x)$, which is an element of $W$.
]

#definition(number: none)[Restriction of a Linear Transformation][
  Let $V$ be a vector space and $T : V -> V$ be a linear map on $V$. Let $W$ be a $T$-invariant subspace of $V$. Then we call $T|_W : W -> W$, or simply $T_W$, the *restriction* of $T$ on $W$. We define it as

  $
    T_W (v) = T(v) quad "for all" v in V.
  $
]

#note[
  The fact that restrictions of linear transformations are also linear follows from the definition and the linearity of the unrestricted map.
]

#definition(number: none)[Block Matrix][
  A *block matrix* $M$ is of the form

  $
    M = mat(
      A_11, A_12, dots.c, A_(1 m);
      A_21, A_22, dots.c, A_(2 m);
      dots.v, dots.v, , dots.v;
      A_(n 1), A_(n 2), dots.c, A_(n m)
    )
  $

  where every $A_(i j)$ is a matrix.
]

#exercise(number: none)[
  Consider the block matrix

  $
    M = mat(A, B; [0], C).
  $

  Prove that $det(M) = det(A C) = det(A) dot det(C)$.
]

#theorem(number: none)[
  Suppose $V(F)$ is a vector space with finite dimension $n$. Suppose further that $T$ is a linear operator on $V$ and that $W$ is a $T$-invariant subspace. Then the characteristic polynomial of $T_W$ divides the characteristic polynomial of $T$.
]

#proof[
  Let $beta = \{ v_1, v_2, ..., v_m }$ be a basis for $W$. Extend $beta$ to $beta'$, a basis for $V$, such that $beta' = beta union \{ v_(m + 1), ..., v_n }$.

  We know $T_W \(v_i)$ is a linear combination of vectors in $beta$ for $i = 1, 2, ..., m$. Then since $T\(v_i) = T_W \(v_i)$ in this case, $T\(v_i)$ is a linear combination of vectors in $beta'$ where the vectors in $v_(m + 1), ..., v_n$ have coefficients of $0$. For $j = m + 1, ..., n$, $T\(v_j)$ is an arbitrary linear combination of vectors in $beta'$.

  In all, $[T]_beta'$ takes the following form:

  $
    [T]_beta' = mat(&(A)_(m times m), &(B)_(m times (n - m)); &[0]_((n - m) times m), &(B')_((n - m) times (n - m))) = mat(\[T_W]_beta, B; [0], B')
  $

  The characteristic polynomial of $T$ is given by

  $
    p' (x) & = det\([T]_beta' - x I) \
           & = det mat(\[T_W]_beta - x I, B; [0], B' - x I) \
           & = det\(\[T_W]_beta - x I) dot det(B' - x I).
  $

  Since $p(x) = det\(\[T_W] - x I)$ is the characteristic polynomial of $T_W$, it divides the characteristic polynomial of $T$.
]

#lemma(number: none)[
  Suppose $V$ is a finite-dimensional inner product space and $T$ a linear operator on $V$. Then if $T$ has an eigenvector, then so does $T^*$.
]

#proof[
  Let $v$ be an eigenvector of $T$ with an eigenvalue $lambda$. That is, $T(v) = lambda v$. Then for any $u in V$,

  $
    ip(v, \(T^* - overline(lambda) I) u) & = ip(v, (T - lambda I)^* u) \
                                         & = ip((T - lambda I)v, u) \
                                         & = ip(bold(0), u) = 0
  $

  So $ip(v, \(T^* - overline(lambda) I) u)$ for any $u in V$.

  Let $W = \{ \(T^* - overline(lambda) I\) : u in V }$. Then $v in W^perp$ by definition. Note that $W$ is a proper subset of $V$, i.e. $W != V$, because $v in W^perp$ and $v != bold(0)$.

  The set $W$ is the range of the transformation $T^* - overline(lambda) I : V -> V$. Since $W$ is a proper subset, this map is not onto, hence neither is it one-to-one. By the Rank-Nullity Theorem, the nullspace of this map is nontrivial; that is,

  $
    exists w in N\(T^* - overline(lambda) I) quad ==> quad T^*(w) = overline(lambda) w.
  $
]
