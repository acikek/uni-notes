#import "lecture-template.typ": *

#set document(
  title: "MATH 117 Notes Jan. 6, 2026",
  date: datetime(day: 6, month: 1, year: 2026),
)

#show: template

_This is the only way to learn mathematics, and if somebody tells you otherwise, they're either lying or trying to con you, and you should run away as fast as possible in the opposite direction._

= Chapter 1: Number Systems

Analysis is concerned with functions, especially when it comes to continuity, differentiation, and integration. We want to put these concepts on a rigorous basis. Specifically, we would like to:
- Treat differentiation and integration as inverse processes
- Interchange summation and differentiation

When is the latter justified?

*Example.*
Evaluate the sum $sum_(n = 1)^oo n(1/2)^n = 1 dot 1/2 + 2 dot 1/4 dot 3 dot 1/8 + dots.c$

Note that $sum_(n = 1)^oo t^n = t / (1 - t)$ when $|t| < 1$.

== Method 1

We let $f(t) = sum_(n = 1)^oo t^n$ and consider the case when $t = 1/2$. Differentiating the summation:

$
  f'(t) = limits(sum)_(n = 1)^oo n t^(n - 1)
$

Furthermore, if we differentiate the result of $f(t)$, we get:

$
  d / (d t)(t / (1 - t)) = 1 / (1 - t)^2.
$


This process results in the following equation:

$
  & limits(sum)_(n = 1)^oo n t^(n - 1) && = 1 / (1 - t)^2 \
  & limits(sum)_(n = 1)^oo n t^n       && = t / (1 - t)^2 \
  & limits(sum)_(n = 1)^oo n (1/2)^n   && = (1 slash 2) / (1 slash 2)^2 = 2
$

We have obtained $f'(t)$ by differentiating an infinite series term by term. In general, _this cannot be justified_.

== Method 2

Once again using the parameter $t$ where $|t| < 1$, we rewrite the sum as

$
  1t + 2t^2 + 3t^3 + dots.c & = (t + t^2 + t^3 + dots.c) + (t^2 + t^3 + t^4 + dots.c) + (t^3 + t^4 + t^5 + dots.c) + dots.c\
  & = limits(sum)_(n = 1)^oo t^n + t dot limits(sum)_(n = 1)^oo t^n + t^2 dot limits(sum)_(n = 1)^oo t^n + dots.c\
  & = t / (1 - t) + (t^2) / (1 - t) + (t^3) / (1 - t) + dots.c \
  & = 1 / (1- t) limits(sum)_(n = 1)^oo t^n = t / (1 - t)^2.
$

Then, setting $t = 1/2$ yields the same result: $2$.

_At some point, one has to start... thinking._

== What Have We Done Here?

Consider the following array:

$
  mat(
    delim: #none,
    dots.v, dots.v, dots.v, dots.up;
    0, 0, 0, dots.c;
    0, 0, t^3, dots.c;
    0, t^2, t^3, dots.c;
    t, t^2, t^3, dots.c
  )
$

When first evaluating the sum $sum_(n = 1)^oo n t^n$, we added each column and summed up those results. Using the second method, we instead added the _rows_ before collecting the results.

In other words, if we represented each element of the array like so:

$
  a_(i j) = cases(t^i &"when" j <= i, 0 &"when" j > i)
$

then we have this _supposedly obvious result_:

#[
  #let i = text(fill: blue, weight: "bold", $i$)
  #let j = text(fill: red, weight: "bold", $j$)
  $
    limits(sum)_(#i = 1)^oo ( limits(sum)_(#j = 1)^oo a_(#i #j)) = limits(sum)_(#j = 1)^oo ( limits(sum)_(#i = 1)^oo a_(#i #j))
  $
]

However, this does not work in every case. For example, consider a new array:

$
  mat(
    // align: #right,
    delim: #none,
    dots.v, dots.v, dots.v, dots.v, dots.up;
    0, 0, 0, 0, dots.c;
    0, 0, 0, 15/16, dots.c;
    0, 0, 7/8, (-7)/8, dots.c;
    0, 3/4, (-3)/4, 0, dots.c;
    1/2, (-1)/2, 0, 0, dots.c;
    1/2, 1/4, 1/8, 1/16, dots.c;
  )
$

Adding the terms of the last row is equivalent to the summation $sum_(n = 1)^oo (1/2)^n$ , which equals $1$. The array is designed such that the sum of all other rows is $0$, so the overall result of the row-first approach is $1$. Notice, however, that the column-first method yields a different result:

$
    & 1 + (1 - 1/2) + (1 - 3/4) + (1 - 7/8) + dots.c \
  = & 1 + 1/2 + 1/4 + 1/8 +... = 2
$

In fact, the _supposedly obvious result_, when applies to this array, produces $1 = 0$. We have to be careful, and that is what this course is about.

Actually, $sum_(n = 1)^oo n (1/2)^n$ _does_ equal $2$, and both methods used _are_ justified, but this is _not_ obvious!

== Assumptions

1. The English language
2. Naive set theory
3. Elementary logic: _if_, _then_, negations, brackets, proof by induction, etc. \
  - $P ==> Q$ reads "$P$ implies $Q$" \
  - $P <==> Q$ reads "$P$ and $Q$ are equivalent" \
  - $exists$ reads "there exists", and $forall$ means "for all"
4. The natural numbers $NN = { bold(0), 1, 2, 3, ... }$
5. The integers $ZZ = { ..., -2, -1, 0, 1, 2, ... }$

== Field Axioms
#[
  #set enum(numbering: it => [A#it.])

  A *field* is a set $S$ satisfying the following axioms:
  + Any two elements $a, b in S$ have a sum $a + b in S$.
  + $(a + b) + c = a + (b + c)$ $forall a, b, c in S$
  + $exists thick 0 in S "st." a + 0 = a$ $forall a in S$
  + For each $a in S$, $exists thick (-a) in S "st." a + (-a) = 0$
  + $a + b = b + a$ $forall a, b in S$
  + Any two elements $a, b in S$ have a product $a b in S$.
  + $(a b) c = a (b c)$ $forall a, b, c in S$
  + $a (b + c) = a b + a c$ $forall a, b, c in S$
  + $a b = b a$ $forall a, b in S$
  + $exists thick 1 in S "st." 1 != 0 "and" 1 dot a = a$ $forall a in S$
  + For each $a in S$ where $a != 0$, $exists thick a^(-1) in S "st." a dot a^(-1) = 1$
]

For example, $QQ$, the set of rational numbers, is a field. The integers modulo $p$, where $p$ is a prime number, is also a field.

However, $ZZ$ itself is _not_ a field, as any integer $x$ such that $|x| > 1$ does not have a multiplicative inverse (A11). Similarly, $NN$ is not a field.

*Exercise*. Given a field $S$, prove:
+ $0 dot a = 0$ $forall a in S$
+ $-(-a) = a$ $forall a in S$
+ $(-1) dot a = -a$ $forall a in S$
+ $(-a)(-b) = a b$ $forall a, b in S$

== Constructing $QQ$ from $ZZ$

Suppose $p, q in ZZ$ and $q != 0$. Define $p / q$ like so:

$
  p/q = { (p', q') | p', q' in ZZ "st." q' != 0 }
$

It follows that $2 / 3 = 4 / 6 = (-6) / (-9)$, and so on. Note that this also defines an equivalence relation on $QQ$.

In $QQ$, we can define multiplication and addition as follows:

$
  (p_1 / q_1)(p_2 / q_2) =(p_1 p_2) / (q_1 q_2)
$

$
  p_1 / q_1 + p_2 / q_2 = (p_1 q_2 + p_2 q_1) / (q_1 q_2)
$

We must also check if these operations are well-defined. To check multiplication, we verify that

$
  p_1 slash q_1 = p'_1 slash q'_1 "and" p_2 slash q_2 = p'_2 slash q'_2 thick thick ==> thick thick (p_1 p_2) / (q_1 q_2) = (p'_1 p'_2) / (q'_1 q'_2)
$

and verifying addition is similar.

Finally, we must prove that $QQ$ satisfies the field axioms -- _easy, and boring_.

Note that $QQ$ contains a copy of $ZZ$, specifically the set ${ p slash 1 | p in ZZ }$. Therefore, $QQ supset.eq ZZ$.

== Ordered Fields

$ZZ$ has an *order*, which we know as:
$
  dots.c thick -2 < -1 < 0 < 1 < 2 thick dots.c
$

This induces an order on $QQ$ as follows:

$
  q_1 > 0 "and" q_2 > 0 thick thick ==> thick thick p_1/q_1 > p_2/q_2 " if " p_1 q_2 > p_2 q_1.
$

More generally, a field $S$ is an *ordered field* if it has a relation $>$ called 'greater than' satisfying the following axioms:
+ If $a, b in S$, then $a > b$ *or* $a = b$ *or* $b > a$; only one can be true.
+ If $a > b$ and $b > c$, then $a > c$ $thick forall a, b, c in S$.
+ $a > b ==> a c > b c$ $forall a, b, c in S "where" c > 0$.
+ $a > b ==> a + c > b + c$ $forall a, b, c in S$.

Notation-wise, we write:
- $a >= b$ for $a > b$ *or* $a = b$
- $a < b$ for $b > a$
- $a <= b$ for $a < b$ *or* $a = b$

*Remark.* If $x, y in QQ$ and $x < y$, then $(x + y) / 2 in QQ$ and $x < (x + y) / 2 < y$. Thus we cannot find the 'next' rational number for a given $p in QQ$ like we can with the integers.

