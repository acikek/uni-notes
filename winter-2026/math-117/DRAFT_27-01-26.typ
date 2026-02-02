// TODO: Credit E.G.

#import "template.typ": *

#set document(
  title: "MATH 117 Notes Jan. 27, 2026",
  date: datetime(day: 27, month: 1, year: 2026),
)

#show: doc => template(doc, draft: true)

#lemma(<11>, number: 11)[][
  + Let $f(n)$ and $g(n)$ be sequences in $RR$ with $f(n) -> ell$, $g(n) -> m$ as $n -> oo$. Suppose that $f(n) <= g(n)$ for all sufficiently large $n$. Then $ell <= m$.

  + Suppose that $f(n) <= g(n) <= h(n)$ for all sufficiently large $n$, and $f(n) -> ell, h(n) -> ell$ as $n -> oo$. Then $g(n)$ converges, and $g(n) -> ell$ as $n -> oo$.
]

#proof[@11[--].i][
  We are given that $exists n_0 in NN$ such that $f(n) <= g(n) thick forall n >= n_0$.

  Given $epsilon > 0$, $exists n_1 in NN$ such that $forall n >= n_1$, $|f(n)- ell| < epsilon$, and $exists n_2 in NN$ such that $forall n >= n_2$, $|g(n) - m| < epsilon$. Hence $forall n >= max { n_0, n_1, n_2 }$, we have

  $
    ell - epsilon < f(n) <= g(n) < m + epsilon
  $

  So $ell - m < 2epsilon$.

  Now we cannot have $ell - m > 0$, because in this case, all we would have to do is choose $epsilon = (ell - m) slash 2$ and obtain $ell - m < ell - m$, which is a contradiction. So $ell - m <= 0$, i.e. $ell <= m$.
]

#corollary(number: none)[][
  If $f(n) <= K$ for all sufficiently large $n$, and $f(n) -> ell$ as $n -> oo$, then $ell <= K$. (This is obtained from the above by setting $g(n) = K thick forall n$.)
]

#note()[
  Set $f(n) = 1 - 1 slash n$. ($star$)

  Then $lim_(n -> oo)(1 - 1 slash n) = 1$.

  We have $f(n) < K ==> f(n) <= K ==> ell <= K$ i.e. the inequality is not strict; we must have $ell <= K$ as ($star$) shows with $ell = K = 1$.
]

#proof[@11[--].ii][
  $exists n_0 in NN$ such that $forall n >= n_0$, $f(n) <= g(n) < h(n)$. Given $epsilon > 0$, $exists n_1, n_2$ such that $forall n >= n_1, |f(n) - ell| < epsilon$ and $forall n >= n_2, |h(n) - ell| < epsilon$. Hence if $n >= max { n_1, n_2, n_3 }$, then

  $
    ell - epsilon < f(n) <= g(n) <= h(n) < ell + epsilon.
  $

  $
    ==> |g(n) - ell| < epsilon.
  $

  Hence $g(n)$ converges, and $g(n) -> ell$ as $n -> oo$.
]

#example[
  $
    0 < 1 / (n sqrt(n)) <= 1 / n.
  $

  We know that $lim_(n -> oo) = 0$. Hence $lim_(n -> oo) 1 / (n sqrt(n))$ exists and is equal to zero.
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
  + $f$ is bounded above (i.e. $exists K in RR$ such that $f(n) <= K thick forall n$)

  Then $f$ converges to some limit.
]

#proof[
  Let $ell = sup { f(n) : n in NN }$.

  [Let $F = { f(n) : n in NN }$, the set of all values of the sequence. Note that $K$ is an upper bound of $F$, and so $sup(F)$ exists by the upper bound (or completeness) axiom].

  Then $f(n) <= ell thick forall n in NN$.

  But, given $epsilon > 0$, $ell - epsilon$ is not an upper bound of $F$.

  Therefore, $exists n_0 in NN$ such that $ell - epsilon < f(n_o)$.

  Since $f$ is increasing, $forall n >= n_0$, we have $f(n_0) <= f(n)$.

  So $forall n >= n_0$, $ell - epsilon < f(n_0) <= f(n) <= ell < ell + epsilon$ i.e. $abs(f(n) - ell) < epsilon$, and this proves the result.
]

#corollary(number: none)[
  Suppose that $f(n)$ is a sequence in $RR$ which is decreasing and bounded below. Then $f(n)$ tends to a limit $ell$ as $n -> oo$.
]

#proof[
  $f(n)$ decreasing $=> -f(n)$ increasing.

  $f(n)$ bounded below $=> -f(n)$ bounded above.

  @12[-] implies that $-f(n) -> -ell$ for some $ell$.

  Hence $f(n) -> ell$ as $n -> oo$.
]

#exercise(number: none)[
  Alternatively, use an analogous proof to that of @12[-].
]

#example[
  Suppose that $0 < k < 1$, $k in RR$. Then $k^n -> 0$ as $n -> oo$.
]

#proof[
  If $f(n) = k^n$, then $f(n)$ is decreasing, and $f(n) > 0 thick forall n$. Hence $k^n -> ell$ where $ell >= 0$.

  Suppose $k^n -> ell$. Then $k dot k^n -> k dot ell$. But $k dot k^n = k^(n + 1)$, and this is the same sequence. Hence $k^(n + 1) -> ell$. Therefore $k dot ell = ell$. Since $k != 1$, it follows that $ell = 0$.
]

#example[
  If $q$ is a positive integer, then $1 / (n^(1 slash q)) -> 0$ as $n -> oo$.
]

#proof[
  $f(n) = n^(-1 slash q)$ is a decreasing function of $n$, and $n^(-1 slash q) > 0$. So, by @12[-], $n^(-1 slash q)$ tends to a limit $ell >= 0$, as $n -> oo$. Now,

  $
    1 / (n^(1 slash q)) -> ell quad & ==> quad 1/n -> ell^q \
                                    & ==> quad ell^q = 0 \
                                    & ==> quad ell = 0.
  $

  (Similarly, if $p in NN$, then $(1 / (n^(1 slash q)))^p -> 0$ as $n -> oo$).
]

#example[
  Suppose that $k > 0$. Then $k^(1 slash n) -> 1$ as $n -> oo$.
]

#proof[
  If $k > 1$, then the sequence $k^(1 slash n)$ is decreasing, and $k^(1 slash n) >= 1$. So @12[-] implies that $k^(1 slash n) -> ell$ for some $ell >= 1$.

  Suppose that $ell = 1 + delta$, $delta > 0$.

  Now

  $
            k^(1 slash n) & >= ell = 1 + delta "(Theorem 12)" \
              therefore k & >= (1 + delta)^n \
                          & = 1 + n delta + n (n - 1) delta^2 + dots.c + delta^n \
                          & >= 1 + n delta quad forall n \
    therefore (k - 1) / n & >= delta quad forall n
  $

  Since $delta > 0$, this is a contradiction (since the sequence tends to 0), and so we must have $delta = 0$.

  If $k < 1$, then $1 / k > 1$, and so $(1 / k)^(1 slash n) -> 1$, and therefore $k^(1 slash n) -> 1$ as $n -> oo$.
]
