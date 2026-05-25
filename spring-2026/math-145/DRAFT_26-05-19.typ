#import "lecture-template.typ": *

#set document(
  title: "MATH 145 Notes May 19, 2026",
  date: datetime(day: 19, month: 5, year: 2026),
)

#show: template

= Finite Product Spaces

In this section, we focus on product spaces of the form $X times Y$, where $X$ and $Y$ are topological spaces. With that foundation secured, products of the form

$
  X_1 times X_2 times dots.c times X_n
$

will be easy to understand.

#definition(number: none)[Product Space][
  Let $(X, upright(T))$ and $(Y, upright(U))$ be topological spaces. The *product space* of $X$ and $Y$ as

  $
    X times Y = { (x, y) : x in X, y in Y }
  $

  with basic open sets of the form

  $
    U times V "where" U "is" open(X) "and" V "is" open(Y)
  $
]

Indeed, these basic open sets generate a topology. First, $X times Y$ is itself basic open since $X$ is $open(X)$ and $Y$ is $open(Y)$. Moreover, if $U_1, U_2$ are $open(X)$ and $V_1, V_2$ are $open(Y)$,

$
  (U_1 times V_1) inter (U_2 times V_2) = (U_1 inter U_2) times (V_1 inter V_2)
$

so the intersection of two basic open sets is itself an open set. Hence this base generates the product topology on $X times Y$.

Open sets on the product topology can also be defined point-wise. A set $W subset.eq X times Y$ is open if and only if for every point $(x, y) in W$, there exist $U$ $open(X)$ and $V$ $open(Y)$ such that

$
  (x, y) in U times V subset.eq W.
$

#definition(number: none)[Projection Map][
  Let $X times Y$ be the product space of topological spaces $(X, upright(T))$ and $(Y, upright(U))$. The *projection maps* $pi_X$ and $pi_Y$ are defined as

  $
    pi_x & : X times Y -> X quad && (x, y) |-> x \
    pi_y & : X times Y -> Y quad && (x, y) |-> y
  $
]

#theorem(number: none)[
  Suppose $X times Y$ is a product space. Then the topology on $X times Y$ is the "smallest"---that is, having the fewest open sets---so that the projection maps are continuous.
]

#proof[
  Suppose $U subset.eq X$ is $open(X)$. Then

  $
    (x, y) in pi_X^(-1)(U) & <==> pi_X (x, y) in U \
                           & <==> x in U \
                           & <==> (x, y) in U times Y.
  $

  So $pi_X^(-1)(U) = U times Y$, which is basic open. Similarly, if $V$ is $open(Y)$, then $pi_Y^(-1) = X times V$, which is also basic open. Hence $pi_X$ and $pi_Y$ are continuous.
]

#theorem(number: none)[
  Projection maps are open; that is, if $W subset.eq X times Y$ is open in $X times Y$, then $pi_X (W)$ is open in $X$. Similarly, $pi_Y$ is open.
]

#proof[
  Suppose $W subset.eq X times Y$ is open in $X times Y$. We prove that $pi_X (W)$ is open one point at a time.

  Let $x in pi_X (W)$. Then $x = pi_X (x, y)$ where $(x, y) in W$ for some $y in Y$. Because $W$ is open, $(x, y) in U times V subset.eq W$ for some $open(X)$ $U$ and $open(Y)$ $V$.

  Hence $x in U subset.eq pi_X (W)$, meaning $pi_X (W)$ is $open(X)$. Similarly, $pi_Y (W)$ is $open(Y)$.
]

#theorem(number: none)[
  Suppose $X$, $Y$, and $Z$ are topological spaces and let $f : X times Y -> Z$ be a function. Then $f$ is continuous if and only if $pi_X compose f : Z -> X$ and $pi_Y compose f : Z -> Y$ are continuous.
]

#proof[
  If $f$ is continuous, then the result follows from the continuity of composing continuous maps.

  Conversely $pi_X compose f$ and $pi_Y compose f$ are continuous. Let $U times V$ be basic open in $X times Y$. So

  $
    z in f^(-1)(U times V) & <==> f(z) in U times V \
                           & <==> \(pi_X compose f)(z) in U thick "and" \(pi_Y compose f)(z) in V \
                           & <==> z in \(pi_X compose f)^(-1)(U) "and" z in \(pi_Y compose f)^(-1)(V).
  $

  Hence $f^(-1)(U times V) = \(pi_X compose f)^(-1)(U) inter \(pi_Y compose f)^(-1)(V)$, which is an intersection of open sets and thus open.

  We've shown $f$ is "basically continuous," as $f^(-1)(B)$ for basic open $B$ is open. Any open set is a union of basic open sets $B_a$, so

  $
    f^(-1)(union.big B_a) = union.big f^(-1)\(B_a)
  $
  which is a union of open sets. So $f$ being "basically continuous" implies it is indeed continuous.
]

= Quotient Spaces

Let $X$ be a topological space, and let $~$ be an equivalence relation on $X$. One idea is to "glue" equivalent parts of $X$ together.

Let $Y = X slash tilde.basic$. A point in $Y$ corresponds to an equivalence class in $X$. We define

$
  pi : X -> Y quad x |-> [x]_~
$

to be a function mapping $x in X$ to its equivalence class in $Y$.

If we define an $open(Y)$ set $V$ such that $pi^(-1)(V)$ is $open(X)$, we endow $Y$ with the *quotient topology*.

#example[
  Taking a square and "gluing" its parallel edges is homeomorphic to a torus.
]
