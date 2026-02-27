#import "lecture-template.typ": *

#set document(
  title: "MATH 117 Notes Feb. 17, 2026",
  date: datetime(day: 17, month: 2, year: 2026),
)

#show: template

#sbox[Examples of the Comparison Test][
  #example(number: 1)[
    - The series $sum 1 / sqrt(n)$ diverges, since $1 / sqrt(n) < 1 / n$ and $sum 1 / n$ diverges.

    - The series $sum 1 / sqrt(n (n + 1))$ diverges, since $1 / sqrt(n (n + 1)) < 1 / (n + 1)$, and $sum 1 / (n + 1)$ diverges.
  ]

  #example(number: 2)[
    Consider the series

    $
      1/2 + 1/3^2 + 1/2^3 + 1/3^4 + 1/2^5 + dots.c
    $

    The $n$th root of this series is always at most $(1 slash 2)^n$. Since $sum (1/2)^n$ converges, the Comparison Test implies the series converges as well.
  ]

  #example(number: 3)[
    Suppose that $a_n$ and $b_n$ are real sequences whose terms are strictly positive. Suppose further that, for every $n >= n_0$,

    $
      a_(n + 1) / a_n <= b_(n + 1) / b_n.
    $

    Then if $sum b_n$ converges, so does $sum a_n$.

    #proof[
      Observe that

      $
        a_(n_0 + 1) / a_n_0 dot a_(n_0 + 2) / a_(n_0 + 1) dot dots.c dot a_(n + 1) / a_n <= b_(n_0 + 1) / b_n_0 dot b_(n_0 + 2) / b_(n_0 + 1) dot dots.c dot b_(n + 1) / b_n.
      $

      Most of these terms cancel, leaving the following inequality:

      $
        a_(n + 1) <= a_n_0 / b_n_0 dot b_(n + 1)
      $

      Since $a_n_0 slash b_n_0$ is a constant, $sum a_n_0 / b_n_0 b_(n + 1)$ converges. Therefore, $sum a_(n + 1)$ also converges by the Comparison Test.
    ]
  ]

  #example(number: 4)[
    If $a_n slash b_n$ tends to some nonzero limit $ell$ where $a_n > 0$ and $b_n > 0$, then $sum a_n$ converges if and only if $sum b_n$ converges.

    #colbreak()

    #proof[
      Let $epsilon = ell slash 2 > 0$. Then there is some natural number $n_0$ such that for every $n >= n_0$,

      $
        ell - epsilon < a_n slash b_n < ell = epsilon.
      $

      Substituting $epsilon$ and rearranging the inequality, we get

      $
        ell slash 2 dot b_n < a_n < 3 ell slash 2 dot b_n.
      $

      The result now follows by the Comparison Test.
    ]
  ]
]

#theorem(number: 24)[The Cauchy $n$th Root Test][
  Suppose that $a_n$ is a real sequence where $a_n >= 0$.

  + If $limbar.u \(a_n)^(1 slash n) < 1$, then $sum a_n$ converges.

  + If $limbar.u \(a_n)^(1 slash n) > 1$, then $sum a_n$ diverges.
]

#proof[

  + Suppose that $limbar.u \(a_n)^(1 slash n) < 1$. Select a $k$ such that $limbar.u \(a_n)^(1 slash n) < k < 1$.

    Then there exists a number $n_0$ such that for all $n >= n_0$,

    $
      \(a_n)^(1 slash n) < k quad "(Theorem 14)."
    $

    Hence, $0 <= a_n <= k^n$ for every $n >= n_0$. But $sum k^n$ converges, so by the Comparison Test, $sum a_n$ converges also.

  + Suppose $limbar.u \(a_n)^(1 slash n) > 1$. Then $\(a_n)^(1 slash n) > 1$ and thus $a_n > 1$ for infinitely many $n$, so $a_n$ does not tend to zero. Hence, $sum a_n$ does not converge.
]

#example[
  Let $z$ be a complex number. Applying the Root Test to $z^n slash n!$ yields

  $
    ulim(n) abs(z^n slash n!)^(1 slash n) = ulim(n) abs(z) / (n!)^(1 slash n) = 0.
  $

  Therefore, $sum z^n / n!$ converges because it converges absolutely.
]

#theorem[The d'Alembert Ratio Test][
  Suppose that $a_n$ is a real sequence where $a_n >= 0$.

  + If $limits(lim)_(n -> oo) a_(n + 1) / a_n$ exists and is less than $1$, then $sum a_n$ converges.

  + If $limits(lim)_(n -> oo) a_(n + 1) / a_n$ exists and is greater than $1$, then $sum a_n$ diverges.
]

#pagebreak()

#proof[

  + Suppose that $limits(lim)_(n -> oo) a_(n + 1) / a_n < 1$. Choose $k$ such that $limits(lim)_(n -> oo) a_(n + 1) < k < 1$.

    Then there is a number $n_0$ such that

    $
      a_(n + 1) / a_n < k quad forall n >= n_0.
    $

    Hence, if $r >= 1$, we get

    $
      a_(n_0 + r) < a_n_0 dot k^r.
    $

    Since $sum a_n_0 k^r$ converges, we see  $limits(sum)_(n_0) a_n$ converges by the Comparison Test.

  + If $limits(lim)_(n -> oo) a_(n + 1) / a_n > 1$, then there is an $n_0 in NN$ such that for all $n >= n_0$,

    $
      a_(n + 1) / a_n > 1 quad ==> quad a_(n + 1) > a_n quad ==> quad a_(n + 1) > a_n > dots.c > a_n_0 > 0.
    $

    Hence $a_n$ does not tend to zero as $n -> oo$, so $sum a_n$ diverges.
]

#sbox[Refined Version of the Ratio Test][
  + If $lim a_(n + 1) slash a_n < 1$, then $sum a_n$ converges.

  + if $a_(n + 1) slash a_n > 1$ for all sufficiently large $n$, then $sum a_n$ diverges.

  Both criteria follow from the same proof above.
]

#example(number: 1)[
  Consider the series $sum 1 / n!$. Applying the Ratio Test,

  $
    a_(n + 1) / a_n = 1 / n quad ==> quad lim_(n -> oo) a_(n + 1) / a_n = 0.
  $

  Therefore, $sum 1 / n!$ converges.
]

#example(number: 2)[
  Let $z$ be a complex number, and consider $sum abs(z^n / n!)$. It follows that

  $
    a_(n + 1) / a_n = abs(z^(n + 1) / (n + 1)) dot abs(n! / z^n) = abs(z) / (n + 1).
  $

  This expression tends to zero as $n -> oo$, so $sum abs(z^n / n!)$ converges. Hence $sum z^n / n!$ also converges.

  #colbreak()

  We make the following definitions:

  $
    & exp(z) && = sum_(n = 0)^oo z^n / n! \
    & sin(z) && = sum_n^oo (-1)^n z^(2n + 1) / (2n + 1)! \
    & cos(z) && = sum_n^oo (-1)^n z^(2n) / (2n)!
  $

  All of these series converge by the d'Alembert Ratio Test for any value of $z$. It follows that these definitions are complex functions.
]

#example(number: 3)[
  Consider $sum 1 / n$. Then the ratio of subsequent terms tends to $1$ as $n -> oo$, so the Ratio Test tells us nothing in this case.

  Now, consider $sum 1 / n^2$. The ratio of subsequent terms again tends to $1$, but this series converges while $sum 1 / n$ does not. The Ratio Test cannot show this.

  Observe that

  $
    1 / n^2 < 1 / (n(n - 1)) = 1 / (n - 1) - 1 / n.
  $

  Hence,

  $
    sum_2^m 1 / n^2 < 1 - 1 / m < 1.
  $

  Here, the partial sums are bounded. Therefore, $sum 1 / n^2$ converges.
]

#theorem(number: 26)[The Condensation Test][
  Suppose that $a_n$ is a real decreasing sequence where $a_n >= 0$. Then $sum a_n$ converges if and only if $sum 2^n a_(2^n)$ converges.
]

#proof[
  Observe that we have

  $
    (2^(n + 1) a_(2^(n + 1))) / 2 thick thick <=thick thick sum_(r = 2^n + 1)^(2^(n + 1)) a_r thick thick <= thick thick 2^n a_(2^n).
  $

  If $sum a_n$ converges, then

  $
    1 / 2 sum_n^N 2^n a_(2^n) thick thick <= thick thick sum_(r = 2)^(2^N) a_r thick thick <= thick thick sum_(r = 2)^oo a_r
  $

  hence $sum 2^n a_(2^n)$ also converges.

  Conversely, if $sum 2^n a_(2^n)$ converges, then for some $N$,

  $
    sum_(r = 2)^m a_r thick thick <= thick thick sum_(r = 2)^(N + 1) a_r thick thick <= thick thick sum_(n = 0)^N 2^n a_(2^n) thick thick <= thick thick sum_(n = 0)^oo 2^n a_(2^n).
  $

  Because the partial sums of $a_n$ are bounded and $a_n >= 0$, the series $sum a_n$ converges.

  *TODO: Clarify this! A lot!*
]

#example[
  The series $sum 1 / n^alpha$ converges if $alpha > 1$ and diverges if $alpha <= 1$. Observe that

  $
    a_n = 1 / n^alpha ==> 2^n a_(2^n) = 2^n / (2^n)^alpha = 1 / (2^(alpha - 1))^n.
  $

  The convergence of $sum \(1 / 2^(alpha - 1))^n$ is equivalent to $1 / (2^(alpha - 1)) < 1 <=> alpha > 1$.
]
