#import "lecture-template.typ": *

#set document(
  title: "MATH 117 Midterm 1 Exercises",
  date: datetime(day: 8, month: 2, year: 2026),
)

#show: template

#exercise[
  Given a field $S$, prove:

  #grid(
    columns: (1fr, 1fr),

    [
      + $0 dot a = 0 thick forall a in S$

      + $-(-a) = a thick forall a in S$
    ],
    [
      3. $(-1) dot a = -a thick forall a in S$

      + $(-a)(-b) = a b thick forall a, b in S$
    ],
  )
]

#exercise[
  Given an ordered field $S$, prove that if $a in S$, then $a^(-1) > 0$.
]

#exercise[
  If $A subset.eq RR$, $A$ is non-empty, and $A$ is bounded above, then $A$ has a least upper bound. Show that this least upper bound is unique.
]

#exercise[
  Complex conjugation is a bijection from $CC -> CC$, where $z |-> overline(z)$, that preserves addition and multiplication. This bijection is second-order, meaning $overline(overline(z)) = z$.

  Show that there does not exist such a map on $RR$.
]

#exercise[
  Suppose that $f(n)$ is a sequence in $RR$ which is decreasing and bounded below. Then $f(n)$ tends to a limit $ell$ as $n -> oo$.

  Prove this statement using a proof analogous to that of Theorem 12.
]

#exercise[
  Write a definition for sequences tending to negative infinity.
]

#exercise[
  Prove the converse to the Important Remark. That is, suppose $f(n)$ is a real sequence where $f(n) -> ell$ as $n -> ell$.
  Prove $limbar.u f(n) = limbar.l f(n) = ell$.
]

#exercise[
  Prove Theorem 14.ii.

  Let $f(n)$ be a real sequence. Suppose that $limbar.u f(n) = Lambda$ and $limbar.l f(n) = lambda$ for some real numbers $Lambda$ and $lambda$. Given $epsilon > 0$, prove there is some natural number $n_1 in NN$ such that, for infinitely many $n >= n_1$, $f(n) > lambda - epsilon$ and $lambda + epsilon < f(n).$
]

#exercise[
  Complete the argument that $lambda = lambda'$ in the proof of Theorem 14.iii.
]

#exercise[
  Suppose $f(n)$ and $g(n)$ are real-valued sequences. Show that

  $
    limbar.l f(n) + limbar.l g(n) <= limbar.l (f(n) + g(n)) <= limbar.u (f(n) + g(n)) <= limbar.u f(n) + limbar.u g(n).
  $
]

#exercise[
  Suppose $f(n)$ is a bounded real sequence. Prove that there exists a subsequence $f(nu(n))$ that converges to $limbar.l f(n)$.
]
