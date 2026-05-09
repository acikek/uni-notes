#import "lecture-template.typ": *

#set document(
  title: "MATH 145 Notes May 5, 2026",
  date: datetime(day: 5, month: 5, year: 2026),
)

#show: template

#definition(number: none)[Base][
  Let $(X, upright(T))$ be a topological space. Then $upright(B) subset.eq upright(T)$ is a *base* for the topology $upright(T)$ if every open set $U in upright(T)$ is a union of sets in $upright(B)$.

  We call a set $B in upright(B)$ *basic open*.
]

#proposition(number: none)[
  Suppose $(X, upright(T))$ is a topological space. Then $upright(B)$ is a base for $upright(T)$ if and only if for every open set $U in upright(T)$, for any point $x in U$, there is some basic open set $B in upright(B)$ such that $x in B subset.eq U$.

  If $upright(B)$ satisfies this property, we say it is a base _one point at a time_.
]

#proof[
  First, suppose $upright(B)$ is a base one point at a time. Then let $U in upright(T)$ be an arbitrary open set.

  For all $x in U$, choose $B_x$ to be a basic open set with $x in B_x subset.eq U$. We claim

  $
    U = union.big_(x in U) B_x.
  $

  First, every point $x in U$ is in its own $B_x$, so $U$ is a subset of the union. Furthermore, the union is a union of subsets of $U$, so it is also a subset of $U$.

  Thus $U$ is equal to the union. Since $U$ was arbitrary, $upright(B)$ is a base.

  Conversely, suppose $upright(B)$ is a base. Let $U$ be an open set, and let $x in U$. Then $U$ is a union of basic open sets, meaning

  $
    U = union.big_(i in I) B_i quad "where" B_i in upright(B) "for all" i in I.
  $

  So $x in B_j$ for some $j in I$, meaning $x in B_j subset.eq U$.
]

#sbox([Defining a Topological Space from a Base])[
  So far, we have examined cases where $(X, upright(T))$ is already a topological space with the goal of finding a base for $upright(T)$. Now, we take $X$, not yet a topological space, and we wish to define _open_ in a way consistent with the topological axioms.

  Let $upright(B)$ be a family of subsets of $X$ which we want to be _basic open_. One idea is to define $U$ as _open_ if and only if it is a union of basic open sets.

  Unfortunately, this does not work. Consider $X = RR$ without the standard topology, and suppose $(1, 2)$ and $QQ$ are our basic open sets. Then $RR$ is not even open in this space.

  We need certain restrictions on which sets are basic open for this idea to work.
]

#theorem(number: none)[
  Given $X$ and a family of basic open sets $upright(B)$, define $U subset.eq X$ being _open_ to mean that $U$ is a union of basic open sets of $upright(B)$. Then this space meets the topological axioms if $upright(B)$ satisfies the following properties:

  - For every $x in X$, there is a basic open set $B in upright(B)$ such that $x in B$.

  - If $B_1$ and $B_2$ are basic open and $x in B_1 inter B_2$, then there is another basic open set $B$ where $x in B subset.eq B_1 inter B_2$.
]

#proof[
  The first condition is equivalent to $X$ being open.

  Also, the empty set $emptyset$ is open because it is a union of the empty family of (exactly zero) open sets.

  Suppose $union.big U_i$ is a union of open sets. If $x in union.big U_i$, then $x in U_j$ for some $j$, and we have $x in B subset.eq U_j$ for some basic open $B in upright(B)$, meaning

  $
    x in B subset.eq union.big U_i
  $

  so the entire union is also open.

  Suppose $U_1$ and $U_2$ are open, and let $x in U_1 inter U_2$. Then $x_1 in U_1$, so $x in B_1 subset.eq U_1$ for some basic open $B_1 in upright(B)$. Similarly, $x in B_2 subset.eq B_2$ for some $B_2 in upright(B)$.

  Now $x in B_1 inter B_2$, so by the second condition on $upright(B)$, there is some $B$ such that

  $
    x in B subset.eq B_1 inter B_2 quad ==> quad x in B subset.eq U_1 inter U_2
  $

  so $U_1 inter U_2$ is also open.
]

#definition(number: none)[Hausdorff][
  A topological space $(X, upright(T))$ is *Hausdorff* if for every pair of points $x$ and $y$ in $X$, if $x != y$, then there are some disjoint open sets $U$ and $V$ for which $x in U$ and $y in V$.

  In a sense, $x$ and $y$ can be _housed off_.
]
