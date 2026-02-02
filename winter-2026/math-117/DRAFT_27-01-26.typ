// TODO: Credit E.G.

#import "template.typ": *

#set document(
  title: "MATH 117 Notes Jan. 27, 2026",
  date: datetime(day: 27, month: 1, year: 2026),
)

#show: doc => template(doc, draft: true)

#lemma(<11>, number: 11)[][
  + Let $f(n)$ and $g(n)$ be sequences in $RR$ with $f(n) -> ell$ and  $g(n) -> m$ as $n -> oo$. Suppose that $f(n) <= g(n)$ for all sufficiently large $n$. Then $ell <= m$.

  + Suppose that $f(n) <= g(n) <= h(n)$ for all sufficiently large $n$. Suppose further that $f(n) -> ell$ and $h(n) -> ell$ as $n -> oo$. Then $g(n)$ converges, and $g(n) -> ell$ as $n -> oo$.
]

#proof[@11[--].i][
  We are given that, for some natural number $n_0$, $f(n) <= g(n)$ for all $n >= n_0$. Additionally, given $epsilon > 0$, there are also numbers $n_1$ and $n_2$ for which

  $
    abs(f(n) - ell) & < epsilon thick forall n >= n_1 \
         |g(n) - m| & < epsilon thick forall n >= n_2.
  $

  Hence, for all values of $n >= max{ n_0, n_1, n_2 }$, we have

  $
    ell - epsilon < f(n) <= g(n) < m + epsilon
  $

  Thus, $ell - m < 2epsilon$.

  If $ell - m > 0$, we could choose $epsilon = (ell - m) slash 2$, which would imply $ell - m < ell - m$, a contradiction. Therefore, $ell - m <= 0$, and so $ell <= m$.
]

#corollary(number: none)[][
  If $f(n) <= K$ for all sufficiently large $n$, and $f(n) -> ell$ as $n -> oo$, then $ell <= K$. (This is obtained from the above by setting $g(n) = K$ for all $n$.)
]

#note()[
  Let $f(n) = 1 - 1 slash n$. Then $f(n) < 1$ for all $n$, but $limits(lim)_(n -> oo) f(n) = 1$. Here, the limit of $f(n)$ does not fall under the same strict inequality that the sequence itself does. More generally, $f(n) < K$ implies $f(n) <= K$, meaning $limits(lim)_(n -> oo) f(n) <= K$.
]

#proof[@11[--].ii][
  There is some $n_0 in NN$ such that for all $n >= n_0$,

  $
    f(n) <= g(n) <= h(n).
  $

  Given $epsilon > 0$, there are also natural numbers $n_1$ and $n_2$ such that

  $
    |f(n) - ell| < & epsilon thick forall n >= n_1 \
    |h(n) - ell| < & epsilon thick forall n >= n_2.
  $

  Hence, if $n >= max { n_1, n_2, n_3 }$, then

  $
    ell - epsilon < f(n) <= g(n) <= h(n) < ell + epsilon.
  $

  By definition, this means $g(n)$ converges to $ell$ as $n -> oo$.
]

#example[
  $
    0 < 1 / (n sqrt(n)) <= 1 / n.
  $

  We know that $limits(lim)_(n -> oo) = 0$. Hence, $limits(lim)_(n -> oo) 1 / (n sqrt(n))$ exists and is equal to zero.
]

#definition(number: none)[
  Let $f(n)$ be a sequence in $RR$.

  - We say that $f(n)$ is *increasing* if $n_1 <= n_2 => f(n_1) <= f(n_2)$.

  - We say that $f(n)$ is *decreasing* if $n_1 <= n_2 => f(n_1) >= f(n_2)$.

  - $f$ is *strictly increasing* if $n_1 < n_2 => f(n_1) < f(n_2)$.

  - $f$ is *strictly decreasing* if $n_1 < n_2 => f(n_1) > f(n_2)$.

  - $f$ is (_strictly_) *monotonic* if $f$ is (_strictly_) increasing or decreasing.
]

#theorem(<12>, number: 12)[][
  Let $f(n)$ be a sequence in $RR$. Suppose that

  + $f$ is increasing
  + $f$ is bounded above; that is, there is some $K in RR$ such that $f(n) <= K$ for all $n$

  Then $f$ converges to some limit.
]

#proof[
  Let $F = { f(n) : n in NN }$ be the set of all values in the sequence. Moreover, let $ell = sup(F)$, which exists because $K$ is an upper bound of $F$. Then $f(n) <= ell$ for all values of $n$.

  Since $ell$ is the least upper bound, $ell - epsilon$ is not an upper bound of $F$ for any $epsilon > 0$. Therefore, there exists a natural number $n_0$ for which $ell - epsilon < f(n_o)$.

  Since $f$ is increasing, for every $n >= n_0$, we have $f(n_0) <= f(n)$. It follows that

  $
    ell - epsilon < f(n_0) <= f(n) <= ell <= ell + epsilon thick forall n >= n_0.
  $

  Equivalently, $abs(f(n) - ell) < epsilon$. This proves the result.
]

#corollary(number: none)[
  Suppose that $f(n)$ is a sequence in $RR$ which is decreasing and bounded below. Then $f(n)$ tends to a limit $ell$ as $n -> oo$.
]

#proof[
  If $f(n)$ is decreasing, then $-f(n)$ is increasing. Additionally, if $f(n)$ is bounded below, then $-f(n)$ is bounded above. @12[-] implies that $-f(n)$ converges to some limit $ell$. Hence, $f(n) -> ell$ as $n -> oo$.
]

#exercise(number: none)[
  Alternatively, use an analogous proof to that of @12[-].
]

#example[
  Suppose $k$ is a real number where $0 < k < 1$. Then $k^n -> 0$ as $n -> oo$.
]

#proof[
  The sequence $k^n$ is decreasing, and $k^n > 0$ for every $n$. Hence, $k^n -> ell$ where $ell >= 0$.

  Suppose $k^n -> ell$. Then $k dot k^n -> k dot ell$. But $k dot k^n = k^(n + 1)$, and this is the same sequence. Hence $k^(n + 1) -> ell$, and $k dot ell = ell$. Since $k != 1$, it follows that $ell = 0$.
]

#example[
  If $q$ is a positive integer, then $1 / (n^(1 slash q)) -> 0$ as $n -> oo$.
]

#proof[
  $f(n) = n^(-1 slash q)$ is a decreasing function of $n$, and $n^(-1 slash q) > 0$. So, by @12[-], the sequence $n^(-1 slash q)$ tends to a limit $ell >= 0$ as $n -> oo$. Now,

  $
    1 / (n^(1 slash q)) -> ell quad & ==> quad 1/n -> ell^q \
                                    & ==> quad ell^q = 0
                                      quad ==> quad ell = 0.
  $

  Similarly, if $p$ is a natural number, then $(1 / (n^(1 slash q)))^p -> 0$ as $n -> oo$.
]

#example[
  Suppose that $k > 0$. Then $k^(1 slash n) -> 1$ as $n -> oo$.
]

#proof[
  If $k > 1$, then the sequence $k^(1 slash n)$ is decreasing, and $k^(1 slash n) >= 1$. @12[-] tells us that $k^(1 slash n) -> ell$ for some $ell >= 1$.

  Suppose that $ell = 1 + delta$ for some $delta >= 0$. Then for all $n$,

  $
    k^(1 slash n) & >= ell = 1 + delta \
                k & >= (1 + delta)^n \
                k & = 1 + n delta + n (n - 1) delta^2 + dots.c + delta^n \
                k & >= 1 + n delta. \
                  \
  $

  Therefore,

  $
    (k - 1) / n & >= delta.
  $

  The left-hand sequence tends to zero, so $delta$ must equal $0$, meaning $ell = 0$.
]
