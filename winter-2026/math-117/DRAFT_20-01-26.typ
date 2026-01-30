#import "template.typ": *

#set document(
  title: "MATH 117 Notes Jan. 20, 2026",
  date: datetime(day: 20, month: 1, year: 2026),
)

#show: doc => template(doc, draft: true)

#lemma(<7>, number: 7)[][
  Suppose that $f(n)$ is a sequence in $RR$ or $CC$. Suppose further that $f(n) -> ell_1$ and $f(n) -> ell_2$ as $n -> oo$. Then $ell_1 = ell_2$.
]

#proof[
  If $ell_1 != ell_2$, then $|ell_1 - ell_2| > 0$. Let $epsilon = 1/2 |ell_1 - ell_2|$. Then

  $
    & exists n_1 in NN "st." |f(n) - ell_1| < epsilon thick forall n >= n_1, \
    & exists n_2 in NN "st." |f(n) - ell_2| < epsilon thick forall n >= n_2.
  $

  Choose $n = max(n_1, n_2)$. Then, using the triangle inequality,

  $
    |ell_1 - ell_2| <= |ell_1 - f(n)| + |ell_2 - f(n)| < 2epsilon.
  $

  However, $|ell_1 - ell_2| = 2epsilon$, so this is a contradiction. Hence $ell_1 = ell_2$.
]

#definition(<sequence-divergence>, number: none, options: (color: orange))[Sequence Divergence][
  We say that a sequence $f(n)$ *diverges* if and only if $f(n)$ does not converge.
]

#lemma(<8>, title: none)[][
  Suppose that $f(n)$ and $g(n)$ are sequences in $RR$ or $CC$. If $f(n) -> ell$ and $g(n) -> m$ as $n -> oo$, then:

  + $f(n) + g(n) -> ell + m$.

  + $f(n) dot g(n) -> ell dot m$.

  + If $m != 0$, then $f(n) slash g(n)$ is defined for all but finitely many $n in N$, and $f(n) slash g(n)$ converges to $ell slash m$.
]

#proof[@8[--].i][
  Given $epsilon > 0$,

  $
    & exists n_1 in NN "st." |f(n) - ell| & < epsilon slash 2 thick forall n >= n_1, \
    & exists n_2 in NN "st." |g(n) - m|   & < epsilon slash 2 thick forall n >= n_2.
  $

  Then, for all $n >= max(n_1, n_2),$

  $
    |f(n) + g(n) - ell - m| & <= |f(n) - ell| + |g(n) - m| \
                            & < epsilon slash 2 + epsilon slash 2 = epsilon.
  $

  Therefore, $f(n) + g(n) -> ell + m$ as $n -> oo$ by definition.
]

#remark[
  If $f(n)$ can be shown to converge to a limit $ell$ given $epsilon' > 0$ where $epsilon'$ takes the form $epsilon' = k dot epsilon$ for another $epsilon > 0$ and a constant $k$, then $f(n)$ also satisfies the convergence definition given $epsilon$. If we have:

  $
    exists n_0 in NN "st." |f(n) - ell| < epsilon' = k dot epsilon thick forall n >= n_0
  $

  then we simply choose $epsilon' = epsilon slash k$ for the required result. This technique is useful when constructing proofs like the above.
]

#proof[@8[--].ii][
  Observe that

  $
    |f(n)g(n) - ell m| & = |f(n)g(n) - f(n)m + f(n)m - ell m| \
                       & <= |f(n)| dot |g(n) - m| + |m| dot |f(n) - ell|.
  $

  Given $epsilon > 0$, we also know

  $
    & exists n_1 in NN "st." |f(n) - ell| && < min(epsilon, 1) thick & forall n >= n_1, \
    & exists n_2 in NN "st." |g(n) - m|   && < epsilon thick         & forall n >= n_2.
  $

  Hence, if $n >= n_1$ then $|f(n)| < |ell| + 1$, and

  $
    |f(n)g(n) - ell m| < epsilon(|ell| + 1 + |m|) thick forall n >= max(n_1, n_2).
  $

  therefore, $f(n) dot g(n) -> ell dot m$ as $n -> oo$.
]

#proof[@8[--].iii][
  For this part, it will be sufficient to show that $1 slash g(n) -> 1 slash m$ and then apply @8[--].ii above. We first show that $1 slash g(n)$ exists, i.e. is defined for all sufficiently large $n$.

  Now since $g(n) -> m$, there is a sufficiently small $epsilon > 0$ such that

  $
    exists n_0 in NN "st." |g(n) - m| < epsilon < |m|slash 2 thick forall n >= n_0.
  $

  Then,

  $
               |m| & <= |g(n)| + |m - g(n)| \
                   & < |g(n)| + |m|slash 2 \
    ==> |m|slash 2 & < |g(n)| thick forall n >= n_0.
  $

  Hence for every $n$ greater than $n_0$, $g(n)$ is not zero (it is positive) and so $1 slash g(n)$ exists.

  For a more general $epsilon > 0$, $g(n)$ satisfies the definition of sequence convergence tending to $m$ for some sufficiently large $n_1 in NN$. Combined with the previous inequalities, it follows that

  $
    abs(1/m - 1/(g(n))) = abs((g(n) - m) / (m dot g(n))) < (2epsilon) / (|m|^2) wide forall n >= max(n_0, n_1).
  $

  Therefore, $1 slash g(n) -> 1 slash m$ as $n -> oo$.
]

#lemma(<9>)[][
  Suppose that $f(n) = x(n) + i y(n)$ is a sequence in $CC$ where $x(n)$ and $y(n)$ are both sequences in $RR$. Then $f(n) -> a + i b$, for some real numbers $a$ and $b$, if and only if $x(n) -> a$ and $y(n) -> b$.
]

#proof[
  In the reverse direction, the result immediately follows from @8[-].i applied to complex sequences.

  We handle the forward direction. Suppose $f(n) -> a + i b$. Then, given $epsilon > 0$,

  $
    exists n_0 in NN "st." |x(n) + i y(n) - a - i b| < epsilon thick forall n >= n_0.
  $

  We know that for every complex number $z$, its real and imaginary components satisfy the following conditions:

  $
    |"Re"(z)| & <= |z| \
    |"Im"(z)| & <= |z|
  $

  Applying these properties to the first equation, we see that

  $
    exists n_0 in NN "st." & |x(n) - a| < |[x(n) - a] + i [y(n) - b]| < epsilon \
                           & |y(n) - b| < |[x(n) - a] + i[y(n) - b]| < epsilon thick forall n >= n_0.
  $

  Therefore, $x(n) -> a$ and $y(n) -> b$ as $n -> oo$.
]

#lemma(<10>)[][
  If $f(n)$ is a sequence in $RR$ or $CC$ and $f(n) -> ell$ as $n -> oo$, then $f(n)$ is *bounded* by a real number $k$. Specifically,

  $
    |f(n)| <= k thick forall n in NN.
  $

  Equivalently, $f(NN) = { f(n) : n in NN }$ is a bounded set.
]

#proof[
  Using the definition of sequence convergence,

  $
    exists n_0 in NN "st." |f(n) - ell| < 1 thick forall n >= n_0.
  $

  Hence, for every $n >= n_0$, it holds that $|f(n)| < |ell| + 1$.

  Now choose $k = max{ |f(1)|, |f(2)|, ..., |f(n_0 - 1)|, |ell| + 1}$. Then $f(n) <= k$ for all $n$.
]

#remark[
  In the proof above, the sequence terms from $1$ to $n_0 - 1$ are the finitely many terms which lie outside of a small region around $ell$. In this case, these terms differ from $ell$ by more than $1$, but in general, these special terms always form a finite set.
]

#note[
  The converse to @10[-] is false; that is, not every bounded sequence converges to a limit. For example, $f(n) = (-1)^n in RR$ is bounded, since for every  \ $n$th term, $|f(n)| <= 1$. However, $f(n)$ does not converge, instead oscillating between $1$ and $-1$ forever.
]
