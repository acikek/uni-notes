#import "lecture-template.typ": *

#set document(
  title: "MATH 117 Notes Feb. 5, 2026",
  date: datetime(day: 5, month: 2, year: 2026),
)

#show: template

#exercise(number: none)[
  Suppose $f(n)$ and $g(n)$ are real-valued sequences. Show that

  $
    limbar.l f(n) + limbar.l g(n) <= limbar.l (f(n) + g(n)) <= limbar.u (f(n) + g(n)) <= limbar.u f(n) + limbar.u g(n).
  $
]

Continuing our discussion about the Principle of General Convergence, we first generalize it to complex numbers then use another method to prove the converse. We restate the theorem below.

#theorem(<15>, number: 15)[The General Principle of Convergence][
  Let $f : NN -> RR$ be a sequence. Then $f(n)$ converges to some finite limit in $RR$ if and only if, given $epsilon > 0$, there is some natural number $n_0$ for which $r, s >= n_0$ implies

  $
    abs(f(r) - f(s)) < epsilon.
  $
]

The proof we gave last lecture does not hold in the complex plane, since we have not yet defined the concept of upper and lower limits for complex sequences. Nevertheless, we can use the same theorem over real sequences to prove the complex case.

#remark[
  @15[-] is true for complex sequences of the form $f : NN -> CC$.
]

#proof[
  Use @15[-] on the real and imaginary parts of $f(n)$, where

  $
    abs(Re(f(r)) - Re(f(s))) & <= abs(f(r) - f(s)) \
    abs(Im(f(r)) - Im(f(r))) & <= abs(f(r) - f(s)).
  $

  Hence, if $f : NN -> CC$ is a Cauchy sequence, then $Re(f(n))$ converges, so $f(n)$ converges.
]

We now prove @15[-] without using upper or lower limits.

#proof[
  The forward direction stands as before.

  In the converse direction, suppose $f : NN -> RR$ is a sequence and that given $epsilon > 0$, there is some number $n_0$ such that for all $r, s >= n_0$,

  $
    |f(r) - f(s)| < epsilon.
  $

  Let $S = { f(n) : n in NN } subset.eq RR$ be the set of all values of $f(n)$. Then $S$ is bounded because $|f(n)| <= B$ for every $n$ if we take $B$ to be

  $
    B = max { |f\(n_0\) + epsilon|, f(1), f(2), ..., f\(n_0 - 1\) }.
  $

  Suppose $S$ is a finite set. then there is some real number $ell$ such that $f(n) = ell$ for infinitely many $n$. Hence, $f(n) = ell$ for some $n >= n_0$.

  \

  Then, for all $r >= n_0$, choose $s >= n_0$ such that $s = ell$. We obtain

  $
    |f(r) - f(s)| = |f(r) - ell| < epsilon quad forall r >= n_0.
  $

  Therefore, $f -> ell$.

  In the case where $S$ is infinite, we have

  $
    -B <= f(n) <= B quad forall n in NN.
  $

  We now use the technique of repeated bisection. Our goal is essentially to bisect the values of $f(n)$, choose the section that contains infinitely many values, and repeat. Inductively, we will show that $f(n)$ is a Cauchy sequence.

  Construct a sequence

  $
    a_0 <= a_1 <= a_2 <= dots.c <= b_2 <= b_1 <= b_0
  $

  where $a_0 = -B$, and $b_0 = B$. Note that all values of $S$ must lie between $a_0$ and $b_0$.

  Now, select $a_1$ and $b_1$ such that $a_1 < b_1$ and

  $
    b_1 - a_1 = (b_0 - a_0) / 2 = (2B) / 2.
  $

  We require there to exist infinitely many values of $S$ between $a_1$ and $b_1$. For example, choose $a_1 = a_0$ and $b_1 = (a_0 + b_0) slash 2$ if possible; otherwise, choose \
  $a_1 = (a_0 + b_0) slash 2$ and $b_1 = b_0$.

  #align(center)[
    _TODO: Insert a diagram here!_
  ]

  Inductively, choose $a_n$ and $b_n$ such that

  $
    a_(n - 1) <= a_n < b_n <= b_(n - 1), wide b_n - a_n = (2B) / (2^n)
  $

  and there exists infinitely many members of $S$ between $a_n$ and $b_n$.

  Then $a_n$ forms an increasing bounded sequence. Thus, $a_n$ tends to $ell$ for some real number $ell$.

  #note[
    Importantly, $ell$ is not necessarily a rational number.

    _The rational numbers are not complete. When the Ancient Greeks discovered this, they started killing themselves._
  ]

  It follows that

  $
    b_n = a_n + B / (2^(n - 1)) --> ell + 0 quad "as" n -> oo.
  $

  #colbreak()

  Hence, there is some $n_1 in NN$ such that, for all $n >= n$,

  $
    ell - epsilon < a_n < b_n < ell + epsilon.
  $

  Therefore, there are infinitely many elements of $S$ between $ell - epsilon$ and $ell + epsilon$. Furthermore, there is a number $s_0 >= n_0$ for which

  $
    ell - epsilon < f\(s_0\) < ell + epsilon quad <==> quad |f\(s_0\) - ell| < epsilon.
  $

  Thus, if $r >= n_0$, we have

  $
    |f(r) - ell| <= |f(r) - f\(s_0\)| + |f\(s_0\) - ell| < epsilon + epsilon = 2epsilon.
  $

  Therefore, $f(r) -> ell$ as $n -> oo$.
]

= Subsequences

#definition(number: none)[Subsequence][
  Let $f : NN -> S$ be a sequence in a set $S$. A *subsequence* of $f$ is a sequence $f(mu(n))$ where

  $
    mu : NN --> NN, quad f compose mu : NN --> S
  $

  and $mu$ is a strictly increasing function. That is, if $f(1), f(2), ...$ is the original sequence, then $f(mu(1))$, $f(mu(2)), ...$ is a subsequence.

  In plain English, a subsequence is a subcollection of the terms in the same order.

  If we have a sequence $a_n$, we may notate a subsequence as $a_n_1$, $a_n_2$, and so on.
]

#remark[
  If $f(n)$ is a sequence in $RR$ or $CC$, and $f(n) -> ell$ as $n -> oo$, then any subsequence $f(mu(n))$ also converges to $ell$.
]

#proof[
  Given $epsilon > 0$, there is a natural number $n_0$ such that

  $
    |f(n) - ell| < epsilon quad forall n >= n_0.
  $

  So, if $mu(n) >= n_0$, then we also get $|f(mu(n)) - ell| < epsilon$ since $mu$ is strictly increasing.
]

#note[
  The sequence $f(n) = (-1)^n$ does not converge. However, if $mu(n) = 2n$, then $f(mu(n)) = 1$ for all $n$. Similarly, if $mu(n) = 2n + 1$, then $f(mu(n))$ is always $-1$.

  The moral here is that a sequence that does not converge may have subsequences that do.
]

#proposition(<16>)[][
  Suppose $f(n)$ is a bounded real sequence. Then there exists a subsequence $f(mu(n))$ that converges to $limbar.u f(n)$.
]

#proof[
  Let $Lambda = limbar.u f(n)$. Then, by Theorem 14, there exists a number $n_1$ for which

  $
    & f(n) < Lambda + 1 quad forall n >= n_1 \
    & f(n) > Lambda - 1 quad "for infinitely many" n.
  $

  Let $mu(1)$ be the least value of $n$ satisfying both conditions.

  Inductively, there is an $n_r$ such that

  $
    & f(n) < Lambda + 1 slash r quad forall n >= n_r \
    & f(n) > Lambda - 1 slash r quad "for infinitely many" n.
  $

  Let $mu(r)$ be the least integer satisfying both conditions with the added requirement that $mu(r) > mu(r - 1)$.

  Then we have a subsequence defined inductively, and $f(mu(r)) -> Lambda$ as $r -> oo$.
]

#exercise(number: none)[
  Prove that there exists a subsequence $f(nu(n))$ that converges to $limbar.l f(n)$.
]

#note[
  If $limbar.u f(n) = oo$, i.e. if $f(n)$ is unbounded above, then we can let $mu(r)$ be the smallest $n$ such that $f(n) >= r$ and $n > mu(r - 1)$. Then $f(mu(r)) -> oo$ as $n -> oo$.
]

#note[
  @16[-] implies that every sequence of real numbers, bounded above or below, has a convergent subsequence. This is known as the *Bolzano-Weierstrass theorem*.
]
