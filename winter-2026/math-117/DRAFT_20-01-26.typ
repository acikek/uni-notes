#set document(
  title: "MATH 117 Notes Jan. 20 2026 (Draft)",
  date: datetime(day: 20, month: 1, year: 2026),
)

#set text(font: "Fira Sans")

#show math.equation: set text(font: "Fira Math", weight: "light")

#show math.equation.where(block: true): block.with(width: 100%)

#set enum(numbering: "(i)")

#title()

*Lemma 7.* Suppose that $f(n)$ is a sequence in $RR$ or $CC$. Suppose further that $f(n) -> ell_1$ and $f(n) -> ell_2$ as $n -> oo$. Then $ell_1 = ell_2$.

_Proof._ If $ell_1 != ell_2$, then $|ell_1 - ell_2| > 0$. Let $epsilon = 1/2 |ell_1 - ell_2|$. Then

$
  & exists thick n_1 in NN "st." |f(n) - ell_1| < epsilon thick forall n >= n_1, \
  & exists thick n_2 in NN "st." |f(n) - ell_2| < epsilon thick forall n >= n_2.
$

Choose $n = max(n_1, n_2)$. Then, using the triangle inequality,

$
  |ell_1 - ell_2| <= |ell_1 - f(n)| + |ell_2 - f(n)| < 2epsilon
$

but $|ell_1 - ell_2| = 2epsilon$, so this is a contradiction. Hence $ell_1 = ell_2$.

*Definition.* We say that $f(n)$ *diverges* if and only if $f(n)$ does not converge.

*Lemma 8.* Suppose that $f(n)$ and $g(n)$ are sequences in $RR$ or $CC$, and suppose $f(n) -> ell$ and $g(n) -> m$ as $n -> oo$. Then:
+ $f(n) + g(n)$ converges to $ell + m$.
+ $f(n) dot g(n)$ converges to $ell dot m$.
+ If $m != 0$, then $f(n) slash g(n)$ is defined for all but finitely many $n in N$, and $f(n) slash g(n)$ converges to $ell slash m$.

_Proof._

+ Given $epsilon > 0$,

  $
    & exists thick n_1 in NN "st." |f(n) - ell| & < epsilon slash 2 thick forall n >= n_1, \
    & exists thick n_2 in NN "st." |g(n) - m|   & < epsilon slash 2 thick forall n >= n_2.
  $

  Then, for all $n >= max(n_1, n_2),$

  $
    |f(n) + g(n) - ell - m| & <= |f(n) - ell| + |g(n) - m| \
                            & < epsilon slash 2 + epsilon slash 2 = epsilon.
  $

  Therefore, $f(n) + g(n) -> ell + m$ as $n -> oo$ by definition.

*Aside.* Suppose, given $epsilon' > 0$, $exists thick n_0 "st." |f(n) - ell| < k dot epsilon' thick forall n >= n_0$ where $k$ is a positive constant that does not depend upon $epsilon'$.

Then $f(n) -> ell$ as $n -> oo$ becauuse, given $epsilon > 0$, we can choose $epsilon' = epsilon slash k$ for which $exists thick n_0 "st." |f(n) - ell| < k dot (epsilon slash k) = epsilon$. This technique is useful when constructing proofs like the above.

2. Observe that

  $
    |f(n)g(n) - ell m| & = |f(n)g(n) - f(n)m + f(n)m - ell m| \
                       & <= |f(n)| dot |g(n) - m| + |m| dot |f(n) - ell|.
  $

  Given $epsilon > 0$, we also know

  $
    & exists thick n_1 in NN "st." |f(n) - ell| && < min(epsilon, 1) thick & forall n >= n_1, \
    & exists thick n_2 in NN "st." |g(n) - m|   && < epsilon thick         & forall n >= n_2.
  $

  hence, if $n >= n_1$ then $|f(n)| < |ell| + 1$, and

  $
    |f(n)g(n) - ell m| < epsilon(|ell| + 1 + |m|) thick forall n >= max(n_1, n_2)
  $

  therefore, $f(n)g(n) -> l m$ as $n -> oo$.

+ For this part, it will be sufficient to show that $1 slash g(n) -> 1 slash m$ and then apply part (ii) above. We first show that $1 slash g(n)$ exists, i.e. is defined for all sufficiently large $n$.

  Now $exists thick n_0 in NN "st." |g(n) - m| < |m|slash 2 thick forall n >= n_0$. Then

  $
               |m| & <= |g(n)| + |m - g(n)| \
                   & < |g(n)| + |m|slash 2 \
    ==> |m|slash 2 & < |g(n)| thick forall n >= n_0.
  $

  Hence $forall n >= n_0$, $g(n)$ is not zero -- it is positive -- and so $1 slash g(n)$ exists.

  Given $epsilon > 0$, $exists n_1 in NN "st." forall n > n_1, |g(n) - m| < epsilon$. It follows that

  $
    abs(1/m - 1/(g(n))) = abs((g(n) - m) / (m dot g(n))) < (2epsilon) / (|m|^2) wide forall n >= max(n_0, n_1).
  $

  Therefore, $1 slash g(n) -> 1 slash m$ as $n -> oo$.

This completes the proof.

*Lemma 9.* Suppose that $f(n) = x(n) + i y(n)$ is a sequence in $CC$ where $x(n)$ and $y(n)$ are both sequences in $RR$. Then $f(n)$ tends to a limit $a + i b$, for some real numbers $a$ and $b$, if and only if $x(n) -> a$ and $y(n) -> b$.

_Proof._ ($<==$) The result is trivial via Lemma 8 (i) in $CC$.

($<==$) Suppose $f(n) -> a + i b$. Then given $epsilon > 0$,

$
  |x(n) + i y(n) - a - i b| < epsilon thick forall n >= n_0.
$

Now $forall z in CC$, we have $|"Re"(z)| <= |z|$, $|"Im"(z)| <= |z|$. Hence $forall n >= n_0$, $|x(n) - a| < epsilon$ and $|y(n) - b| < epsilon$. Therefore, $x(n) -> a$ and $y(n) -> b$ as $n -> oo$.

*Lemma 10.* If $f(n)$ is a sequence in $RR$ or $CC$ and $f(n) -> ell$ as $n -> oo$, then $f(n)$ is *bounded*, i.e. $exists k in RR "st." |f(n)| <= k thick forall n in NN$. Equivalently, $f(NN) = { f(n) : n in NN }$ is a bounded set.

_Proof._ $exists n_0 in NN "st." |f(n) - ell| < 1 thick forall n > n_0$. Hence $|f(n)| < |ell| + 1 thick forall n > n_0$.

Now let $k = max{ |f(1)|, |f(2)|, ..., |f(n_0 - 1)|, |ell| + 1}$. Then $f(n) <= k thick forall n in NN$.

*Note:* the converse is false, e.g. $f(n) = (-1)^n in RR$ is bounded, since $|f(n)| <= 1 thick forall n in NN$, but it does not converge.
