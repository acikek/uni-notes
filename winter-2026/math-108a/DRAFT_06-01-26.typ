#import "lecture-template.typ": *

#set document(
  title: "MATH 108A Notes Jan. 6, 2026",
  date: datetime(month: 1, day: 6, year: 2026),
)

#show: template

= Introduction

_Linear Algebra is the study of linear equations and linear maps between linear spaces._

A *linear equation* is an equation of the form

$
  c_1 x_1 + c_2 x_2 + dots.c + c_n x_n = 0
$

where each $c_i$ is a *scalar* and each $x_i$ is a *variable*.

A *linear map* is a function $f : X -> Y$

= Fields

We are familiar with $RR$, the set of real numbers, which may be defined as

$
  RR = QQ union RR without QQ
$

Consider $CC$, the set of complex numbers. The set is defined as

$
  CC = { a + b i | a, b in RR } "where" i = sqrt(-1).
$

We can add and multiply complex numbers like so:

$
    (a + b i) + (c + d i) & = (a + c) + (b + d)i \
                          \
  (a + b i) dot (c + d i) & = a c + a d i + b c i - b d \
                          & = a c - b d + (a d + b c)i
$

The real numbers $RR$ and the complex numbers $CC$ are examples of *fields*.

== Properties of $CC$

+ *Commutativity of $+$ and $dot$* \
  $forall alpha, beta in CC$, $alpha + beta = beta + alpha$ and $alpha beta = beta alpha$
+ *Associativity of $+$ and $dot$* \
  $forall alpha, beta, gamma in CC$, $(alpha + beta) + gamma = alpha + (beta + gamma)$ and $(alpha beta) gamma = alpha (beta gamma)$
+ *Existence of the additive identity* \
  $exists! thick 0 in CC$ such that $forall alpha in CC$, $alpha + 0 = 0 + alpha = alpha$
+ *Existence of the multiplicative identity* \
  $exists! thick 1 in CC$ such that $forall alpha in CC$, $alpha dot 1 = 1 dot alpha = alpha$
+ *Existence of the additive inverse* \
  $forall alpha in CC$, $exists! thick beta in CC$ such that $alpha + beta = beta + alpha = 0$. We notate $beta$ as $-alpha$.
+ *Existence of the multiplicative inverse* \
  $forall alpha in CC$ where $alpha != 0$, $exists! thick beta in CC$ such that $alpha beta = beta alpha = 1$ We notate $beta$ as $1 / alpha$.
+ *Distributivity* \
  $forall alpha, beta, gamma in CC$, $alpha (beta + gamma) = alpha beta + alpha gamma$ and $(alpha + beta) gamma = alpha gamma + beta gamma$

*Example.*
Consider $2 + 3i in CC$. The additive inverse is $-2 - 3i$, and the multiplicative inverse can be found like so:

$
  1 / (2 + 3i) dot (2 - 3i) / (2 - 3i) = 2 / 13 - (3i) / 13
$

*Example.*
Prove that $alpha beta = beta alpha$ for every pair $alpha, beta in CC$.

*Proof.* Let $a, beta in CC$. Then $alpha = a + b i$ and $beta = c + d i$ for some $a, b, c, d in RR$.

Expanding the expression $alpha beta$, we get:

$
  alpha beta & = (a + b i) (c + d i) \
             & = a c + a d i + b c i + b d i^2 \
             & = c a + d a i + c b i + d b i^2 \
             & = (c + d i) (a + b i) \
             & = beta alpha. thick qed
$

== Examples of Fields

We notate a general field with the symbol $FF$. Importantly, elements of a field $FF$ are *scalars*. Some notable fields include:

- $RR^2 = { (x, y) | x, y in RR }$
- $RR^3 = { (x, y, z) | x, y, z in RR }$
- $RR^n = { (x_1, x_2, ..., x_n) | x_i in RR "for" i = 1, 2, ..., n }$
- $CC^2 = { (zeta_1, zeta_2) | zeta_1, zeta_2 in CC } = { (a + b i, c + d i) | a, b, c, d in RR }$
- $QQ = { p slash q | p, q in ZZ }$

More generally,

$
  FF^n = \{ #math.underbrace($(x_1, x_2, ..., x_n)$)[$n$-tuple] | x_i in FF "for" i = 1, 2, ..., n \} "is a field."
$

In this course, we will restrict ourselves to using $RR$ and $CC$.

== Operations in Fields

$x_i$ is the $i$th coordinate of the $n$-tuple $(x_1, x_2, ..., x_n)$.

Given a field $FF^n$ and $x_i, y_i in FF^n$ where $i = 1, 2, ..., n$,

$
  (x_1, x_2, ..., x_n) + (y_1, y_2, ..., y_n) = (x_1 + y_1, x_2 + y_2, ..., x_n + y_n).
$

*Example.*
Observe the addition of two tuples in $RR^3$:

$
  (2, 3, 4) + (-1, 9, -6) = (2 - 1, 3 + 9, 4 - 6) = (1, 12, -2)
$

It follows that the additive identity of $FF^n$ is an $n$-tuple $(0, 0, ..., 0)$ where $0$ is the additive identity of $FF$.

Fields also support scalar multiplication. Given a scalar $lambda in FF$ and a tuple $x in FF^n$,

$
  lambda x = lambda (x_1, x_2, ..., x_n) = (lambda x_1, lambda x_2, ..., lambda x_n).
$

== Binary Operations

An operation $circle.small$ on a set $S$ is said to be a *binary* if for every pair $a, b in S$, it holds that $a thick circle.small thick b in S$. That is, $circle.small$ is a function where

$
  circle.small : S times S -> S.
$

We say that $S$ is *closed* under $circle.small$.

=== Examples of Binary Operations

- Addition on $RR$, i.e. $f(a, b) = a + b$
- Multiplication on $RR$, i.e. $f(a, b) = a dot b$
- Addition and multiplication on $QQ$
- Addition on $M_(2 times 2)(RR)$, or real 2-by-2 matrices

Multiplication is _not_ a binary option on the irrationals $RR without QQ$. For instance, $sqrt(2) dot sqrt(2) in.not RR without QQ$.

= Vector Spaces

A *vector space* $V$ over a field $FF$ is a set with two operations, namely addition ($+$) and scalar multiplication ($dot$), for which the following properties hold:
1. *Commutativity* \
  $u + v = v + u$ $forall u, v in V$
2. *Associativity* \
  $(u + v) + w = u + (v + w)$ $forall u, v, w in V$
3. *Existence of the additive identity* \
  $exists thick 0 in V$ such that $v + 0 = 0 + v$ $forall v in V$
4. *Existence of the additive inverse* \
  $forall u in V thick exists v in V$ such that $u + v = 0$. We notate $v$ as $-u$.
5. *Existence of the multiplicative identity* \
  $1 dot v = v dot 1 = v$ $forall v in V$ where $1 in FF$
6. *Distributivity* \
  $(a b)v = a(b v)$ $forall a, b in FF$ $forall v in V$
7. _unnamed_ \
  $a(u + v) = a u + a v$ $forall a in FF$ $forall u, v in V$
8. _unnamed_ \
  $(a + b)v = a v + b v$ $forall a, b in FF$ $forall v in V$

Note that addition is a binary operation, but scalar multiplication is not.

=== Examples of Vector Spaces

- $RR$ is a vector space over itself
- $CC$ is a vector space over itself
- $CC$ is a vector space over $RR$
- $RR^n$ is a vector space over $RR$
- $CC^n$ is a vector space over $CC$
- $FF^n$ is a vector space over $FF$ for any field $FF$

*Example*.
Is $RR$ a vector space over $RR^2$?

*No*. For instance, consider a vector $x in RR$ and a the multiplicative identity $(1, 1) in RR^2$. We would expect $(1, 1) dot x = x$, but in fact $(1, 1) dot x = (x, x) in.not RR$.

*Example.*
Is the empty set a vector space?

*No*, the empty set is missing identities ($0$ and $1$). Therefore, a vector space can never be empty.  The simplest vector space is ${ 0 }$ over $RR$.
