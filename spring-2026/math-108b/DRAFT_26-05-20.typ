#import "lecture-template.typ": *

#set document(
  title: "MATH 108B Notes May 20, 2026",
  date: datetime(day: 20, month: 5, year: 2026),
)

#show: template

In the previous lecture, we defined the generalized eigenspace of an eigenvalue $lambda$ for a linear operator $T : V -> V$. Clearly, $E_lambda subset.eq G_lambda$. In fact,

$
  G_lambda = union.big_(k >= 1) ker((T - lambda I)^k).
$

We know by the Stabilization Theorem that there is an integer $m <= n$ for which

$
  ker((T - lambda I)^m) = dots.c = ker((T - lambda I)^n) = dots.c
$

Hence

$
  G_lambda = ker((T - lambda I)^n)
$

and therefore, $G_lambda$ is a subspace of $V$.

#proposition(number: none)[
  Let $T$ be a linear operator on a finite-dimensional vector space $V$. Suppose $lambda_1, lambda_2, ..., lambda_k$ are distinct eigenvalues of $T$. Let $v_i$ be a generalized eigenvector corresponding to $lambda_i$ for each $i = 1, ..., k$. Then $\{ v_1, v_2, ..., v_k }$ is a linearly independent set.
]

#proof[
  Suppose we have a trivial linear combination of $v_i$'s:

  $
    c_1 v_1 + dots.c + c_k v_k = bold(0)
  $

  We show $a_1 = 0$. A similar method will show $a_i = 0$ for any $i$.

  By definition, $\(T - lambda_i I)^n\(v_i) = bold(0)$. Now consider $P(T) : V -> V$ defined as

  $
    P(T) = \(T - lambda_2 I)^n \(T - lambda_3 I)^n dots.c \(T - lambda_k I)^n.
  $

  Applying $P(T)$ to both sides, we have

  $
    P(T)\(a_1 v_1) + P(T)\(a_2 v_2) + dots.c + P(T)\(a_n v_n) = bold(0).
  $

  Note that the terms of $P(T)$ commute. For any $1 <= alpha, beta <= k$,

  $
    \(T - lambda_alpha I) \(T - lambda_beta I) = T^2 - lambda_alpha T - lambda_beta T + lambda_alpha lambda_beta I = \(T - lambda_beta I) \(T - lambda_alpha I).
  $

  Hence,

  $
    \(T - lambda_alpha I)^n \(T - lambda_beta I)^n = \(T - lambda_beta I)^n \(T - lambda_alpha I)^n.
  $

  This means that, given $i >= 2$,

  $
    P(T)\(a_i v_i) & = \(T - lambda_1 I)^n \(T - lambda_2 I)^n dots.c \(T - lambda_k I)^n \(a_i v_i) \
                   & = \(T - lambda_1 I)^n dots.c \(T - lambda_i I)^n \(a_i v_i) = bold(0).
  $

  It follows that $a_1 P(T)\(v_1) = bold(0)$, so $a_1 = 0$. // TODO: this part is not quite justified. it turns out that T - lambda_j I is an invertible operator on the generalized eigenspace lambda_i where i != j, meaning that P(T) is invertible on the generalized eigenspace of lambda_1 where v_1 lives. since v is nonzero, P(T) cannot send it to the zero vector. Hence a_i = 0.
]

#proposition(number: none)[
  Let $T$ be a linear operator on a complex finite-dimensional vector space $V$, and let $lambda$ be an eigenvalue of $T$. Then $G_lambda$ is $T$-invariant.
]

#proof[
  Let $v in G_lambda$. So $(T - lambda I)^n (v) = bold(0)$. Then

  $
    (T - lambda I)^n (T(v)) & = (T - lambda I)^n (T - 0 I)(v) \
                            & = (T - 0I)(T - lambda I)^n (v) = bold(0).
  $

  Hence $T(v) in G_lambda$.
]
