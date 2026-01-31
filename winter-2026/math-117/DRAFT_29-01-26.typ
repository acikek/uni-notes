#import "template.typ": *

#set document(
  title: "MATH 117 Notes Jan. 29, 2026",
  date: datetime(day: 29, month: 1, year: 2026),
)

#show: doc => template(doc, draft: true)

#example(number: 4)[][
  $limits(lim)_(n -> oo) n^(1 slash n) = 1$.
]

#proof[
  Write $n^(1 slash n)$ as $1 + delta(n)$ where $delta(n) >= 0$. Then

  $
    n & = (1 + delta(n))^n \
      & = 1 + n delta(n) + (n(n - 1)delta(n)^2)/(2!) + dots.c + delta(n)^n \
      & >= (n(n - 1)delta(n)^2)/(2!)
  $

  Isolating $delta(n)$, we find

  $
    sqrt(2 / (n - 1)) >= d(n) >= 0.
  $

  Now $sqrt(2 / (n - 1)) -> 0$ as $n -> oo$ by Example 2. Then, by Lemma 11, $delta(n) -> 0$ as $n -> oo$.

  Therefore, $n^(1 slash n) -> 1$ as $n -> oo$.
]

#example(number: 5)[
  $(1 + 1 / n)^n$ tends to some limit $e$ for which $2 <= e <= 3$.
]

#proof()[
  #[
    #set math.equation(numbering: "(1)")

    Using the binomial theorem, we get

    $
      (1 + 1/n)^n = 1 + n dot 1/n + n(n - 1) / (2!) dot 1 / (n^2) + (n(n - 1)(n - 2)) / 3! dot 1 / (n^3) + dots.c + (1 / n)^n.
    $ <5:1>

    The $(r + 1)$st term of this expansion is

    $
      1 / (r! dot n^r) dot n(n - 1) dots.c (n - r + 1) = 1 / (r!) (1 - 1/n)(1 - 2/n) dots.c (1 - (r - n)/n).
    $ <5:2>
  ]

  The $(r + 1)$st term increases as $n$ increases since each term in the product increases. As $n$ increases, the number of terms in the expansion of $(1 + 1/n)^n$, which is $n + 1$, also increases. Hence, $(1 + 1/n)^n$ increases as $n$ increases.

  To establish an upper bound on the sequence, @5:2 tells us that the $r$th term of the expansion in @5:1 is at most $1 slash r!$. Then,

  $
    (1 + 1/n)^n & < 1 + 1 + 1/(2!) + 1/(3!) + dots.c + 1/(n!) \
                & < 1 + 1 + 1/2 + 1/(2^2) + dots.c + 1/(2^(n - 1)) \
                & = 3 - 1 / (2^(n - 1)) < 3.
  $

  So $(1 + 1/n)^n$ is increasing and is bounded above. Therefore,

  $
    lim_(n -> oo) (1 + 1/n)^n "exists, and" quad lim_(n -> oo)(1 + 1/n)^n <= 3.
  $
]

#definition()[
  Let $f, g : NN -> RR$ be real sequences. Then we introduce the following notation.

  + $f = O(g)$ or $f(n) = O(g(n))$ if there is some constant $K in RR$ and some $n_0 in NN$ for which

    $
      |f(n)| < K|g(n)| thick forall n >= n_0.
    $

  + $f = o(g) "or" f(n) = o(g(n)) quad <==>quad f(n) slash g(n) -> 0 "as" n -> oo$.

  + $f ~ g "or" f(n) ~ g(n) quad <==> quad f(n) slash g(n) -> 1 "as" n -> oo$.
]

#example()[
  Let $f(n) = 2n^3 + 3n^2 + 27$.
  + $f(n) = O(n^3)$ since $|f(n)| < 3n^3$ if $3n^2 + 27 <= n^3$, which is true when $n >= 5$.

  + $f(n) = o(n^4)$.

  + $f(n) ~ 2n^3 + 5n + 1$.
]

#example()[
  + $n = O(n^2)$, and $n = o(n^2)$, but $n tilde.not n^2$.

  + $n + sin(n) ~ n$.
]

#note()[
  You should _*never, ever*_ write $f(n) -> g(n)$ as $n -> oo$, because we have no precise definition of what this means.

  _There is a special place in hell for people who write this. People shouldn't commit crimes either, but this is much worse. At least, frequently, crimes are meaningful._
]

#definition()[
  If $f : NN -> RR$, then $f$ is said to *tend to infinity* if, given any $K in RR$, there is a natural number $n_0$ such that $f(n) >= K$ for all $n >= n_0$.

  We write this as

  $
    f(n) -> oo "as" n -> oo, quad "or" quad limits(lim)_(n -> oo) f(n) = oo.
  $
]

#exercise()[
  Write a similar definition for sequences tending to negative infinity.
]

#note()[
  Saying that a sequence tends to infinity is different from saying it is unbounded.

  For example, $f(n) = (-1)^n n^2$ is unbounded, but does not tend to infinity.
]

#lemma(<13>, number: 13)[][
  + An unbounded monotonic sequence tends to either $+oo$ or $-oo$.

  + Let $f$ be a sequence such that $f(n) > 0$ for all sufficiently large $n$. Then, as $n$ approaches infinity,

  $
    f(n) -> 0 quad <==> quad 1 slash f(n) -> oo.
  $
]

#proof[@13[--].i][
  Suppose, without much loss of generality, that $f(n)$ is strictly increasing and unbounded. Then, given $K in RR$, $K$ is not an upper bound of the set

  $
    f(NN) = { f(n) : n in NN }.
  $

  Thus, there is some $n_0 in NN$ for which $K < f(n_0)$. For any $n >= n_0$, it is still true that $K < f(n).$
]

#proof[@13[--].ii][
  If $1 slash f(n) -> oo$, then $1 slash f(n)$ is defined for all sufficiently large $n$. Then, given $epsilon > 0$, there is some $n_1 in NN$ for which $1 slash epsilon < 1 slash f(n)$ for all $n >= n_1$. So

  $
    0 < f(n) < epsilon thick forall n >= n_1
  $

  and thus $f(n) -> oo$ as $n -> oo$.

  If $f(n) -> 0$ as $n -> oo$, then given $K in RR$ with $K > 0$, there is some $n_2 in NN$ for which $|f(n)| < 1 slash K$ for all $n >= n_2$.

  Then, since $f(n) > 0$, we can rewrite the inequality as

  $
    K < 1 slash f(n) thick forall n >= n_2
  $

  proving that $1 slash f(n) -> oo$ as $n -> oo$.
]

= Upper and Lower Limits of Real Sequences

#definition(number: none)[
  Let $f : NN -> RR$ be a sequence. If $f(NN)$ is bounded above, we define the *upper limit* of $f(n)$ as $n$ tends to infinity to be

  $
    lim_(r -> oo) sup { f(r), f(r + 1), f(r + 2), ...}.
  $

  If $f(NN)$ is bounded below, we define the *lower limit* of $f(n)$ to be

  $
    lim_(r -> oo) inf { f(r), f(r + 1), f(r + 2), ...}.
  $

  We introduce the following notation for upper and lower limits respectively:

  $
    limsup_(n -> oo) f(n) = ulim(n) f(n) quad quad liminf_(n -> oo) f(n) = llim(n) f(n)
  $

  If $f(NN)$ is not bounded above, we define $ulim(n) f(n)$ to be $+oo$.

  Similarly, if $f(NN)$ is not bounded below, we define $llim(n) f(n)$ to be $-oo$.
]

#remark()[
  The precise definitions of upper and lower limits above can be understood using properties of suprema and infima. Suppose $A subset.eq B subset.eq RR$ and $B$ is bounded above. Recall that $A$ must also be bounded above, and $sup(A) <= sup(B)$.

  Thus the expression in the definition of the upper limit of $f(n)$ is a decreasing function. That is,

  $
    sup { f(r), f(r + 1), ... } >= sup { f(r + 1), f(r + 2), ...}.
  $

  Therefore, this function either tends to a limit (Theorem 12) or to $-oo$ (@13[-]).

  Similarly, the sequence in the definition of the lower limit is increasing, so its limit is either a real number $ell$ or $+oo$.
]

#example()[
  + Let $f(n) = (-1)^n + 1 slash n$.

    Then $ulim(n) f(n) = 1$ since $1 + 1 slash r -> 1$ as $r -> oo$. Similarly, $llim(n) f(n) = -1$.

  + Let $r : NN -> QQ$ be an enumeration of the rationals, i.e. a bijection. Then
    $
        ulim(n) r(n) = +oo & quad llim(n) r(n) = -oo  && \
      ulim(n) |r(n)| = +oo & quad llim(n) |r(n)| = 0. &&
    $

  + If $f(n) = n$, then $ulim(n) f(n) = oo = llim(n) f(n)$.
]
