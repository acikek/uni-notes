#import "lecture-template.typ": *

#set document(
  title: "MATH 108B Notes May 11, 2026",
  date: datetime(day: 11, month: 5, year: 2026),
)

#show: template

#definition(number: none)[Positive Definiteness][
  Let $T$ be a self-adjoint linear operator on an inner product space $V$. Then $T$ is called *positive semidefinite* if

  $
    ip(T(v), v) >= 0 quad "for any" v in V.
  $

  Furthermore, $T$ is called *positive definite* if

  $
    ip(T(v), v) > 0 quad "for any" v in V.
  $

  Note that a positive definite operator is also positive semidefinite, but the converse is not generally true.
]

#proposition(number: none)[
  Suppose $V$ is an inner product space and $T$ is a linear operator on $V$.

  - If $T$ is positive semidefinite, then all the eigenvalues of $T$ are real and nonnegative.

  - If $T$ is positive definite, then the eigenvalues are real and strictly positive.
]

#proof[
  In either case, since $T$ is self-adjoint, all the eigenvalues of $T$ are real. By the Spectral Theorem, $T$ has at least one eigenvalue.

  Let $lambda$ be a real eigenvalue of $T$ with a corresponding eigenvector $v in V$. Then

  $
    ip(T(v), v) = ip(lambda v, v) = lambda ip(v, v) = lambda norm(v)^2.
  $

  If $T$ is positive semidefinite, we know $ip(T(v), v) >= 0$. Hence $lambda norm(v)^2 >= 0$. But since $v$ is nonzero, $norm(v)$ is strictly positive. It follows that $lambda$ is nonnegative.

  If $T$ is positive definite, then $lambda norm(v)^2 > 0$. Hence $lambda$ is strictly positive.
]

#proposition(number: none)[
  Suppose $V$ is an inner product space and $T$ is a positive semidefinite linear operator on $V$. Then there exists a positive definite operator $S$ such that $S^2 = T$.
]

#proof[
  Since $T$ is self-adjoint, by the Spectral Theorem, there is an operator $U$ such that

  $
    U T U^* = D
  $

  where $D$ is a diagonal operator and the columns of $U$ are orthonormal. Hence

  $
    U U^* = I = U^* U
  $

  meaning $U^* = U^(-1)$.

  Since $D$ is a diagonal operator, there is some basis $beta$ for $V$ such that

  $
    [D]_beta = \[U T U^(-1)]_beta = mat(lambda_1; , lambda_2; , , dots.down; , , , lambda_n)
  $

  where every $lambda_i$ is nonnegative. Consider the matrix representation of the operator $sqrt(D)$ as follows:

  $
    [sqrt(D)]_beta = mat(sqrt(lambda_1); , sqrt(lambda_2); , , dots.down; , , , sqrt(lambda_n))
  $

  Let $S = U^(-1) sqrt(D) U$. Then

  $
    S^2 = (U^(-1) sqrt(D) U)^2 & = U^(-1) sqrt(D) (U U^(-1)) sqrt(D) U \
                               & = U^(-1) sqrt(D) sqrt(D) U \
                               & = U^(-1) D U = T.
  $

  Therefore, $S^2 = T$.
]

#exercise(number: none)[
  Find the square root of the positive semidefinite matrix $A = mat(1, 0; 0, -1)$.
]

#definition(number: none)[Unitary][
  An operator $U$ on an inner product space $V$ is *unitary* if

  $
    U U^* = U^* U = I_V.
  $

  If $V$ is a real inner product space, then $U$ is called *orthogonal*.
]

#example[
  Consider the matrix

  $
    A = mat(&cos theta, sin theta; -&sin theta, cos theta).
  $

  Then

  $
    A A^* = mat(1, 0; 0, 1) = A^* A
  $

  hence $A$ is unitary.
]

#proposition(number: none)[
  A unitary operator $U$ on an inner product space $V$ preserves length; that is,

  $
    norm(U(v)) = norm(v) quad "for any" v in V.
  $
]

#proof[
  Let $v in V$. Then

  $
    norm(U(v))^2 & = ip(U(v), U(v)) \
                 & = ip(v, U^*(U(v))) \
                 & = ip(v, v) = norm(v)^2.
  $

  Hence $norm(U(v)) = norm(v)$.
]

#proposition(number: none)[
  The eigenvalues of a unitary operator lie on the unit circle. That is, if $lambda$ is an eigenvalue of a unitary operator $U$ on $V$, then $abs(lambda) = 1$.
]

#proof[
  Let $lambda$ be an eigenvalue of $U$ with a corresponding eigenvector $v in V$. Then

  $
    norm(v) & = norm(U(v)) = norm(lambda v) \
            & = sqrt(ip(lambda v, lambda v)) \= sqrt(lambda^2 ip(v, v)) \
            & = abs(lambda)norm(v)
  $

  So $abs(lambda) norm(v) = norm(v)$, meaning $abs(lambda) = 1$.
]

#proposition(number: none)[
  Let $U$ be a linear operator on a finite-dimensional inner product space $V$. Then the following statements are equivalent:

  + $U$ preserves inner products, i.e. $ip(U(v), U(w)) = ip(v, w)$ for any $v, w in V$

  + $U$ is unitary

  + $U$ maps any orthonormal basis for $V$ to another orthonormal basis

  + $norm(U(v)) = norm(v)$ for any $v in V$
]

#proof[(i) $<==>$ (ii)][
  Suppose $U$ preserves inner products. Let $v, w in V$. Then

  $
    ip(v, U^*(U(w))) = ip(U(v), U(w)) quad "and" quad ip(v, U^*(U(w))) = ip(v, w).
  $

  So $U^*(U(w)) = w$ for any $w in V$, meaning $U^* U = I$. Similarly, $U U^* = I$.

  Conversely, suppose $U$ is unitary. Then for any $v, w in V$,

  $
    ip(U(v), U(w)) = ip(v, U^*(U(w))) = ip(v, w).
  $
]


