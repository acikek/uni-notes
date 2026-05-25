#import "lecture-template.typ": *

#set document(
  title: "MATH 108B Notes May 18, 2026",
  date: datetime(day: 18, month: 5, year: 2026),
)

#show: template

#definition(number: none)[Nilpotent][
  A linear operator $T : V -> V$ is called *nilpotent* if $T^k = T_0$ for some integer $k >= 1$.

  An $n times n$ matrix $N$ is called *nilpotent* if $N^k = 0_(n, n)$ for some $k >= 1$.
]

#example[
  The following matrices are nilpotent:

  $
    A = mat(0, 1; 0, 0) wide B = mat(0, 1, 0; 0, 0, 1; 0, 0, 0)
  $
]

#proposition[
  Let $N$ be a nilpotent linear operator on a finite-dimensional vector space $V$. Then the only eigenvalue of $N$ is $0$.
]

#proof[
  Since $N$ is nilpotent, there is an integer $k >= 1$ such that $N^k = T_0$. Let $lambda$ be an eigenvalue of $N$ with a corresponding eigenvector $v$.

  Hence $N(v) = lambda v$. By induction, $N^k (v) = lambda^k v$. So $lambda^k v = bold(0)$, but since $v$ is nonzero, it follows that $lambda = 0$.
]

#proposition(<p2>)[][
  Let $N$ be a linear operator on a vector space $V$. If for some integer $m >= 1$,

  $
    ker(N^m) = ker\(N^(m + 1)),
  $

  then

  $
    ker(N^m) = ker\(N^(m + 1)) = ker\(N^(m + 2)) = dots.c
  $
]

#proof[
  For any integer $k >= 1$, we know

  $
    ker\(N^k) subset.eq ker\(N^(k + 1)) subset.eq dots.c
  $

  Set $m$ to the given integer such that $ker(N^m) = ker\(N^(m + 1))$.

  Let $v in ker\(N^(m + 2))$, meaning $N^(m + 2)(v) = bold(0)$. Hence $N^(m + 1)(N(v)) = bold(0)$, so

  $
    N(v) in ker\(N^(m + 1)) = ker(N^m).
  $

  So $N^(m + 1)(v) = N^m (N(v)) = bold(0)$, meaning $v in ker\(N^(m + 1))$.

  Therefore, $ker\(N^(m + 2)) = ker\(N^(m + 1))$, and the rest follows by induction.
]

#proposition(<p3>)[][
  Let $N$ be a linear operator on an $n$-dimensional vector space $V$. Then there is an integer $m <= n$ such that

  $
    ker(N^m) = ker\(N^(m + 1)) = ker\(N^(m + 2)) = dots.c
  $
]

#proof[
  It is sufficient to show there is an integer $m >= 1$ such that

  $
    ker(N^m) = ker\(N^(m + 1)).
  $

  Then the result follows from @p2[-].

  To begin, we know

  $
    ker(N) subset.eq ker\(N^2) subset.eq dots.c
  $

  Hence,

  $
    dim ker (N) <= dim ker \(N^2) <= dots.c
  $

  However, since the null space of $N^k$ for any $k >= 1$ is a subspace of $V$,

  $
    dim ker \(N^k) <= n.
  $

  Thus, there must be a "stopping point" in this chain of inequalities. That is, for some integer $m >= 1$,

  $
    dim ker(N^m) = dim ker\(N^(m + 1)) = dots.c \ "where" dim ker\(N^(m + k)) <= n "for any" k >= 1.
  $

  Furthermore, this inequality chain cannot have more than $n$ strictly increasing terms. Hence $m <= n$. The result follows by @p2[-]. // TODO: develop this argument further.
]

#proposition[
  Let $N$ be a nilpotent operator on an $n$-dimensional vector space $V$. Then $N^n = T_0$.
]

#proof[
  By @p3[-], there is an integer $m <= n$ such that

  $
    ker(N^m) = dots.c = ker(N^n) = dots.c
  $

  Since $N$ is nilpotent, there is an integer $k >= 1$ such that $N^k = T_0$. So $ker\(N^k) = V$.

  If $k < m$, then $N^k = N^m = N^n = T_0$, and we are done.

  Otherwise, if $k >= m$, then $k = m + r$ for some $r >= 0$, and

  $
    ker(N^m) = ker\(N^(m + r)) = ker\(N^k) = V.
  $

  Hence $N^m = N^n = T_0$, as required.
]

#corollary(number: none)[
  Let $A in M_(n times n)(F)$ such that $A^k = 0_(n, n)$ for some $k >= 1$. Then $A^n = 0_(n, n)$.
]

#theorem(number: none)[
  Let $T$ be a linear operator on an $n$-dimensional vector space $V$. Then $V$ can be written as

  $
    V = ker(T^n) plus.o range(T^n).
  $
]

#proof[
  By @p2[-], we know $ker(T^n) = ker\(T^(n + 1)) = dots.c$.

  Let $v in ker(T^n) inter range(T^n)$. Then $T^n (v) = bold(0)$ and $v = T^n (u)$ for some $u in V$. Hence

  $
    bold(0) = T^n (v) = T^n (T^n (u)) = T^(2n) (u).
  $

  So $u in ker\(T^(2n)) = ker(T^n)$, meaning $v = bold(0)$. Therefore,

  $
    ker(T^n) inter range(T^n) = { bold(0) }.
  $

  Now, apply the Rank-Nullity Theorem to $T^n$ to get

  $
    dim V = dim ker(T^n) + dim range(T^n).
  $

  The result follows.
]

#definition(number: none)[Generalized Eigenvector][
  Let $T$ be a linear operator on a finite-dimensional vector space $V$. A nonzero vector $v in V$ is called a *generalized eigenvector* of $T$ corresponding to an eigenvalue $lambda$ if there is an integer $k >= 1$ such that

  $
    (T - lambda I)^k (v) = bold(0).
  $

  Eigenvectors as we have discussed them up to this point are also generalized eigenvectors.
]

#definition(number: none)[Generalized Eigenspace][
  Let $T$ be a linear operator on a finite-dimensional vector space $V$. If $lambda$ is an eigenvalue of $T$, the  *generalized eigenspace* corresponding $lambda$ is defined as the set of all generalized eigenvectors corresponding to $lambda$ plus the zero vector, i.e.

  $
    G_lambda = { v != bold(0) in V : (T - lambda I)^k (v) = bold(0) "for some" k >= 1 } union { bold(0) }.
  $
]
