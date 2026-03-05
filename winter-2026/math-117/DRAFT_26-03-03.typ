#import "lecture-template.typ": *

#set document(
  title: "MATH 117 Notes Mar. 3, 2026",
  date: datetime(day: 3, month: 3, year: 2026),
)

#show: template

#definition(number: none)[Limits of Functions Involving Infinity][
  Let $f$ be a real function $f : RR -> RR$. Then we may say the following:

  - $f(x) -> oo$ as $x -> a$ if, given any $K > 0$, there is some $delta > 0$ such that if $x$ satisfies $0 < |x - a| < delta$, then $f(x) > K$

  - $f(x) -> -oo$  as $x -> a$ if, given any $K in RR$, there is some $delta > 0$ such that if $x$ satisfies $0 < |x - a| < delta$, then $f(x) < K$

  - $f(x) -> ell$ as $x -> oo$ if, given $epsilon > 0$, there is some $x_0$ such that for every $x >= x_0$, we have $|f(x) - ell| < epsilon$

  - $f(x) -> oo$ if, given any $K in RR$, there is some $x_0$ such that for every $x >= x_0$, we have $f(x) > K$

  Note that saying $f(x) -> ell$ as $x -> -oo$ is equivalent to saying $f(-x) -> ell$ as $x -> oo$.
]

#definition(number: none)[One-Sided Limits and Continuity][
  If $f$ is a real function, we say that $f(x) -> ell$ as $x$ *tends to $bold(a)$ from the right*, written $x -> a^+$, if given $epsilon > 0$, there exists $delta > 0$ such that if $a < x < a + delta$, then we have $|f(x) - ell| < epsilon$.

  Similarly, we say $f(x) -> ell$ as $x$ *tends to $bold(a)$ from the left*, written $x -> a^-$, if given $epsilon > 0$, there is a $delta > 0$ such that if $a - delta < x < a$, then $|f(x) - ell| < epsilon$.

  We say $f$ is *continuous on the right of $bold(a)$* if $f(x) -> f(a)$ as $x -> a^+$, and we have a similar notion for continuity on the left of $a$.
]

#definition(number: none)[Real Intervals][
  Suppose $a$ and $b$ are real numbers where $a < b$.

  - The *closed interval* from $a$ to $b$ is

    $
      { x in RR : a <= x <= b } = [a, b].
    $

  - The *open interval* from $a$ to $b$ is

    $
      { x in RR : a < x < b } = (a, b).
    $

  - The *half-open interval* from $a$ to $b$ is

    $
      { x in RR : a < x <= b } = (a, b].
    $

  We may tweak the notation to describe the following sets:

  $
     { x in RR : x < b } & = ( && - oo, &  b) \
    { x in RR : x <= b } & = ( && - oo, &  b] \
     { x in RR : a < x } & = ( && a,    & oo) \
    { x in RR : a <= x } & = [ && a,    & oo] \
  $

  Finally, this notation may describe the real numbers as a whole:

  $
    RR = { x in RR } = (-oo, oo)
  $
]

#definition(number: none)[Continuity Over an Interval][
  If $f$ is a real function $f : [a, b] -> RR$, then saying $f$ is continuous means that $f$ is continuous at every point $c in [a, b]$, _and_ $f$ is continuous on the right of $a$, _and_ $f$ is continuous on the left of $b$.

  Equivalently, for every point $c in [a, b]$, given $epsilon > 0$, there is a $delta > 0$ such that if $|x - c| < delta$, then $|f(x) - f(c)| < epsilon$.
]

#theorem(number: 40)[The Intermediate Value Theorem][
  Suppose that $f : [a, b] -> RR$ is a continuous function. Then on the interval $[a, b]$, $f$ takes every value between $f(a)$ and $f(b)$.

  // TODO: add a diagram!
]

#proof[
  Without loss of generality, suppose that $f(a) < f(b)$, and take $v$ to be a real number where $f(a) < v < f(b)$. We aim to find a $xi in [a, b]$ for which $f(xi) = v$.

  Let $S$ be the set defined by

  $
    S = { x in [a, b] : f(x) < v }.
  $

  Since $f(a) < v$, we have $a in S$, meaning $S$ is nonempty. Additionally, $b$ is an upper bound of $S$. It follows that $S$ has a least upper bound. Let $xi = sup(S)$. Hence we have $a <= xi <= b$, so $xi in [a, b]$.

  Now, either $f(xi)$ is less than $v$, greater than $v$, or equal to $v$. We disprove the first two cases to show $f(xi) = v$.

  + Suppose $f(xi) < v$. Since $f$ is continuous at $xi in [a, b]$, there exists a $delta > 0$ such that if $xi <= x <= xi + delta$, we get

    $
      |f(x) - f(xi)| < v - f(xi).
    $

    Unwinding this inequality gives

    $
      f(x) < f(xi) + (v - f(xi)) = v.
    $

    Thus, $xi$ is not an upper bound of $S$. For example, since $xi + delta slash 2 < xi + delta$, we get that $f(xi + delta slash 2) < v$, so $xi + delta slash 2 in S$. This is a contradiction.

  + Suppose $f(xi) > v$. Then there is some $delta > 0$ such that if $xi - delta < x <= xi$, we have

    $
      |f(x) - f(xi)| < f(xi) - v quad ==> quad f(xi) - (f(xi) - v) < f(x) quad ==> quad v < f(x).
    $

    That is, $x in.not S$. So $xi$ is not the least upper bound of $S$. For example, $xi - delta slash 2$ would be a smaller lower bound. This is again a contradiction.

  The only remaining possibility is $f(xi) = v$.
]

#proof(supplement: "Alternative Proof")[
  Let $xi = sup(S)$, as above. Now, let $x_n = xi - 1 slash n$. Since $xi$ is the supremum of $S$, there is some $s_n in S$ for which $x_n <= s_n < xi$ for any $n$.

  Since $lim x_n = xi$, we also have $s_n -> xi$.

  As $f$ is continuous at $xi$, it follows that $lim f\(s_n) = f(xi)$ as well. Additionally, because $s_n in S$ for every $n$, we have $f\(s_n) < v$. This implies that $f(xi) <= v$.

  #let yt = $accent(y, tilde)$

  Let $y_n = xi + 1 slash n$. Define $yt_n = min \{ y_n, b}$. Then $yt_n$ is not in $S$, since both $y_n$ and $b$ are strictly greater than $xi = sup(S)$. Hence $f\(yt_n) >= v$.

  Furthermore, since $lim yt_n =xi$, we have $f(xi) >= v$.
]

#example(number: 1)[
  Suppose $f : [0, 1] -> RR$ is a continuous real function where $f([0, 1]) subset.eq [0, 1]$. Then there is some point $p in [0, 1]$ such that $f(p) = p$.

  #proof[
    Let $g : [0, 1] -> RR$ be a function defined by $g(x) = x - f(y)$. Then $g$ is continuous since it s a difference of two other continuous functions.

    We know $g(0) = 0 - f(0)$, so $g(0) <= 0$. Additionally, $g(1) = 1 - f(1)$, but $f(1)$ is contained in $[0, 1]$, meaning $g(1) >= 0$.

    Hence the Intermediate Value Theorem implies that there is some $p in [0 , 1]$ such that $g(p) = 0$, or $f(p) = p$, as required.
  ]

  Note that this is a one-dimensional fixed-point theorem.
]

#example(number: 2)[
  Suppose that $f : RR -> RR$ is a real function defined by

  $
    f(x) = cases(sin(1 slash x) &"if" x != 0, 0 &"if" x = 0)
  $

  Then $f$ is not continuous at $x = 0$, but on every interval $[a, b] subset.eq RR$, $f$ satisfies the conclusion of Theorem 40. So the converse of this theorem is not necessarily true. Another example is Conway's base 13 function.

  // TODO: DIAGRAM!
]
