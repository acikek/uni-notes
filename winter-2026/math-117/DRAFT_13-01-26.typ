#import "../../template.typ": *

#set document(
  title: "MATH 117 Notes Jan. 13 2026 (Draft)",
  date: datetime(day: 13, month: 1, year: 2026),
)

#title()

= Elementary properties of $RR$

- $exists thick 0, 1 in RR$
- $1 > 0$
- $1 + 1 + dots.c + 1 > 0$, and so on

We denote $1 + 1 + dots.c + 1$ ($n$ times) by $n$. So we have a copy of $NN$ in $RR$, whence we also have a copy of $ZZ$ in $RR$.

$exists thick m^(-1) in RR$ ($m != 0$), and $m dot n^(-1)$ corresponds to $m slash n in QQ$. So there is a copy of $QQ$ in $RR$.

$RR without QQ = { x in RR : x in.not QQ }$ is called the set of *irrational numbers*.

We will show that $exists thick sqrt(2) in RR without QQ$ such that $(sqrt(2))^2 = 2$.

Note that $1 - sqrt(2)$ is irrational, as the sum of a rational and an irrational number is irrational, but $(1 - sqrt(2)) + sqrt(2) in QQ$. Thus, the irrational numbers are _not_ closed under addition.

The set $QQ$ is countable, but the set $RR$ is uncountable.

$NN subset.eq ZZ subset.eq QQ subset.eq RR subset.eq CC subset.eq HH$ (where $HH$ is the set of quaternions).

= Theorems of $RR$

*Theorem 2.* _Archimedes' Axiom_.
Let $a in RR$. Then $exists n in ZZ$ st. $n > a$.

_Proof._ Suppose not. Then $a >= n thick forall n in ZZ$, i.e. $ZZ$ is bounded above by $a$. \
So there exists a least upper bound $b in RR$ of the set $ZZ$ (by axiom C).
Hence $b - 1$ is not an upper bound of $ZZ$, and so $exists n_0 in ZZ$ with $b - 1 < n_0 <= b$. \
Adding $1$ to the inequality gives $b < n_0 + 1$. But $n_0 + 1 in ZZ$, a contradiction. This proves the result.

Thus there is no "$oo$" $in RR$; there is no biggest real number.

*Corollary.* Given any $epsilon > 0$, $epsilon in RR$, $exists N in ZZ$ st. if $n in ZZ$ and $n > N$, then $epsilon > 1 / n > 0$.

_Proof._ There exists $N in ZZ$ st. $N > 1 / epsilon$ (by Thm. 2). If $n > N$, then $n > 1 / epsilon$.  \ Therefore $epsilon > 1 / epsilon$ (by axiom B4).

*Lemma 3.* $exists sqrt(2) in RR$, i.e. $exists x in RR$ st. $x^2 = 2$, and $1 < x < 2$.

_Proof._ Let $A = { a in RR : a^2 < 2 }$. Now $1 in A$, so $A != diameter$. If $a in A$, then $a < 2$ since $2^2 = 4 > 2$. \
Hence $A$ is a non-empty set, and $2$ is an upper bound. \
Let $x = "lub"(A)$. This exists by axiom C, and $2 > x > 1$.

+ Suppose that $x^2 < 2$. \
  Let $alpha = 2 - x^2 > 0$. \
  Suppose that $0 < delta < 1$. Then,
  $
    (x + delta)^2 - x^2 = delta(2x + delta) < delta(2 dot 2 + 1) = 5delta.
  $
  Choose $delta$ st. $0 < delta < alpha / 5$. Then,
  $
    (x + delta)^2 - x^2 < alpha
    ==> (x + delta)^2 < alpha + x^2
    ==> (x + delta)^2 < 2
  $
  i.e. $x + delta in A$. \
  Hence $x$ is not an upper bound for $A$ since $x gt.eq.not x + delta$, a contradiction.

+ Suppose that $x^2 > 2$. \
  Let $beta = x^2 - 2 > 0$. \
  Suppose that $0 < delta < 1$. Then,
  $
    x^2 - (x - delta)^2 = delta(2x - delta) < delta(2x) < 4delta.
  $
  Choose $delta$ st. $0 < delta < beta / 4$. Then,
  $
    x^2 - (x - delta)^2 < beta ==> 2 < (x - delta)^2.
  $
  If $a in A$, then $a^2 < 2 < (x - delta)^2$. Therefore, $a < x - delta$ (note that $x - delta > 0$). \
  Therefore $x - delta$ is an upper bound for $A$. Hence $x$ is not the lowest upper bound of $A$, a contradiction.

We therefore conclude that $x^2 = 2$.

*Theorem 4.* If $a, b in RR$, and $a < b$, then there exist rational and irrational numbers strictly between $a$ and $b$.

_Proof._ Without loss of generality, assume that $0 < a < b$. \

Choose $q in NN$ such that $1 / q < b - a$ ($because$ corollary to Thm. 2) \
Now consider the set ${ n dot (1/q) : n in NN }$.
Thm. 2 implies that this set is unbounded. \
Let $n_0$ be the largest non-negative integer such that $n_0 / q <= a$. Then,
$
  a < (n_0 + 1) / q <= a + 1 / q < a + (b - a) = b
$
and so we have constructed a rational number $alpha = (n_0 + 1) / q$ with $a < alpha < b$.

Now, we know that $0 < sqrt(2)/2 < 1$. The number $a + (b - a)sqrt(2)/2$ lies between $a$ and $b$ and is irrational. \
This completes the proof.

= More on bounds

*Remark.* If $A subset.eq RR$, $A != diameter$, and $A$ is bounded above, $A$ has a least upper bound. As an exercise, show that this least upper bound is unique.

If $A$ has a maximum, i.e. $exists M in A$ st. $M >= a thick forall a in A$, then $M = "lub"(A)$.

== Lower bounds

Suppose $diameter != A subset.eq RR$ and that $A$ is bounded below, i.e. $exists b in RR$ st. $b <= a thick forall a in A$. \
Then $-b >= -a thick forall a in A$.

Define $-A = { -a : a in A}$. \
Then $-b$ is an upper bound for $-A$, and so $"lub"(-A)$ exists. \
Define the *greatest lower bound* of $A$ to be $"lub"(-A)$.

We notate this as $"glb"(A)$, the *infimum* of $A$, $inf(A)$, or $inf_(a in A)(a)$.
