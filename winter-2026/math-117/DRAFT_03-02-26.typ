#import "lecture-template.typ": *

#set document(
  title: "MATH 117 Notes Feb. 3, 2026",
  date: datetime(day: 3, month: 2, year: 2026),
)

#show: template

#remark(supplement: "Important Remark")[
  Suppose $f(n)$ is a real sequence where $limbar.u f(n) = limbar.l f(n) = ell$. Then $f(n) -> ell$ as $n -> ell$.
]

#proof[
  Given $epsilon > 0$, there is some natural number $r_1$ such that, for every $r >= r_1$,

  $
    ell - epsilon < sup { f(r), f(r + 1), ... } < ell + epsilon.
  $

  Additionally, there is another number $r_2$ such that, for all $r >= r_2$,

  $
    ell - epsilon < inf { f(r), f(r + 1), ... } < ell + epsilon.
  $

  Therefore, for any $r >= max { r_1, r_2 }$, we have

  $
    ell - epsilon < inf { f(r), f(r + 1), ... } <= f(r) <= sup { f(r), f(r + 1), ... } < ell < epsilon.
  $

  By definition, $abs(f(r) - ell) < epsilon$, and so $f(r) -> ell$ as $n -> oo$.
]

#exercise(number: none)[
  Prove the converse.
]

#box(stroke: colors.light_gray + 1.5pt, inset: 1em, width: 100%)[
  #show heading.where(level: 2): set block(below: 1em)
  #align(center)[
    == General Properties of Upper and Lower Limits
  ]

  + $limbar.l f(n) <= limbar.u f(n)$.

    This is because $inf { f(n) : n >= r } <= sup { f(n) : n >= r }$ for any $r$. Then, we can apply Lemma 11.

  + $limbar.u f(n) <= sup f(NN)$ if the supremum exists;

    $limbar.l f(n) >= inf f(NN)$ if the infimum exists.

  + If $f(n) <= g(n)$ for all sufficiently large $n$, then

    $
      limbar.u f(n) <= limbar.u g(n), thick wide limbar.l f(n) <= limbar.l g(n).
    $
]

#theorem(<14>, number: 14)[][
  Let $f(n)$ be a real sequence. Suppose that $limbar.u f(n) = Lambda$ and $limbar.l f(n) = lambda$ for some real numbers $Lambda$ and $lambda$. Then,

  + Given $epsilon > 0$, there is some natural number $n_0 in NN$ such that, for infinitely many $n >= n_0$, $f(n) > Lambda + epsilon$ and $Lambda - epsilon < f(n)$.

  + Given $epsilon > 0$, there is some natural number $n_1 in NN$ such that, for infinitely many $n >= n_1$, $f(n) > lambda - epsilon$ and $lambda + epsilon < f(n).$

  + If $Lambda'$ and $lambda'$ have the same properties respectively, then $Lambda = Lambda'$ and $lambda = lambda'$.
]

#pagebreak()

#proof[@14[--].i][
  Given $epsilon > 0$, there is some $R in NN$ such that, for every $r >= R$, we have

  $
    abs(sup { f(r), f(r + 1), ... } - Lambda) < epsilon.
  $

  Equivalently,

  $
    Lambda - epsilon < sup { f(r), f(r + 1), ... } < Lambda + epsilon.
  $

  So for all $r >= R$, we know $Lambda - epsilon$ is not an upper bound of the set ${ f(r), f(r + 1), ... }$. Thus, $Lambda - epsilon < f(r')$ for some $r' >= r >= R$, i.e. for infinitely many $r'$.

  Moreover, for all $r >= R$, we have $f(r) < Lambda + epsilon$. Then the required result follows.
]

#exercise(number: none)[
  The proof of @14[-].ii is similar. Write such a proof.
]

#proof[@14[--].iii][
  Suppose $Lambda'$ and $lambda'$ have properties (i) and (ii) respectively.

  Then, given $epsilon > 0$, we know $f(n) < Lambda + epsilon$ for sufficiently large values of $n$.

  Also, $Lambda' - epsilon < f(n)$ for infinitely many $n$.

  Choose an $n$ satisfying both of these conditions. Then,

  $
    Lambda' - epsilon < f(n) < Lambda + epsilon quad ==> quad Lambda' - Lambda = 2epsilon.
  $

  Since $epsilon$ is arbitrarily small, it follows that $Lambda' - Lambda <= 0$. Similarly, $Lambda - Lambda <= 0$, so $Lambda = Lambda'$. A similar argument shows that $lambda = lambda'$.
]

#exercise(number: none)[
  Write the argument for $lambda = lambda'$ mentioned above.
]

#corollary(number: none)[
  If $f(n)$ is a bounded sequence, then  $Lambda = lambda$ if and only if $f(n)$ tends to a limit $ell$ where $ell = Lambda = lambda$.
]

#proof[
  Suppose $Lambda = lambda$. Then given $epsilon > 0$, for all sufficiently large $n$, we have

  $
        & lambda && - epsilon < f(n) < Lambda && + epsilon \
    ==> & ell    && - epsilon < f(n) < lambda && + epsilon.
  $

  Hence, $f(n) -> ell$ as $n -> oo$.

  Conversely, if $f(n)$ tends to a limit $ell$, then $ell$ satisfies properties (i) and (ii) of @14[-], so $Lambda = lambda = ell$.
]

#pagebreak()

#theorem[The General Principle of Convergence][
  Let $f : NN -> RR$ be a sequence. Then $f(n)$ converges to some finite limit in $RR$ if and only if, given $epsilon > 0$, there is some natural number $n_0$ for which $r, s >= n_0$ implies

  $
    abs(f(r) - f(s)) < epsilon.
  $
]

#proof[
  Suppose $f(n) -> ell$ for some real limit $ell$. Then, given $epsilon > 0$, there is some $n_0 in NN$ such that, for every $n >= n_0$,

  $
    abs(f(n) - ell) < epsilon slash 2.
  $

  If $r$ and $s$ are at least $n_0$, then

  $
    abs(f(r) - f(s)) & = abs(f(r) - ell + ell - f(s)) \
                     & <= abs(f(r) - ell) + abs(f(s) - ell) \
                     & < epsilon slash 2 + epsilon slash 2 = epsilon.
  $

  Conversely, suppose that given $epsilon > 0$, there is some $n_0 in NN$ where for  all $r, s >= n_0$,
  $
    abs(f(r) - f(s)) < epsilon.
  $

  Then,

  $
    f(n_0) - epsilon < f(n) < f(n_0) + epsilon thick forall n >= n_0.
  $

  Hence, $f(n)$ is bounded, and we have

  $
    abs(f(n)) <= max { abs(f(n_0) + epsilon), abs(f(1)), abs(f(2)), ..., abs(f(n_0 - 1))}.
  $

  Thus,

  $
    f(n_0) - epsilon & <= limbar.l f(n) <= && limbar.u f(n) <= f(n_0) + epsilon \
                   0 & <= limbar.u f(n) -  && limbar.l f(n) <= 2epsilon.
  $

  Therefore, $limbar.u f(n) = limbar.l f(n)$, and $f(n)$ tends to a limit by the corollary to @14[-].
]

#remark[
  Sequences having the property of the theorem are called *Cauchy Sequences*.
]
