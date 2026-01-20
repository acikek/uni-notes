#import "../../template.typ": *

#set document(
  title: "MATH 117 Notes Jan. 15 2026 (Draft)",
  date: datetime(day: 6, month: 1, year: 2026),
)

#title()

Let $A subset.eq RR$, $A != diameter$. Then $"glb"(A)$, the *infimum* of of $A$, exists when $A$ is bounded below. If $"glb"(A) <= a thick forall a in A$, then $"glb"(A)$ is a lower bound.

If $delta > 0$, then $delta + "glb"(A)$ is not a lower bound of $A$, i.e. $"glb"(A)$ is the *greatest lower bound*.

Note that if $A != diameter$ is bounded, then $"glb"(A) <= a <= "lub"(A) thick forall a in A$.

= Distance

*Definition.* The *distance* $d(a, b)$ between $a, b in RR$ is defined as

$
  d(a, b) = |a - b|.
$

== Properties of Distance
- $d(a, b) >= 0$
- $d(a, b) = 0$ if and only if $a = b$
- $d(a, b) = d(b, a)$
- $d(a, b) + d(b, c) >= d(a, c)$; known as the triangle inequality

= The Complex Numbers $CC$

As a set, $CC = RR times RR$. A complex number is an ordered pair $(x, y)$ of real numbers.

We define complex and addition and multiplication.

$
  (x_1, y_1) + (x_2, y_2) = (x_1 + x_2, y_1 + y_2) \
  (x_1, y_1) dot (x_2, y_2) = (x_1 x_2 - y_1 y_2, x_1 y_2 + x_2 y_1)
$

Note that

$
  (x_1, 0) + (x_2, 0) = (x_1 + x_2, 0) \
  (x_1, 0) dot (x_2, 0) = (x_1 x_2, 0)
$

thus the collection ${ (x, 0) in CC : x in RR }$ is a copy of $RR$.

Therefore, we identify $(x, 0)$ with $x$. Then $RR subset.eq CC$. In this case, $RR$ s a subfield of $CC$.

Let $i = (0, 1)$. Then $i^2 = (-1, 0)$, and hence $i^2 = -1$. Finally,

$
  (x, y) & = (x, 0) + (0, 1) dot (y, 0) \
         & = x + i y.
$

For some more notation, $z = x + i y$ where $z in CC$, $x, y in RR$. We say that $x = "Re"(z)$, $y = "Im"(z)$.

We define $overline(z) := x - i y$ to be the *complex conjugate* of $z$.

== Complex Conjugates

- $overline((z_1 + z_2)) = overline(z_1) + overline(z_2)$
- $overline(z_1 z_2) = overline(z_1) dot overline(z_2)$
- $z + overline(z) = 2"Re"(z)$
- $z dot overline(z) = 2"Im"(z)$

Thus conjugation is a bijection from $CC --> CC$, where $z |-> overline(z)$, that preserves addition and multiplication. Note that this bijection is of order 2; that is, $overline(overline(z)) = z$.

*Exercise.* Show that there does not exist such a map on $RR$.

== Absolute Value

*Definition.* The *modulus* or *absolute value* $|z|$ of $z = x + i y$ is defined as $sqrt(x^2 + y^2)$.

Some properties of this definition include:
- $|z|^2 = z dot overline(z)$
- $|z| = |overline(z)|$
- $|z| > 0$ unless $z = 0$
- $|z_1 z_2|$ = $|z_1| dot |z_2|$
- $"Re"(z) <= |z|$

== The Triangle Inequality

*Lemma 5.* $|z_1 + z_2| <= |z_1| + |z_2|$. We prove this as follows:

$
  |z_1 + z_2|^2 & = (z_1 + z_2) dot (overline(z_1 + z_2)) \
                & = z_1 overline(z_1) + z_1 overline(z_2) + overline(z_1) z_2 + z_2 overline(z_2) \
                & = |z_1|^2 + |z_2|^2 + 2|z_1||z_2| \
                & = (|z_1| + |z_2|)^2
$
$
  therefore |z_1 + z_2| <= |z_1| + |z_2|.
$

*Corollary 1.* $|a - c| <= |underbrace(a - b, z_1)| + |underbrace(b - c, z_2)| thick forall a, b, c in CC$.

Define $d(a, b) = |a - b|$. Then $d(a, b) <= d(a, b) + d(b, c).$

*Corollary 2.* $|a| - |b| <= |a - b|$. Let $a = z_1 + z_2$ and $b = z_2$ for this result to follow.

== Geometry of Complex Numbers

If $z = x + i y$ is a complex number, observe that

$
  z = |z| (x / (|z|) + (i y) / (|z|)).
$

Then $x / (|z|) = cos(theta)$, $y / (|z|) = sin(theta)$, where $theta = "Arg"(z)$. _TODO: insert a diagram!_

= Theorem 6. The Cauchy-Schwartz Inequality

_In Russia, this is called something else... well, everything is called something else there._

Let $a_1, ..., a_n$ and $b_1, ..., b_n$ be complex numbers. Then

$
  (limits(sum)_(i = 1)^n a_i dot overline(b_i))^2 <= limits(sum)_(i = 1)^n |a_i|^2 dot limits(sum)_(i = 1)^n |b_i|^2.
$

_Proof._ For any $lambda, mu in CC$, we know:

$
  0 &<= limits(sum)_(i = 1)^n |lambda a_i + mu b_i|^2 \
  &= limits(sum)_(i = 1)^n (lambda a_i + mu b_i) dot (overline(lambda) dot overline(a_i) + overline(mu) dot overline(b_i)) \
  &= |lambda^2| limits(sum)_(i = 1)^n |a_i|^2 + lambda overline(mu) limits(sum)_(i = 1)^n a dot overline(b_i) + overline(lambda) mu limits(sum)_(i = 1)^n overline(a_i) dot b - |mu|^2 limits(sum)_(i = 1)^n |b_i|^2
$

Then, we choose $lambda$ and $mu$.

$
  lambda & =   && limits(sum)_(i = 1)^n |b_i|^2 = overline(lambda) "("lambda "is real)" \
      mu & = - && limits(sum)_(i = 1)^n a_i dot overline(b_i)
$

Substituting yields:

$
  0 & <= lambda ( lambda limits(sum)_(i = 1)^n |a_i|^2 - 2 mu overline(mu) + |mu|^2) \
    & = lambda (lambda limits(sum)_(i = 1)^n |a_i|^2 - |mu|^2)
$

We know that $lambda >= 0$. If $lambda = 0$, then $b_i = 0 thick forall i$, and in this case, the inequality we seek to prove holds. Otherwise, if $lambda > 0$, we multiply both sides of the inequality by $lambda^(-1)$ to obtain the following:

$
  |mu|^2 <= lambda limits(sum)_(i = 1)^n |a_i|^2
$

With one final substitution,

$
  |limits(sum)_(i = 1)^n a_i dot overline(b_i)|^2 <= limits(sum)_(i = 1)^n |a_i|^2 dot limits(sum)_(i = 1)^n |b_i|^2. thick thick qed
$

== Notes

Consider $a_1, ..., a_n$ and $b_1, ..., b_n$ to be real numbers. Then,

$
  |limits(sum)_(i = 1)^n a_i dot b_i|^2 <= limits(sum)_(i = 1)^n |a_i|^n dot limits(sum)_(i = 1)^n |b_i|^2.
$

Now look at $RR^n = RR times RR times dots.c times RR$ ($n$ times).

If $hat(a) in RR^n$, then $hat(a)$ is an ordered $n$-tuple $(a_1, ..., a_n)$. Define $||hat(a)||$ to be the *norm* of $a$ where

$
  ||hat(a)|| = +sqrt(limits(sum)_(i = 1)^n (a_i)^2).
$

Define $hat(a) dot hat(b) = limits(sum)_(i = 1)^n a_i dot b_i$. Then $||hat(a)|| = +sqrt(hat(a) dot hat(a))$.

The Cauchy-Schwartz inequality says $(hat(a) dot hat(b))^2 <= ||hat(a)||^2 dot ||hat(b)||^2$, and this can be used to define _angle_.

= Chapter II: Sequences

*Definition.* A *sequence* in a set $S$ is a function $f : NN -> S$, i.e. a rule associating $f(n) in S$ with each $n in NN$. Usually for us, $S$ is $RR$ or $CC$. For example,

$
  f(n) = 1 / n, thick thick f(n) = +sqrt(n), thick thick f(n) = (1 + 1/n)^n \ \
  f(n) = "the number of digits in the" n"th prime"
$

We often say $f(n)$ is a sequence in $S$. For other notation, we use $a_n$ or $x_n$ instead of $f(n)$.

It won't matter if $f$ is not defined for finitely many values of $n$. For example,

$
  f(n) = 1 / ((n - 1)(n - 5))
$

is not defined for $n = 1$ or $n = 5$. We often take limits of these sequences as $n -> oo$.

== Convergence

*Definition.* Let $f(n)$ be a sequence in $RR$ or $CC$. Then the sequence $f(n)$ *converges* to a limit $ell in RR$ (or $CC$) if, given $epsilon in RR$ where $epsilon > 0$, there exists $n_0 in NN$  such that $|f(n) - ell| < epsilon thick forall n >= n_0$.

We write that $f(n) -> ell$ as $n -> oo$. We may also write $limits(lim)_(n -> oo) f(n) = ell$.

== Notes about sequences

+ Sequences are *not* series.
+ $oo$ is not an element of $RR$ or $CC$, but tending to infinity ($n -> oo$) is permitted.
+ $epsilon$ is standard notation for an arbitrarily small number.
+ $epsilon$ must be given before $n_0$ is given, and usually $n_0$ depends upon $epsilon$.

== Examples

+ $f(n) = 1 slash n$; then $f(n) -> 0$ as $n -> oo$ from the corollary to theorem 2.

+ $f(n) = c thick forall n$, a constant sequence; \
  Then $f(n) -> c$ as $n -> oo$ since $|f(n) - c| = 0 < epsilon thick forall n$.
+ $f(n) = 2 / (n^2)$. Given $epsilon > 0$, $|f(n) - 0| <epsilon$ provided that $n > sqrt(2 / epsilon)$. So take $n_0 = round(2 / epsilon) + 1$.
