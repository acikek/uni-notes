#import "lecture-template.typ": *

#set document(
  title: "MATH 108A Notes Feb. 5, 2026",
  date: datetime(day: 5, month: 2, year: 2026),
)

#show: template

#corollary(number: none)[
  Let $V(FF)$ be a vector space where $dim(V) = n$.

  + Any finite generating set for $V$ contains at least $n$ vectors, and any such set containing exactly $n$ vectors is a basis for $V$.

  + Any linearly independent subset of $V$ consisting of exactly $n$ vectors is a basis for $V$.

  + Every linearly independent subset of $V$ can be extended to a basis for $V$.
]

#proof[(i)][
  Let $S$ be a subset of $V$ such that $span(S) = V$. By a previous result, some subset $H subset.eq S$ is a basis for $V$.

  Then $|H| = n$ by definition. Since $|H| <= |S|$, it follows that $|S| >= n$.

  Conversely, suppose $|S| = n$. By the same result mentioned prior, choose $H = S$. Then $S$ is a basis for $V$.
]

#proof[(ii)][
  Let $L$ be a linearly independent subset of $V$ for which $|L| = n$. Also, let $beta$ be a basis for $V$, meaning $|beta| = n$.

  By the Replacement Theorem, there is a subset $H subset.eq beta$, where $|H| = n - n = 0$, such that $span(L union H) = V$. Then $H$ must be the the empty set, so $L union H = L$.

  Therefore, $span(L) = V$, and $L$ forms a basis for $V$.
]

#proof[(iii)][
  Let $L$ be a linearly independent subset of $V$ where $|L| = m$.

  By the Replacement Theorem, there is a subset $H subset.eq S$, where $|H| = n - m$, such that $span(L union H) = V$. Since $L$ and $H$ are disjoint sets, $|L union H| = m + (n - m) = n$.

  Therefore, by part (i), the set $L union H$ forms a basis for $V$.
]

#example[
  In a previous exercise, it was shown that

  $
    gamma = { mat(1, 1; 0, 1), mat(1, 1; 1, 0), mat(0, 1; 1, 1), mat(1, 0; 1, 1) }
  $

  spans the set of real $2 times 2$ matrices. Since $dim(M_(2 times 2)(RR)) = 4$, then $gamma$ must also be a basis for the set.
]

#example[
  The set $beta = { (1, 1, 0), (0, 1, 1), (1, 0, 1)}$ is a linearly independent subset of $RR^3$. We know the dimension of $RR^3$ is $3$, so $beta$ must also form a basis.
]

= Dimensions of Subspaces

#theorem(number: none)[
  If $S$ is a subspace of a finite-dimensional vector space $V(FF)$, then

  + $S$ is finite-dimensional, and $dim(S) <= dim(V)$.

  + If $dim(S) = dim(V)$, then $S = V$.
]

#proof[(i)][
  Let $dim(V) = n$. If $S$ is the zero subspace, then $dim(S) = 0 <= n$.

  Now, let $S != { 0 }$ be a subspace of $V$. Then there exists some nonzero $v_1 in S$. It follows that $\{ v_1 }$ is a linearly independent subset of $S$.

  Continue choosing vectors $v_1, v_2, ..., v_k$ from $S$ such that $\{ v_1, v_2, ..., v_k }$ remains linearly independent. This process stops at some $k <= n$, since the cardinality of linearly independent subset of $V$ is at most $dim(V)$.

  It follows that adding more vectors from $S$ to $\{ v_1, v_2, ..., v_n }$ would make the set linearly dependent. Therefore, this set generates $S$, meaning it is a basis for $S$.

  Since there are $k$ vectors in this basis, $dim(S) = k <= n$.
]

#proof[(ii)][
  Suppose $dim(S) = dim(V)$. Then $S$ has a basis $beta$ such that $|beta| = n$. Hence, $beta$ is a linearly independent subset of $V$ whose cardinality is exactly $dim(V)$. By the corollary, $beta$ is a basis for $V$. Therefore, $S = span(beta) = V$.
]

#example[
  In a previous example, we showed that $beta$ is a basis for $S$ where

  $
    S = \{ (x, y, z) in RR^3 : x + y + z = 0 }, \
    beta = { (1, -1, 0), (1, 0, -1) }.
  $

  It follows that $dim(S) = 2$, which is less than $dim\(RR^3) = 3$.
]

#example[
  The set of all $n times n$ real square matrices is

  $
    M_(n times n)(RR) = { E^(i j) : 1 <= i, j <= n }.
  $

  The subset of $n times n$ symmetric matrices, $S_(n times n),$ is a finite-dimensional subspace of the vector space $M_(n times n)(RR)$. Below are two bases for $S_(2 times 2)$ and $S_(3 times 3)$.

  $
    beta_(2 times 2) = { mat(1, 0; 0, 0), mat(0, 1; 1, 0), mat(0, 0; 0, 1) } \
    beta_(3 times 3) = { mat(1, 0, 0; 0, 0, 0; 0, 0, 0), mat(0, 1, 0; 1, 0, 0; 0, 0, 0), mat(0, 0, 1; 0, 0, 0; 1, 0, 0), mat(0, 0, 0; 0, 1, 0; 0, 0, 0), mat(0, 0, 0; 0, 0, 1; 0, 1, 0), mat(0, 0, 0; 0, 0, 0; 0, 0, 1) }
  $

  We can also represent $B_(3 times 3)$ like so:

  $
    beta_(3 times 3) = { E^(11), E^(12) + E^(21), E^(13) + E^(31), E^(23) + E^(32), E^(33) }
  $

  The basis $beta_(3 times 3)$ has a cardinality of six, hence $dim\(S_(3 times 3)) = 6$.

  To understand the dimension of a subspace of symmetric matrices, we proceed with a counting argument for the cardinality of $beta_(3 times 3)$. A symmetric $3 times 3$ matrix has three distinct entries in the first row, so we represent them with the basis matrices $E^(11)$, $E^(12) + E^(21)$, and $E^(13) + E^(31)$. There are three more entries in the second row, but the first one is already covered by $E^12 + E^21$, so we add two matrices instead of three. This pattern continues in the third row, for which we only add one basis matrix.

  In general,

  $
    |beta_(n times n)| = n + (n - 1) + dots.c + 1 = (n(n + 1))/2.
  $
]

#exercise(number: none)[
  Verify that $beta_(3 times 3)$ is a basis by showing that it spans $S_(3 times 3)$ while also being linearly independent.
]

#example[
  Let $S$ be the set of $n times n$ real diagram matrices. That is,

  $
    S = { A in M_(n times n)(RR) : A_(i j) = 0 thick forall i != j } subset.eq M_(n times n)(RR)
  $

  Below, we construct a basis for $S$:

  $
    beta = { E^(i i) : 1 <= i <= n } = { E^(11), E^(22), ..., E^(n n) }
  $

  It follows that $dim(S) = |beta| = n$.
]

#exercise(number: none)[
  + Prove $S$ is a subspace of $M_(n times n)(RR)$.

  + Show that $beta$ is a basis for $S$.
]

#example[
  Let $S$ be a subset of $RR^5$ defined as

  $
    S = { \(x_1, x_2, x_3, x_4, x_5\) in RR^5 : x_1 + x_3 + x_5 = 0, thick x_2 = x_4 }.
  $

  We will construct a basis for $S$, prove it is indeed a basis, then determine $dim(S)$.

  First, we describe the basis:

  $
    beta = { (0, 1, 0, 1, 0), (1, 0, -1, 0, 0), (0, 0, -1, 0, 1) }
  $

  To show $beta$ is linearly independent, consider the linear combination

  $
    a(0, 1, 0, 1, 0) + b(1, 0, -1, 0, 0) + c(0, 0, -1, 0, 1) = bold(0).
  $

  Simplifying, we get

  $
    (b, a, -b - c, a, c) = bold(0) quad <==> quad a = b = c = 0
  $

  Therefore, $beta$ is linearly independent.

  Next, we show $beta$ spans $S$. Take any vector $\(x_1, ..., x_5) in S$. From the conditions, we know $x_1 + x_3 + x_5 = 0$ and $x_2 = x_4$. We rewrite the first condition as $x_3 = -x_1 - x_5$ to isolate $x_3$.

  We claim that our chosen vector can be represented as

  $
    \(x_1, ..., x_5) = a(0, 1, 0, 1, 0) + b(1, 0, -1, 0, 0) + c(0, 0, -1, 0, 1) \
    "where" a = x_2 = x_4, thick b =x_1, thick c = x_5.
  $

  Simplifying the right side, we get

  $
    \(x_1, ..., x_5) = \(x_1, x_2, -x_1 - x_5, x_2, x_5)
  $

  and this equality follows directly from the set conditions. Thus, $beta$ spans $S$, and therefore $beta$ is a basis for $S$.

  We can now deduce that $dim(S) = |beta| = 3$.
]

#exercise(number: none)[
  Since $S$ is a subspace of $RR^5$, we can extend $beta$ to a basis for $RR^5$. One such basis is

  $
    gamma = beta union { (0, 0, 0, 1, 0), (0, 0, 1, 0, 0) }.
  $

  Prove $gamma$ is a basis for $RR^5$.
]
