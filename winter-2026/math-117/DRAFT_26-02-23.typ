#import "lecture-template.typ": *

#set document(
  title: "MATH 117 Notes Feb. 23, 2026",
  date: datetime(day: 23, month: 2, year: 2026),
)

#show: template

= Chapter IV: Continuity

_In the past, functions were called continuous if one could draw them smoothly. However, we can cook up very nasty functions which are continuous but can't be drawn at all._

#definition(number: none)[
  Let $f : RR -> RR$ be a real function, and let $a$ be a real number. Then tends to a limit $ell$ as $x -> a$ if, given $epsilon > 0$. there exists $delta > 0$ such that, for every value of $x$ where $0 < |x -a| < delta$, we have $|f(x) - ell| < epsilon$.

  We write $f(x) -> ell$ as $x -> a$ or $limits(lim)_(x -> a) f(x) = ell$.
]

#note[
  The value of $f(a)$ as $x -> a$ is irrelevant to the definition of the limit.
]

#example(number: 1)[
  Suppose that $f(x) = c$ for some real constant $c$ at all $x$. Then $limits(lim)_(x -> a) f(x) = c$.
]

#example(number: 2)[
  Suppose that $f(x) = x$. Then $limits(lim)_(x -> a) f(x) = a$.
]

#example(number: 3)[
  Suppose $f$ is defined as

  $
    f(x) = cases(1 "if" x != 0, 0 "if" x = 0)
  $

  Then $limits(lim)_(x -> 0) f(x) = 1$, even though $f(0) = 0$.
]

#example(number: 4)[
  Suppose $f$ is defined as

  $
    f(x) = cases(&x sin (1 slash x) quad &&"if" x != 0, &0 &&"if" x = 0)
  $

  Then $limits(lim)_(x -> 0) f(x) = 0$, since $|f(x)| <= |x|$ for all $x$.
]

#pagebreak()

#example(number: 5)[
  Suppose $f$ is defined as

  $
    f(x) = cases(sin(1 slash x) quad &"if" x != 0, 0 &"if" x = 0)
  $

  Then $limits(lim)_(x -> 0) f(x)$ does not exist.
]

#example(number: 6)[
  Suppose $f$ is defined as

  $
    f(x) = cases(0 "if" x in QQ, 1 "if" x in.not QQ)
  $

  Then $limits(lim)_(x -> a) f(x)$ does not exist for any value of $a$.
]

#note[
  + In the definition of what it means to say $limits(lim)_(x -> a) f(x) = ell$, we could use $k epsilon$, or $|f(x) - ell| < k epsilon$, for some fixed $k > 0$.

  + The same definition holds if $f$ is defined on { x : 0 < |x - a| < r } for some $r$.
]

#lemma(number: 36)[
  If $f(x) -> ell_1$ and $f(x) -> ell_2$ as $x -> a$, then $ell_1 = ell_2$.
]

#proof[
  If $ell_1 != ell_2$, let $epsilon = 1 / 2|ell_1 - ell_2|$. Then

  $
    & exists delta_1 > 0 quad "st." quad 0 < |x - a| < delta_1 ==> |f(x) - ell_1| \
    & exists delta_2 > 0 quad "st." quad 0 < |x - a| < delta_2 ==> |f(x) - ell_2|.
  $

  Choose $x$ such that $|x - a| < min \{ delta_1, delta_2 }$. It follows that

  $
    |ell_1 - ell_2| <= |f(x) - ell_1| + |f(x) - ell_2| < 2epsilon = |ell_1 - ell_2|.
  $

  This is a contradiction. Hence $ell_1 = ell_2$ as asserted.
]

#lemma(<37>)[][
  Suppose that as $x -> a$, $f(x) -> ell$ and $g(x) -> m$.

  + $f(x) + g(x) -> ell + m$ as $x -> a$.

  + $f(x) dot g(x) -> ell m$ as $x -> a$.

  + $f(x) slash g(x) -> ell slash m$ as $x -> a$ provided $m != 0$.
]

#pagebreak()

#proof[(ii)][
  Given $epsilon > 0$, we have

  $
    exists delta_1 > 0 quad "st." quad 0 < |x - a| < delta_1 ==> |f(x) - ell| & < min{epsilon, 1} \
    exists delta_2 > 0 quad "st." quad 0 < |x - a| < delta_2 ==> |f(x) - ell| & < epsilon.
  $

  Then if $0 < |x - a| < min\{ delta_1, delta_2 }$ we have

  $
    |f(x) dot g(x) - ell m| & = |f(x) dot g(x) - f(x) m + f(x)m - ell m| \
                            & <= abs(f(x))abs(g(x) - m) + abs(m)abs(f(x) - ell) \
                            & <= (|ell| + 1 + |m|) epsilon.
  $

  Henc $f(x) dot g(x) -> ell m$ as $x -> a$, as required.
]

#exercise(number: none)[
  Parts (i) and (iii) of @37[-] can be proved in a similar way to Lemma 8. Complete these proofs.
]

#corollary(number: none)[
  By taking $f(x) = x^n$, we see that $x^n -> a^n$ as $x -> a$, whence $limits(sum)_0^m c_r x^r = limits(sum)_0^m c_r a^r$.
]

#definition(number: none)[Function Continuity][
  A real function $f : RR -> RR$ is *continuous* at a real number $a$ if $limits(lim)_(x -> a) f(x)$ exists and is equal to $f(a)$. That is, given $epsilon > 0$, there is a $delta > 0$ such that if $|x - a| < delta$, then $|f(x) - f(a)| < epsilon$.

  We say that $f$ is *continuous* if $f$ is continuous at every real $a$.

  We sometimes call functions continuous if they are continuous at every point at which they are defined.
]

#theorem[General Principle of Convergence for Functions][
  Let $f : RR -> RR$ be a function. Then $f(x)$ tends to a limit as $x -> a$ if and only if given $epsilon > 0$, there is a $delta > 0$ such that

  $
    0 < |x - a| < delta quad "and" quad 0 < |y - a| < delta quad ==> quad |f(x) - f(y)| < epsilon.
  $
]

#proof[
  Suppose $f(x) -> ell$ as $x -> a$. Then given $epsilon > 0$,

  $
    exists delta > 0 quad "st." quad & 0 < |x - a| < delta ==> |f(x) - ell| < epsilon slash 2 \
                                     & 0 < |y - a| < delta ==> |f(y) - ell| < epsilon slash 2.
  $

  Using the triangle inequality, we get

  $
    |f(x) - f(y)| = |f(x) - ell| + |f(y) - ell| < epsilon slash 2 + epsilon slash 2 = epsilon.
  $

  Conversely, suppose that given $epsilon > 0$, there is a $delta > 0$ that satisfies the convergence condition.

  Consider the sequence $x_n = a + 1 slash n$. Then $lim x_n = a$. Hence, for all $r, s >= 1 slash delta$,

  $
    0 < |x_r - a| < delta quad "and" quad 0 < |x_s - a| < delta.
  $

  It follows that $|f\(x_r) - f\(x_s)| < epsilon$.
  The General Principle of Convergence applied to the sequence $f\(x_n)$ implies that $f\(x_n)$ tends to a real limit $ell$ as $n -> oo$.

  Therefore, there is a natural number $n_0$ such that for all $n >= n_0$, $|f\(x_n) - ell| < epsilon$.

  Now, suppose $x$ satisfies $0 < |x - a| < delta$. Moreover, choose $n >= max{ n_0, 1 slash delta }$. It follows that

  $
    |f\(x_n) - f(x)| < epsilon quad "and" quad |f\(x_n) - ell| < epsilon.
  $

  By the triangle inequality,

  $
    |f(x) - ell| < 2 epsilon
  $

  and by definition, $f(x) -> ell$ as $x -> a$.
]

#note[
  If $f(x) -> ell$ as $x -> a$, and $x_n -> a$ as $n -> oo$, but $x_n != a$ for all sufficiently large values of $n$, the sequence $f\(x_n)$ tends to $ell$ as $n -> oo$.
]

#proof[
  Given $epsilon > 0$, there is a $delta > 0$ such that $0 < |x - a| < delta$ implies $|f(x) - ell| < epsilon$. Noting that $delta$ is arbitrarily small, there is a natural number $n_0$ such that for every $n >= n_0$, we have $|x_n - a| < delta$ and $x_n != a$.

  Hence for all $n >= n_0$, we get $|f\(x_n) - ell| < epsilon$, and so $f\(x_n) -> ell$ as $n -> oo$.
]
