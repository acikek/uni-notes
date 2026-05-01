#import "lecture-template.typ": *

#import "@preview/commute:0.3.0": arr, commutative-diagram, node

#set document(
  title: "MATH 108B Notes Apr. 22, 2026",
  date: datetime(day: 22, month: 4, year: 2026),
)

#show: template

#theorem(number: none)[
  Suppose $V(F)$ is an inner product space. Let $T$ and $U$ be linear operators on $V$. Then the following are true:

  + $T + U$ has an adjoint, and $(T + U)^* = T^* + U^*$

  + $(c T)^* = overline(c) T^*$ for every $c in F$

  + $(T compose U)^* = U^* compose T^*$

  + $(T^*)^* = T$

  + $I^* = I$ where $I$ is the identity operator on $V$
]

#proof[
  + For any $x, y in V$, we have

    $
      ip((T + U)(x), y) & = ip(T(x) + U(x), y) \
                        & = ip(T(x), y) + ip(U(x), y) \
                        & = ip(x, T^*(y)) + ip(x, U^*(y)) \
                        & = ip(x, (T^* + U^*)(y)).
    $

    So $(T + U)^* = T^* + U^*$ by definition.

  //The next two properties follow similarly:

  2. Similarly,
    $
      ip((c T)(x), y) & = ip(c T(x), y) \
                      & = c ip(T(x), y) \
                      & = c ip(x, T^*(y)) \
                      & = ip(x, overline(c) T^*(x)) \
                      & = ip(x, (overline(c) T^*)(x)).
    $

  + $
      ip((T compose U)(x), y) & = ip(T(U(x)), y) \
                              & = ip(U(x), T^*(y)) \
                              & = ip(x, U^*(T^*(y))) \
                              & = ip(x, (U^* compose T^*)(y)).
    $

  + Since $ip(T^*(x), y) = ip(x, T(y))$ for any $x, y in V$, it follows that $(T^*)^* = T$.

  + We have $ip(I(x), y) = ip(x, y) = ip(x, I(y))$, hence $I^* = I$.
]

#proposition(number: none)[
  Suppose $V$ is a finite-dimensional inner product space with an orthonormal basis $beta = { v_1, v_2, ..., v_n }$. Let $T$ be a linear operator on $V$, and $A = [T]_beta$. Then for any $i$ and $j$,

  $
    A_(i j) = ip(T\(v_j), v_i).
  $
]

#proof[
  Let $v_j in beta$. Then $T\(v_j)$ is a vector in $V$. Because $beta$ is an orthonormal basis, we can express $T\(v_j)$ as a linear combination of the form

  $
    T\(v_j) = ip(T\(v_j\), v_1)v_1 + dots.c + ip(T\(v_j\), v_n)v_n.
  $

  So the $j$th column of $A$ is exactly $\[ip(T\(v_j\), v_1), ..., ip(T\(v_j\), v_n)]$. Hence

  $
    A = mat(
      ip(T\(v_1\), v_1), ip(T\(v_2\), v_1), dots.c, ip(T\(v_n\), v_1);
      ip(T\(v_1\), v_2), ip(T\(v_2\), v_2), dots.c, ip(T\(v_n\), v_2);
      dots.v, dots.v, , dots.v;
      ip(T\(v_1\), v_n), ip(T\(v_2\), v_n), dots.c, ip(T\(v_n\), v_n)
    )
  $

  Therefore, $A_(i j) = ip(T\(v_j\), v_i)$.
]

#proposition(number: none)[
  Suppose $V$ is a finite-dimensional inner product space and $beta$ is an orthonormal basis for $V$. If $T$ is a linear operator on $V$, then

  $
    [T^*]_beta = [T]_beta^*.
  $
]

#proof[
  Let $A = [T]_beta$ and $B = [T^*]_beta$. It then suffices to show that $B = A^*$.

  For any $i$ and $j$,

  $
    B_(i j) = ip(T^*\(v_j\), v_i) = ip(v_j, T\(v_i\))
  $

  and

  $
    A^*_(i j) = overline(A_(j i)) = overline(ip(T\(v_i\), v_j)) = ip(v_j, T\(v_i\)).
  $

  Thus $B_(i j) = A^*_(i j)$, so $B = A^*$. Therefore, $[T^*]_beta = [T]^*_beta$.
]

#example[
  Let $T : CC^2 -> CC^2$ be a linear operator defined as

  $
    T\(a, b) = \(2i a + 3b, a - b).
  $

  Let $beta$ be the standard basis $beta = { (1, 0), (0, 1) }$.

  + To compute $[T]_beta$, we first find the basis column vectors:

    $
      T(1, 0) & = (2i, 1) & = 2i(1, 0) + 1(0, 1) && \
      T(0, 1) & = (3, -1) &  = 3(1, 0) - 1(0, 1) &&
    $

    And thus

    $
      [T]_beta = mat(2i, 3; 1, -1).
    $

  + To compute $[T^*]_beta$, we take the conjugate transpose of $[T]_beta$:

    $
      [T^*]_beta = [T]^*_beta = mat(-2i, 1; 3, -1)
    $

  + We use this matrix to find a closed form for $T^*$:

    $
      T^*(1, 0) && = (-2i, 3) \
      T^*(0, 1) &&  = (1, -1)
    $

  $
    T^*(a, b) & = a T^*(1, 0) + b T^*(0, 1) \
              & = (-2i a, 3a) + (b, -b) \
              & = (-2i a + b, 3a - b)
  $
]

#remark[
  Let $A$ be an $n times n$ matrix with entries from a field $F$. Then $L_A : F^n -> F^n$ is the left-multiplication operator defined as $L_A (v) = A v$ for any $v in F^n$.

  Taking $beta$ to be the standard basis of $F^n$, we know $\[L_A]_beta = A$. In fact, the adjoint of this transformation $L_A^*$ is exactly $L_(A^*)$, the left-multiplication of $A^*$.

  Given the above proposition, we now have the following commutative diagram:

  #align(center)[
    #commutative-diagram(
      padding: 0.5em,
      node-padding: (40pt, 40pt),
      node((0, 0), $A$),
      node((0, 1), $L_A$),
      node((1, 0), $A^*$),
      node((1, 1), $L_(A^*)$),
      arr($A$, $L_A$, none),
      arr($A$, $A^*$, none),
      arr($L_A$, $L_(A^*)$, none),
      arr($A^*$, $L_(A^*)$, none),
    )
  ]
]

So far in this course, we have focused on the question of whether a linear operator $T$ on $V$ is diagonalizable. If the answer is no, then our goal is to somehow measure the degree by which $T$ fails to meet this property.

To this end, we consider a new question: for a linear $T : V -> V$, is it possible to find a nonzero subspace $W subset.neq V$ such that the restriction of $T$ on $W$

$
  T|_W : W -> W
$

is also a linear operator?

#definition(number: none)[T-Invariant Subspace][
  Let $V$ be a vector space, and let $T$ be a linear operator on $V$. Then a subspace $W subset.eq V$ is *$T$-invariant* if $T(W) subset.eq W$.
]

#example[
  The following are examples of $T$-invariant subspaces for an arbitrary vector space $V$ and linear operator $T$.

  + $W = { bold(0) }$, the zero subspace

  + $W = V$

  + Any eigenspace $E_lambda$ for an eigenvalue $lambda$.

    #proof[
      Let $v in E_lambda$. Then $T(v) = lambda v$. To show that $T(v) in E_lambda$, we take

      $
        T(T(v)) = lambda T(v) = lambda (lambda v)
      $

      which is a vector in $E_lambda$, thus proving $E_lambda$ is $T$-invariant.
    ]
]

For a diagonalizable linear operator $T$, if all eigenvalues $lambda_i$ have an algebraic multiplicity of $1$, then

$
  [T]_beta = mat(lambda_1, , , ; , lambda_2, ; , , dots.down; , , , lambda_n) wide "for some basis" beta.
$

Furthermore,

$
  underbrace(E_lambda_1 + E_lambda_2 + dots.c + E_lambda_n, "total dim." n) = underbrace(V, "dim. n")
$


since all distinct eigenspaces are disjoint. However, some eigenvalues may be *defective*, and we will touch on their consequences in a future lecture.
