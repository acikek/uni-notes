#import "lecture-template.typ": *

#set document(
  title: "MATH 108B Notes Apr. 29, 2026",
  date: datetime(day: 29, month: 4, year: 2026),
)

#show: template

#theorem(number: none)[
  Suppose $T$ is a linear operator on a finite-dimensional inner product space $V$ of dimension $n$. Suppose further that the characteristic polynomial of $T$ splits. Then there exists an orthonormal basis $beta$ for $V$ such that $[T]_beta$ is upper-triangular.
]

#corollary(number: none)[
  If $V$ is a vector space over $CC$, then for any $T : V -> V$, there is an orthonormal basis $beta$ for $V$ such that $[T]_beta$ is upper-triangular.
]

#corollary(number: none)[Matrix Version][
  If $A$ is an $n times n$ matrix with complex entries, then there is an invertible matrix $P$ such that $P^(-1) A P$ is upper-triangular.
]

#proof[
  We prove by induction on $n$.

  If $n = 1$, then take $beta = { x } subset.eq V$, an orthonormal basis for $V$. Then $T(x) = c x$ for some $c in V$. Thus the $1 times 1$ matrix $[T]_beta$ is trivially upper-triangular.

  Suppose $n >= 2$ and the result holds for $n - 1$.

  Since the characteristic polynomial of $T$ splits, $T$ has an eigenvalue and an eigenvector. Thus $T^*$ too has an eigenvector, say $z'$ such that $T^*(z') = lambda z'$.

  Let $z = 1 / norm(z') z'$. Then $T^*(z) = lambda z$ where $z$ is a unit eigenvector.

  Let $W = span{ z }$.

  We prove that $W^perp$ is $T$-invariant. Let $y in W^perp$. Then it is sufficient to show that $ip(T(y), w) = 0$ for every $w in W$, meaning $T(y) in W^perp$. Let $w in W$. Then $w = c z$ for some $c in F$. It follows that

  $
    ip(T(y), c z) & = ip(y, T^*(c z)) \
                  & = ip(y, c T^*(z)) \
                  & = overline(c) ip(y, T^*(z)) \
                  & = overline(c) ip(y, lambda z) \
                  & = overline(c) overline(lambda) ip(y, z) = 0.
  $

  Since $dim V = n$, $dim W = 1$, and $W plus.o W^perp = V$, we have $dim W^perp = n - 1$. Since $W^perp$ is $T$-invariant, we can define a restriction

  $
    T_(W^perp) : W^perp -> W^perp quad "where" T_(W^perp)(x) = T(x) "for all" x in V.
  $

  Because the characteristic polynomial of $T_(W^perp)$ divides the characteristic polynomial of $T$, the characteristic polynomial of $T_(W^perp)$ also splits. Then by the induction hypothesis, there is an orthonormal basis $gamma$ for $W^perp$ such that $\[T_(W^perp)]_gamma$ is upper-triangular.

  Define $beta = gamma union { z } = \{ v_1, v_2, ..., v_(n - 1), z }$. By construction, $z$ is a unit vector that is orthogonal to all $v_i$. Furthermore, $beta$ is linearly independent and spans $V$, so in all, it is an orthonormal basis for $V$.

  Now $[T]_beta$ takes the form of a block matrix with $\[T_(W^perp)]_gamma$, an $(n - 1) times (n - 1)$ matrix, in the top-left corner with entries of zero below. Its rightmost column is $[T(z)]_beta$, which is arbitrary. Since $\[T_(W^perp)]_gamma$ is upper-triangular, it follows that $[T]_beta$ is as well.
]

#definition(number: none)[Normal Linear Transformation][
  Let $V$ be a finite-dimensional inner product space, and let $T$ be a linear operator on $V$. We say $T$ is *normal* if

  $
    T compose T^* = T^* compose T.
  $
]

#remark[
  We can use the same definition for inner product spaces that are not necessarily finite-dimensional, but we have to address the fact that $T^*$ does not necessarily exist for an arbitrary linear operator $T$ in these spaces.
]

#definition(number: none)[Normal Matrix][
  A matrix $A$ is called *normal* if $A A^* = A^* A$.
]

#example[
  Consider the matrix

  $
    A = mat(2i, 0; 0, 3i).
  $

  Then

  $
    A A^* = mat(2 i, 0; 0, 3i) mat(-2i, 0; 0, -3i) = mat(4, 0; 0, 9) = A^* A.
  $

  So $A$ is normal.
]

#example[
  Let $A$ be the rotation matrix

  $
    A = mat(cos theta, -sin theta; sin theta, cos theta).
  $

  Then $A A^* = I_2 = A^* A$, so this matrix is normal.
]

#example[
  Consider the matrix

  $
    A = mat(1, 1; 0, 1).
  $

  Then

  $
    A A^* = mat(2, 1; 1, 1) quad "while" quad A^* A = mat(1, 1; 1, 2).
  $

  So $A$ is not normal. Note that $A$ is not diagonalizable either---it will become clear that these properties share a connection.
]

#proposition(number: none)[
  Let $T$ be a linear operator over a finite-dimensional inner product space $V$. Then $T$ is normal if and only if $[T]_beta$ is normal where $beta$ is any orthonormal basis for $V$.
]

#proof[
  Suppose $T$ is normal, i.e. $T T^* = T^* T$. Let $beta$ be an orthonormal basis for $V$. It follows that

  $
        & [T T^*]_beta        && = [T^* T]_beta \
    ==> & [T]_beta [T^*]_beta && = [T^*]_beta [T]_beta \
    ==> & [T]_beta [T]_beta^* && = [T]_beta^* [T]_beta
  $

  so $[T]_beta$ is normal.

  The above chain is reversible owing to the fact that if $[T]_beta = [U]_beta$ for two linear operators $T$ and $U$ over the same space, then $T = U$. Thus the converse is true.
]

#definition(number: none)[Symmetry and Skew-Symmetry][
  A matrix $A$ is *symmetric* if $A^T = A$. We call $A$ *skew-symmetric* if $A^T = -A$.
]

#remark[
  Suppose $A$ is a real symmetric matrix. Then it is also normal:

  $
    A A^* = A A^T = A^2 = A^T A = A^* A
  $

  The same is true if $A$ is a real skew-symmetric matrix:

  $
    A A^* = A A^T = -A^2 = A^T A = A^* A
  $

  Note that the converse does not hold.
]

#theorem(number: none)[
  Suppose $V(F)$ is an inner product space and $T$ is a normal operator on $V$. Then the following properties hold:

  + $norm(T(x)) = norm(T^*(x))$ for all $x in V$

  + $T - c I$ is normal for any $c in F$

  + If $T(x) = lambda x$ where $x$ is a nonzero vector in $V$, then $T^*(x) = overline(lambda) x$

  + If $lambda_1$ and $lambda_2$ are distinct eigenvalues of $T$, then $E_lambda_1 perp E_lambda_2$
]

#proof[
  We prove three of the above properties.

  1. For any $x in V$, we have

    $
      norm(T(x)) & = sqrt(ip(T(x), T(x))) \
                 & = sqrt(ip(x, T^*(T(x)))) \
                 & = sqrt(ip(x, T(T^*(x)))) \
                 & = sqrt(ip(T^*(x), T^*(x))) = norm(T^*(x)).
    $

  3. If $T(x) = lambda x$, then by properties (i) and (ii), we have

    $
      norm((T - lambda I)(x)) = norm((T - lambda I)^* (x)).
    $

    The left-hand side is zero, so $(T - lambda I)^* (x) = 0$, meaning $\(T^* - overline(lambda) I)(x) = 0$, and thus $T^*(x) = overline(lambda)x$.

  4. Let $x_1$ and $x_2$ be eigenvectors of $T$ such that $T\(x_1) = lambda_1$ and $T\(x_2) = lambda_2$. Then

    $
      lambda_1 ip(x_1, x_2) & = ip(lambda_1 x_2, x_3) \
                            & = ip(T\(x_1\), x_2) \
                            & = ip(x_1, T^*\(x_2\)) \
                            & = ip(x_1, overline(lambda_2) x_2) = lambda_2 ip(x_1, x_2).
    $

    Since $lambda_1 != lambda_2$, it follows that $ip(x_1, x_2) = 0$. Since $x_1$ and $x_2$ were arbitrary elements of $E_lambda_1$ and $E_lambda_2$ respectively, we have shown that $E_lambda_1 perp E_lambda_2$.
]

#exercise(number: none)[
  Prove part (ii) of the above theorem.
]

#definition(number: none)[Self-Adjoint][
  A linear operator $T$ is said to be *self-adjoint* if $T = T^*$. Similarly, a matrix $A$ is self-adjoint if $A = A^*$.
]
