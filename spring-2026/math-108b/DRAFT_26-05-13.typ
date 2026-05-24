#import "lecture-template.typ": *

#set document(
  title: "MATH 108B May 13, 2026",
  date: datetime(day: 13, month: 5, year: 2026),
)

#show: template

#proof[(i) $==>$ (iii)][
  Let $\{ e_1, ..., e_n }$ be an orthonormal basis for $V$. Then

  $
    ip(U\(e_i\), U\(e_j\)) = ip(e_i, e_j) = 0
  $

  and

  $
    norm(U\(e_i\)) = norm(e_i) = 1.
  $

  So $U$ maps an orthonormal set to another orthonormal set. Since $U$ is bijective, it also maps linearly independent sets to linearly independent sets. The desired result follows.
]

#proof[(iii) $==>$ (i)][
  Fix any orthonormal basis $\{ e_1, ..., e_n }$ for $V$. Let $v, w in V$ be arbitrary vectors such that

  $
    v = sum_(i = 1)^n alpha_i e_i quad "and" quad w = sum_(j = 1)^n beta_j e_j.
  $

  Hence

  $
    U(v) = sum_(i = 1)^n alpha_i U\(e_i) quad "and" quad U(w) = sum_(j = 1)^n beta_j U\(e_j).
  $

  Now ${ U\(e_1\), ..., U\(e_n\) }$ is an orthonormal basis for $V$, meaning

  $
    ip(U(v), U(w)) & = ip(sum_(i = 1)^n alpha_i U\(e_i\), sum_(j = 1)^n beta_j U\(e_j\)) \
                   & = sum_(i = 1)^n alpha_i overline(beta_i) = ip(v, w).
  $
]

#proof[(iv) $==>$ (ii)][
  Let $x in V$ be arbitrary. Then

  $
    ip(x, x) = norm(x)^2 = norm(U(x))^2 = ip(U(x), U(x)) = ip(x, U^*U(x)).
  $

  So

  $
    ip(x, x - U^* U(x)) = 0 quad ==> quad ip(x, (I - U^*U)(x)) = 0.
  $

  Let $S = I - U^*U$. Note $S$ is self-adjoint since

  $
    S^* = I^* - (U^* U)^* = I - U^* U = S.
  $

  By the Spectral Theorem for self-adjoint operators, there is an orthonormal basis $beta$ for $V$ consisting of eigenvectors of $S$. Let $beta = \{ v_1, ..., v_n }$ where

  $
    S v_i = lambda_i v_i.
  $

  Now $ip(x, S x) = 0$ for any $x in V$. Setting $x$ to $v_i$, we get

  $
    ip(v_i, S v_i) & = ip(v_i, lambda_i v_i) \
                   & = overline(lambda_i) ip(v_i, v_i)
  $

  Since $norm(v_i)^2 > 0$, we have $overline(lambda_i) = 0$. Hence every eigenvalue $lambda_i = 0$. Thus $S = T_0$. Hence

  $
    S = I - U^* U = T_0 quad ==> quad I = U^* U.
  $
]

#theorem(number: none)[Spectral Theorem for Unitary Operators][
  Let $T$ be a linear operator on a finite-dimensional real inner product space $V$. Then $V$ has an orthonormal basis consisting of eigenvectors of $T$, and the corresponding eigenvalues have absolute values of 1 if and only if $T$ is self-adjoint and unitary (or Hermitian and orthogonal if $V$ is a vector space over $RR$).
]

#proof[
  Suppose $beta = \{ v_1, ..., v_n }$ is an orthonormal basis for $V$ consisting of eigenvectors of $T$. Suppose further that $lambda_1, ..., lambda_n$ are the corresponding eigenvalues such that $abs(lambda_i) = 1$.

  Then $T$ is diagonalizable. Hence for the matrix representation $A$ of $T$,

  $
    A = P D P^(-1)
  $

  where $D$ is a diagonal matrix. In this case, the columns of $P$ are orthonormal, hence $P P^* = I$ and $P$ is unitary.

  So $T = U D U^*$ for a unitary operator $U$ and a diagonal operator $D$. Then

  $
    T^* & = (U D U^*)^* \
        & = U D^* U^* \
        & = U overline(D) U^* = U D U^*.
  $

  Moreover,

  $
    T T^* & = (U D U^*) (U D U^*) \
          & = U D D U^* \
          & = U I U^* = I.
  $

  It follows that $T^* T = I$. Hence $T$ is self-adjoint and unitary.

  Conversely, suppose $T$ is self-adjoint and unitary. By the Spectral Theorem for self-adjoint operators, there is an orthonormal basis for $V$ of eigenvectors of $T$. Since $T$ is unitary, $abs(lambda_i) = 1$ for each eigenvalue $lambda_i$ of $T$.
]

#proposition(number: none)[
  For any linear operator $T$ on an inner product space $V$, the operator $T^* T$ is positive semidefinite.
]

#pagebreak()

#proof[
  Let $x in V$. Then

  $
    ip(T^* T(x), x) = ip(T(x), T(x)) = norm(T(x))^2 >= 0.
  $

  Hence $T^* T$ is positive semidefinite.
]

#corollary(number: none)[
  If $T$ is a linear operator on an inner product space, $sqrt(T^* T)$ exists.
]

#definition(number: none)[Singular Values][
  The *singular values* of a linear operator $T$ are the nonnegative square roots of the eigenvalues of $T^* T$. That is,

  $
    singval(T) = { sqrt(lambda_i), sqrt(lambda_2), ..., sqrt(lambda_n)} quad "where" lambda_i "is an eigenvalue of" T^* T.
  $
]

#theorem(number: none)[Singular Value Decomposition][
  Let $A$ be an $m times n$ matrix with real or complex entries. Then $A = U D V^*$ for some unitary matrices $U$ and $V$ and a diagonal matrix $D$ where

  $
    D = mat(sigma_1, , , ; , sigma_2, , ; , , dots.down, ; , , , sigma_n) wide "and" sigma_1 >= sigma_2 >= dots.c >= sigma_n
  $

  whose diagonal entries are the singular values of $T$.
]
