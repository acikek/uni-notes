#import "lecture-template.typ": *

#set document(
  title: "MATH 117 Notes Feb. 10, 2026",
  date: datetime(day: 10, month: 2, year: 2026),
)

#show: template

= Chapter 3: Series

#definition(number: none)[Series and Partial Sums][
  Let $a_n$ be a complex sequence. Then

  $
    sum_(n = 1)^oo a_n = a_1 + a_2 + dots.c
  $

  is the *series* whose $n$th term is $a_n$. We often notate this series as $limits(sum)_n a_n$ or $sum a_n$.

  Furthermore, the expression

  $
    sum_(n = 1)^m a_n = a_1 + a_2 + dots.c + a_m
  $

  is the *partial sum* of the series $sum a_n$.

  If the following limit exists:

  $
    limits(lim)_(m -> oo) sum_(n = 1)^m a_n = ell
  $

  then we say that $sum a_n$ converges to $ell$. We write this limit as $limits(sum)_(n = 1)^oo a_n$. Otherwise, we say $sum a_n$ diverges.
]

#note[
  If $a_n$ begins with $n = r$, then we write

  $
    limits(sum)_r^oo a_n = limits(lim)_(m -> oo) limits(sum)_(n = r)^m a_n.
  $

  If $a_n$ is a real sequence and $limits(sum)_(n = 1)^m a_n -> oo$ as $n -> oo$, then we say that $sum a_n$ diverges to $plus.minus oo$.
]

#lemma(number: 17, <17>)[Arithmetic Properties of Series][
  Let $a_n$ be a sequence in $CC$.

  + If $sum a_n$ converges and $sum b_n$ converges, then $sum \(a_n + b_n)$ converges and

    $
      sum \(a_n + b_n) = limits(sum)_(n = 1)^oo a_n + limits(sum)_(n = 1)^oo b_n.
    $

  + If $c$ is a nonzero complex number, then $sum c a_n$ converges if and only if $sum a_n$ converges. In this case,

    $
      c limits(sum)_(n = 1)^oo = limits(sum)_(n = 1)^oo c a_n.
    $

  + If $sum a_n$ converges and $a_n = b_n$ for all but finitely many values of $n$, then $sum a_n$ also converges.

  + If $sum a_n$ converges, then so does any series obtained by bracketing terms together.

  + If $a_n$ and $b_n$ are real sequences, then $sum a_n$ and $sum b_n$ are convergent if and only if $sum \(a_n + b_n)$ is convergent in $CC$.
]

#proof[
  + Lemma 8 says that $lim f(n) + lim g(n) = lim (f(n) + g(n))$.

    The result follows from letting $f(n) = limits(sum)_(n = 1)^oo a_n$ and $g(n) = limits(sum)_(n = 1)^oo b_n$.

  + The result follows from Lemma 8 (ii).

  + Observe that $limits(sum)_(n = 1)^m a_n = limits(sum)_(n = 1)^oo b_n$ for all sufficiently large $n$.

  + The partial sums of the bracketed series are a subsequence of the partial sums of $sum a_n$.

  + Use Lemma 9 on $limits(sum)_(n = 1)^m a_n$ and $limits(sum)_(n = 1)^m b_n$.
]

#example[Bracketing Terms of Series][
  The series $sum a_n = 1 + 1/2 + 1/4 + 1/8 + dots.c$ converges. Lemma 17 (iv) tells us we can bracket terms of this series together to get a new convergent series. Consider

  $
    sum b_n = (1 + 1/2) + (1/4 + 1/8) + (1/16 + 1/32) + dots.c
  $

  The partial sum of $sum a_n$ where $m = 1$ has no equivalent partial sum of $sum b_n$. However, the partial sum at $m = 2$ does:

  $
    sum_(n = 1)^2 a_n thick thick = thick thick 1 + 1 / 2 thick thick = thick thick sum_(n = 1)^1 b_n
  $

  More generally, $limits(sum)_(n = 1)^(2m) a_n = limits(sum)_(n = 1)^m b_n$.

  Thus, letting $f(n)$ be the sequence of partial sums of $sum a_n$, the partial sums of the series $sum b_n$ form a subsequence $f(2n)$. Since $f(n)$ converges, so too must $f(2n)$.
]

#note[
  The series $sum (-1)^n$ does not converge, but

  $
    (-1 + 1) + (-1 + 1) + dots.c
  $

  _does_ converge. So brackets cannot necessarily be removed while keeping convergence the same.
]

#theorem[The General Principle of Convergence for Series][
  Let $a_n$ be a complex sequence. Then $sum a_n$ converges if and only if, given $epsilon > 0$, there is some natural number $n_0$ such that for all $r, s>= n_0$,

  $
    abs(sum_r^s a_n) < epsilon.
  $
]

#proof[
  Let $f(m) = limits(sum)_(n = 1)^m a_n$. Then

  $
    abs(sum_(n = r)^m a_n - sum_(n = s)^m a_n) = |f(r) - f(s)| = abs(sum_r^s a_n).
  $

  The result follows from applying Theorem 15 to $f(m)$.
]

#example[
  The series $sum 1/n$ diverges because, for any natural $r$,

  $
    sum_(2^r + 1)^(2^(r + 1)) 1/n = 1 / (2^r + 1) + 1 / (2^r + 2) + dots.c + 1 / (2^(r + 1)) > underbrace(1 / (2^(r + 1)) + dots.c + 1 / (2^(r + 1)), 2^r "times") = 2^r dot 1 / (2^(r + 1)) = 1/2.
  $

  The General Principle of Convergence does not hold, so the series diverges.
]

#lemma[
  Suppose that $sum a_n$ converges. Then $a_n -> 0$ as $n -> oo$.
]

#proof[
  If $sum a_n$ converges, then

  $
    lim_(m -> oo) a_m = lim_(m -> oo) thick (sum_(n = 1)^m a_n - sum_(n = 1)^(m - 1) a_n) = sum_(n = 1)^oo a_n - sum_(n = 1)^oo a_n = 0.
  $
]

#proof(supplement: "Alternative Proof")[
  By the General Principle of Convergence, given $epsilon > 0$, we have

  $
    abs(sum_r^r a_n) = |a_n| < epsilon quad forall r >= n_0 "for some" n_0 in NN.
  $
]

#note[
  Lemma 19 can be used to prove that a series diverges. For example, $sum sqrt(n)$ diverges since $sqrt(n)$ does not tend to zero as $n -> oo$.

  However, we know $sum 1/n$ diverges while $1 slash n -> 0$ as $n -> oo$, so the converse to this lemma is false.
]

#lemma[Geometric Progressions][
  Let $z$ be a complex number. Then $limits(sum)_n z^n$ converges if $|z| < 1$ and diverges if $|z| >= 1$.
]

#proof[
  If $|z| >= 1$, then $|z|^n >= 1$. Hence $|z|^n$ does not tend to zero as $n -> oo$, and so we have divergence.

  If $|z| < 1$, then we have

  $
    sum_(n = 0)^m z^n = (1 - z^(m + 1)) / (1 - z) = 1 / (1 - z) - z^(m + 1) / (1 - z).
  $

  However, $z^(m + 1) -> 0$ as $n -> oo$ since $lim |z|^(m + 1) = 0$ if $|z| < 1$. Thus,

  $
    sum_(n = 0)^m z^n --> 1 / (1 - z) quad "as" m --> oo.
  $

  Therefore, $limits(sum)_(n = 0)^oo z^n = 1 / (1 - z)$.
]

#exercise(number: none)[
  Suppose $S = 1 + z + z^2 + dots.c + z^m$. Derive the closed form

  $
    S = (1 - z^(m - 1)) / (1 - z)
  $

  used in the above proof.
]

#definition(number: none)[Absolute Convergence][
  If $a_n$ is a complex sequence, then we say $sum a_n$ *converges absolutely* if $sum |a_n|$ converges.
]

#theorem[
  Suppose $a_n$ is a complex sequence. If $sum a_n$ converges absolutely, then $sum a_n$ converges. In other words, absolute convergence implies convergence.
]

#proof[
  Suppose that $sum |a_n|$ converges. Then, given $epsilon > 0$, there is some natural $n_0$ such that for all $r, s >= n_0$,

  $
    sum_r^s |a_n| < epsilon.
  $

  Moreover,

  $
    abs(sum_r^s a_n) <= sum_r^s |a_n| < epsilon quad forall r, s >= n_0.
  $

  Hence, the General Principle of Convergence implies that $sum a_n$ converges.
]

#note[
  The converse of this theorem is false. Consider $sum 1/n$ and $sum (-1)^n slash n$. The former diverges, but we will show later that the latter converges.
]

#lemma[
  Suppose $a_n$ is a real sequence where $a_n >= 0$ for every $n$. Then $sum a_n$ converges if and only if

  $
    { sum_(n = 1)^m : m in NN }, quad "the set of all partial sums"
  $
  is bounded above.
]

#proof[
  The forward direction follows from Lemma 10, wherein $f(n)$ converging to a limit implies ${ f(n) : n in NN }$ is bounded.

  The converse follows from Theorem 12. Take $f(m) = limits(sum)_(n = 1)^n$.

  Since $f(m)$ is an increasing function of $m$ and is bounded above, it therefore tends to a limit. In this case, $f(m) <= lim f(m)$ by Theorem 12.
]

#theorem[The Comparison Test][
  Suppose for some natural $n_0$ that for all $n >= n_0$,

  $
    0 <= a_n <= b_n quad "where" a_n, b_n in RR.
  $

  + If $sum b_n$ converges, then $sum a_n$ converges.

  + If $sum a_n$ diverges, then $sum b_n$ diverges.
]

#proof[
  Suppose that $sum b_n$ converges. Then

  $
    sum_(n_0)^m a_n <= sum_(n_0)^m b_n <= sum_(n_0)^oo b_n.
  $

  Therefore, the set

  $
    { sum_(n_0)^m a_n : m in NN, m >= n_0}
  $

  is bounded above by $limits(sum)_(n_0)^oo b_n$. Hence,

  $
    sum_(n = 1)^m a_n <= sum_(n = 1)^(n_0 - 1) + sum_(n_0)^oo b_n.
  $

  Therefore, $limits(sum)_(n = 1)^oo a_n$ exists by Lemma 22. Part (ii) is left as an exercise.
]
