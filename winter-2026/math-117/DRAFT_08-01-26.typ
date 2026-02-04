#import "lecture-template.typ": *

#set document(
  title: "MATH 117 Notes Jan. 8, 2026",
  date: datetime(day: 8, month: 1, year: 2026),
)

#show: template

Given an ordered field $S$, we can prove the following statements:

1. $a < b <==> -a > -b$.
#box(stroke: 0.5pt, inset: 0.75em, width: 100%)[
  $
        & a < b \
    ==> & a + (-a - b) < b + (-a - b) \
    ==> & -b < -a \
        \
        & -a > -b \
    ==> & -a + (a + b) > -b + (a + b) \
    ==> & b > a thick qed
  $
]

2. If $a != 0$, then $a^2 > 0$.

#box(stroke: 0.5pt, inset: 0.75em, width: 100%)[
  $
        & a > 0 \
    ==> & a dot a > 0 dot a \
    ==> & a^2 > 0 \
        \
        & a < 0 \
    ==> & -a > 0 \
    ==> & (-a) dot (-a) > 0 dot (-a) \
    ==> & a^2 > 0 thick qed
  $
]

3. If $a > b > 0$ and $c > d > 0$, then $a c > b d$.

#box(stroke: 0.5pt, inset: 0.75em, width: 100%)[
  $
              & a c > b c \
              & b c > b d \
    therefore & a c > b d thick qed
  $
]

*Exercise.* Given an ordered field $S$, prove that if $a in S$, then $a^(-1) > 0$.

*Remark.* In any ordered field, $1 > 0 ==> 1 + 1 > 0 + 1$. Inductively,

$
  underbrace(1 + 1 + dots.c + 1, n "times") > underbrace(1 + 1 + dots.c + 1, n - 1 "times")
$

Therefore, an ordered field is not finite. Note as well that $n > n - 1$.

= The AGM Inequality

*Proposition.* Suppose that, in an ordered field, $a_1, a_2, ..., a_n$ are all greater than zero and _not all equal_. Then,

$
  a_1 a_2 dots.c a_n < ((a_1 + a_2 + dots.c + a_n)/n)^n.
$

Note that, for the elements $a_1, a_2, ..., a_n$, the expression $(a_1 + a_2 + dots.c + a_n)/n$ is the *arithmetic mean*, and $(a_1 a_2 dots.c a)^(1/n)$ is the *geometric mean*. Thus, this proposition is named for the 'arithmetic-geometric mean inequality.'

== Proof

Consider the case when $n = 2$. If $a_1 != a_2$, then $a_1 - a_2 != 0$. It follows that $(a_1 - a_2)^2 > 0$. With some manipulation, we arrive at

$
  a_1 a_2 < ((a_1 + a_2)/2)^2.
$

Hence, the proposition is true for $n = 2$.

Now, assume the proposition is true for some $n$ terms. Suppose that $a_1, a_2, ..., a_(2n)$ are given such that $a_1 != a_2$ and $a_i > 0$ for every $i$. Then, by the hypothesis,

$
  & a_1 a_2 dots.c a_n                && < ((a_1 + a_2 + dots.c + a_n)/n)^n \
  & a_(n + 1) a_(n + 2) dots.c a_(2n) && <= ((a_(n + 1) + a_(n + 2) + dots.c + a_(2n))/n)^n
$

Multiplying these two inequalities together:

$
  a_1 a_2 dots.c a_n & < (((a_1 + a_2 + dots.c + a_n)/n) dot ((a_(n + 1) + a_(n + 2) + dots.c + a_(2n)) / n))^n \
                     & < ((a_1 + a_2 + dots.c + a_(2n)) / (2n))^(2n) "by the" n = 2 "case"
$

Hence, it follows by induction that the proposition is true for all integers of the form $n = 2^m$. For integers not of this form, we proceed as follows.

Choose $m$ such that $2^m > n$. Let $A = (a_1 + a_2 + dots.c + a_n) slash n$. Then,

$
  a_1 a_2 dots.c a_n dot A^(2^m - n) & < ((a_1 + a_2 + dots.c + a_n + (2^m - n)A)/2^m)^(2^m) \
                                     & = ((n A + (2^m - n)A) / 2^m)^(2^m) \
                                     & = A^(2^m)
$

Now, multiplying both sides by $(A^(2^m - n))^(-1)$, we obtain $a_1 a_2 dots.c a_n < A^n$ as required. $qed$

= Motivation for the real numbers

To obtain $RR$, we want the axioms of ordered fields plus one more: the *least upper bound axiom*.

*Lemma.* There is no $x in QQ$ such that $x^2 = 2$.

*Proof.* Suppose $p slash q in QQ$ where $p^2 slash q^2 = 2$, $q > 0$, and $p$ and $q$ have no common factors.

Then $p^2 = 2q^2$. Therefore, $2 | p^2$ and so $2 | p$. By definition, $p = 2p'$ for some $p' in ZZ$.

By substitution, we get $2(p')^2 = q^2$, so $2 | q^2$ and thus $2 | q$. Hence, $2$ divides both $p$ and $q$, a contradiction. Therefore, there is no $x in QQ$ for which $x^2 = 2$. $qed$

= Bounds

Let $S$ be an ordered set that satisfies axioms B1-B4.

A non-empty subset $A subset.eq S$ is *bounded above* if there is a $b in S$ such that $b >= a$ for every $a in A$. The element $b$ is called an *upper bound* of $A$.

$A$ is *bounded below* if there is a $b' in S$ such that $b' <= a$ for every $a in A$. We say that $b$ is a *lower bound* of $A$.

If $A$ is both bounded above and bounded below, we say that $A$ is *bounded*.

For example, the set of even integers is not bounded above nor below. However, the set of negative integers is bounded above by any number greater or equal to $-1$.

== Least upper bound

Our last axiom, C, is known as the *least upper bound* or *completeness* axiom. An ordered set $S$ satisfies C if any non-empty subset $A subset.eq S$ bounded above has a least upper bound.

Symbolically, $S$ satisfies $C$ if there is a $b in S$ such that $b >= a$ for every $a in A$; and, if there is another $b' in S$ for which $b' >= a$ for every $a in A$, then $b' >= b$. We call $b$ the *least upper bound* of $A$. It is also known as the *supremum* of $A$.

We may notate $b$ as $"lub"(A)$, $sup(A)$, or $sup_a (a in A).$

As an example, $ZZ$ satisfies the axiom, but $QQ$ does not. For example, take $A subset.eq QQ$ where $A = { a in QQ | a^2 < 2 }$. Recall that no rational number $q$ satisfies $q^2 = 2$. Since it is also impossible to find the 'next' rational number, the set $A$ has no least upper bound.

= Constructing the reals

The set of real numbers $RR$ is an ordered field that satisfies the least upper bound axiom. That is, $RR$ satisfies axioms A1-A11, B1-B4, and C.

*Assertion.* The real numbers exist -- they can be constructed from $QQ$, which in turn comes from $ZZ$. In a sense, the reals are a _completion_ of $QQ$.
