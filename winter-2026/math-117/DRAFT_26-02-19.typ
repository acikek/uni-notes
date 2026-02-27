#import "lecture-template.typ": *

#set document(
  title: "MATH 117 Notes Feb. 19, 2026",
  date: datetime(day: 19, month: 2, year: 2026),
)

#show: template

#sbox[More on the Comparison Test][
  #example[
    Consider the series

    $
      sum_(n >= 2) 1 / (n (log n)^alpha).
    $

    This series converges if $alpha > 1$ and diverges if $alpha <= 1$.

    #proof[
      Let $a_n = 1 slash n (log n)^alpha$. Then

      $
        2^n a_(2^n) = 2^n / (2^n (log 2^n)^alpha) = 1 / (log 2^n)^alpha = 1 / ((log 2)^alpha n^alpha).
      $

      But $sum 1 / ((log 2)^alpha n^alpha)$ converges if and only if $sum 1 / n^alpha$ converges, so we are done.
    ]
  ]

  #remark[
    The series $sum 1 / (n log n)$ diverges very slowly. In fact,

    $
      sum_3^(120,000) 1 / (n log n) < 8.
    $

    Furthermore, the series

    $ sum 1 / (n log n (log log n)^alpha) $ converges if $alpha > 1$ and diverges, even more slowly, if $alpha <= 1$.

    To generalize,

    $
      sum 1 / (n log n dot (log log n) dot dots.c dot (log log dots.c log n)^alpha)
    $

    can be made to diverge arbitrarily slowly. This is called the *logarithmic scale* of convergent and divergent series, and it is useful for comparison tests.
  ]
]

#definition(number: none)[Power Series][
  Suppose that $a_n$ is a complex sequence. The series $sum a_n z^n$ is called the *power series* with $\{ a_n }$ as coefficients.

  + In the trivial case, $sum a_n z^n$ converges when $z = 0$.

  + Let $f(z) = limits(sum)_(n = 0)^oo a_n z^n$. Then $f$ is a function defined as

  $
    f : { thick z : sum a_n z^n "converges" thick } --> CC.
  $
]

#lemma(<27>, number: 27)[][
  Suppose that $sum a_n z^n$ converges for some complex number $z_0$. Then for any $z$ such that $|z| < |z_0|$, the power series converges absolutely.
]

#proof[
  Observe the following equality:

  $
    |a_n z^n| = |a_n \(z_0)^n| dot abs(z / z_0)^n
  $

  We know $sum a_n \(z_0)^n$ converges, and so $a_n \(z_0)^n -> 0$ as $n -> oo$. Thus, given some $epsilon$ where $0 < epsilon < 1$, there is some natural number $n_0$ such that for every $n >= n_0$,

  $
    |a_n \(z_0)^n| < epsilon < 1 quad ==> quad |a_n \(z_0)^n| < abs(z / z_0)^n < 1.
  $

  Hence $sum |z slash z_0|^n$ converges. The Comparison Test implies that $sum |a_n z^n|$ converges also.
]

#definition(number: none)[Radius of Convergence][
  The *radius of convergence* $R$ of the power series $sum a_n z^n$ is defined by

  $
    R = sup { thick abs(z) : sum a_n z^n "converges" thick }.
  $

  We say that $R$ is infinite if the above set is unbounded.
]

#theorem[
  The power series $sum a_n z^n$ with radius of convergence $R$ converges absolutely for all $z$ with $|z| < R$. It diverges if $|z| > R$.
]

#proof[
  If $R$ is infinite, then given $z in CC$, there exists $z_0 in CC$  such that $|z_0| > |z|$ and $sum a_n \(z_0)^n$ converges, since the set ${ |z| : sum a_n z^n "converges" }$ is unbounded. The result now follows from @27[-]. Moreover, the series converges absolutely.

  Otherwise, $R$ is a positive real number. Suppose that $z$ is a complex number for which $|z| < R$.

  From the definition of $R$, there is another complex number $z_0$ where $|z| < |z_0| < R$ such that $sum a_n \(z_0)^n$ converges. @27[-] implies that $sum a_n z^n$ converges absolutely.

  If $|z| > R$, then it follows from the definition of $R$ that $sum a_n z^n$ diverges.
]

#pagebreak()

#theorem(<29>)[][
  Let $R$ be the radius of convergence of $sum a_n z^n$. Then

  $
    1 slash R = limbar.u |a_n|^(1 slash n).
  $

  By convention, if $R$ is infinite, then $1 slash R = 0$.
]

#proof[
  Consider $limbar.u |a_n z^n|^(1 slash n) = |z| dot limbar.u |a_n|^(1 slash n) = |z| dot Lambda$.

  By the Cauchy $n$th Root Test, the series $sum a_n z^n$ converges if $|z| dot Lambda < 1$ and diverges if $|z| dot Lambda > 1$.

  Equivalently, $|z| < 1 slash Lambda$ implies convergence, and $|z| > 1 slash Lambda$ implies divergence.
]

#example(number: 1)[
  Consider $sum n^n z^n$. This series converges at the origin, where $z = 0$, and nowhere else. If $|z| > 0$, then $n|z| > 1$ for all sufficiently large $n$, so $(n|z|)^n$ does not tend to zero as $n -> oo$. Hence, $R = 0$.
]

#example(number: 2)[
  Consider $sum z^n$. On the circle of convergence, where $z = 1$, the series diverges as $|z|^n = 1$, meaning $|z|^n$ does not tend to zero as $n -> oo$. Hence, $R = 1$.
]

#example(number: 3)[
  Consider $sum z^n / n!$. Here, $R = oo$.
]

#example(number: 4)[
  _Let's power down this series a bit..._

  Consider $sum z^n / n$. Using @29[-], observe that $(1 / n)^(1 slash n) -> 1$ as $n -> oo$. Hence $R = 1$.

  Alternatively, observe that the series diverges at $z = 1$ but converges at $z = -1$.
]

#example(number: 5)[
  Consider $limits(sum)_(n = 1)^oo z^n / n^2$. Here, $R = 1$ since, for example, $lim \(1 slash n^2)^(1 slash n) = 1$.

  Note that if $|z| = 1$, then $|z^n slash n^2| = 1 slash n^2$. Since $sum 1 / n^2$ converges, it follows that $sum z^n / n^2$ converges absolutely for $|z| = 1$.
]

#note[
  It is possible to construct power series with arbitrary behavior on the circle of convergence. For example, we could construct a series diverging at countably infinitely many points on this circle.
]

#theorem(number: 30)[Alternating Series Test][
  Let $a_n$ be a nonnegative real sequence such that
  + $a_n -> 0$ as $n -> oo$, and
  + $a_n$ is a decreasing sequence.

  Then $sum (-1)^n a_n$ converges.
]

#proof[
  Let $s_m = limits(sum)_(n = 0)^m (-1)^n a_n$. We wish to show that $s_m$ tends to a real limit.

  Consider

  $
    s_(2r) - s_(2r - 2) thick thick = thick thick sum_(2r - 2)^(2r) a_n thick thick = thick thick a_(2r) - a_(2r - 1) thick thick <= thick thick 0.
  $

  Hence, $s_(2r)$ is a decreasing sequence. Expanding $s_(2r)$ yields

  $
    s_(2r) = a_(2r) - a_(2r - 1) + a_(2r - 2) + dots.c + a_0.
  $

  Since $a_(2r) - a_(2r - 1) >= 0$, applying similarly to the other terms, we see $s_(2r) >= a_(2r) >= 0$. Hence $s_(2r)$ is a decreasing sequence that is bounded below.

  Therefore, $s_(2r)$ tends to a real limit $ell$ as $r -> oo$.

  Now, we have $s_(2r) - s_(2r - 1) = a_(2r)$, and this tends to zero by assumption. Therefore,

  $
    \(s_(2r - 1) - s_(2r)) + s_(2r) --> 0 + ell.
  $

  Since $s_(2r - 1) -> ell$, it follows that $s_m -> ell$ as $m -> oo$.
]
