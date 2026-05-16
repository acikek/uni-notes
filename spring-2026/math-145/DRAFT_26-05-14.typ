#import "lecture-template.typ": *

#set document(
  title: "MATH 145 Notes May 14, 2026",
  date: datetime(day: 14, month: 5, year: 2026),
)

#show: template

= Connectedness

#definition(number: none)[Connectedness][
  Let $(X, upright(T))$ be a topological space. Then $X$ is *disconnected* if there some subsets $U$ and $V$ of $X$ such that

  - $U$ and $V$ are both nonempty and open

  - $U union V = X$

  - $U inter V = emptyset$.

  We say $X$ is *connected* if it is not disconnected.
]

#definition(number: none)[Connectedness of a Subspace][
  If $A subset.eq X$ is a subset in a topological space $(X, upright(T))$, then $A$ is connected if it is a connected topological space given the subspace topology. That is, $A$ is disconnected if there are some $open(X)$ sets $U$ and $V$ such that

  - $U union A != emptyset$, and $V union A != emptyset$

  - $A subset.eq U union V$

  - $U inter V inter A = emptyset$.
]

#example[
  The space $RR^n$ equipped with the usual topology is connected.

  However, $QQ$, as a subspace of $RR$, is disconnected. Neither is the empty set a connected subset of $RR$.

  The integers $ZZ$ with the cofinite topology, wherein $U$ is open if and only if $ZZ without U$ is finite or $U$ is empty, is connected. In fact, there are no disjoint nonempty open sets in this topology.

  If $(X, upright(T))$ is a topological space, then ${ x }$ is a connected subset for any $x in X$.
]

#remark[
  In the definition of disconnectedness, the sets $U$ and $V$ are called *clopen*. That is, they are simultaneously closed and open.
]

// 8.1
#theorem(number: none)[
  Suppose $f : X -> Y$ is a continuous map between two topological spaces $(X, upright(T))$ and $(Y, upright(U))$. Then the image $f(X)$ is a connected subset of $Y$.
]

#proof[
  We prove this by contraposition. Suppose $f(X) subset.eq Y$ is not connected. Then there are some $open(Y)$ sets $U$ and $V$ that disconnect $f(X)$, following from the definition.

  Then $f^(-1)(U)$ and $f^(-1)(V)$ are both $open(Y)$ nonempty subsets of $X$, since $f$ is continuous. Furthermore, $f^(-1)(U) union f^(-1)(V) = X$, and $f^(-1)(U) inter f^(-1)(V) = emptyset$. So $X$ is not connected.

  By contraposition, if $X$ is connected, then $f(X)$ is a connected subset of $Y$.
]

#definition(number: none)[Connected Component][
  Let $(X, upright(T))$ be a topological space, and let $x in X$. Then the *connected component* of $x$, denoted $C(x)$, is the union of all connected sets that contain $x$.
]

// TODO: picture of two boxes

#example[
  Given $QQ$ endowed with the subspace topology from $RR$, the connected component of any $p in QQ$ is simply $C(p) = { p }$.

  If there were any rational $q != p$ in this set, there would be an irrational number between $p$ and $q$ that would admit two disjoint sets open in $RR$ to disconnect $C(p)$.
]

// 8.3a
#theorem(number: none)[
  Suppose $(X, upright(T))$ is a topological space. Then given $x in X$, the connected component $C(x)$ is connected.
]

#proof[
  We prove this by contradiction. Suppose $C(x)$ is not connected. Then there are some open sets $U$ and $V$ that disconnect $C(x)$.

  Without loss of generality, suppose $x in U$. Let $y in V inter C(x)$. Since $y in C(x)$, then some connected set $A$ contains both $x$ and $y$. However,

  - $U inter V inter A subset.eq U inter V inter C(x) = emptyset$

  - $A subset.eq C(x) subset.eq U union V$

  - $x in U inter A$, so $U inter A != emptyset$

  - $y in V inter A$, so $V inter A != emptyset$.

  Thus, $A$ is disconnected. This is impossible, so $C(x)$ must be connected.
]

// 8.3b
#theorem(number: none)[
  Suppose $(X, upright(T))$ is a topological space. Then $C(x)$ is the _maximal_ connected set containing $x in X$. That is, there is no connected set $A$ such that $C(x) subset.neq A$.
]

#proof[
  We prove this by contradiction. Suppose there is a connected set $A$ such that $x in C(x) subset.neq A$. Then $x in A$, so $A$ is in the union that defines $C(x)$. So $A subset.eq C(x)$, but this is impossible.
]

// 8.3c
#theorem(number: none)[
  Suppose $(X, upright(T))$ is a topological space. Then given distinct points $x$ and $y$ in $X$, either $C(x) = C(y)$ or $C(x)$ and $C(y)$ are disjoint.
]

#proof[
  The notetaker implores you to accept this theorem as fact until she figures out how to draw the figures presented in lecture.
]

#remark[
  In summary, connected components partition a topological space.
]

#theorem(number: none)[
  Intervals in $RR$ with the usual topology are connected.
]

#proof[
  We prove that the interval $[0, oo) subset.eq RR$ is connected. Suppose for contradiction that open sets $U$ and $V$ disconnect it. Without loss of generality, suppose $0 in U$. Then $V$ is nonempty and bounded below, so let $x = inf V$.

  Suppose $x in U$. Then there is a nonzero radius $r$ such that $B(x, r) subset.eq U$, so $x + r$ is a larger lower bound for $V$, meaning $x != inf V$.

  Instead, suppose $x in V$. Then $B(x, r) subset.eq V$ for some nonzero $r$, meaning $x - r / 2 in V$, so once again $x != inf V$.

  Either case yields a contradiction, so no such sets $U$ and $V$ disconnect $[0, oo)$. Thus, it is connected.
]

// TODO: does this actually complete the proof lol
#exercise(number: none)[
  Complete the above proof by showing that $(-oo, 0]$ is connected.
]

// TODO: the following examples:
// f : [0, oo) ->> RR where f(x) = x sin x
// f : [0, oo) ->> [-1, 1] where f(x) = sin x

= Paths and Path-Connectedness

#definition(number: none)[Path][
  Let $(X, upright(T))$ be a topological space. A *path* from $a$ to $b$ where $a, b in X$ is a continuous map $f : [0, 1] -> X$ such that $f(0) = a$ and $f(1) = b$.
]

#definition(number: none)[Path-Connectedness][
  We call a topological space $(X, upright(T))$ *path-connected* if for every pair of points $a, b in X$, there is a path from $a$ to $b$.

  We write $a ~ b$ if there exists a path from $a$ to $b$.
]

#proposition(number: none)[
  The existence of a path between points is an equivalence relation.
]

#proof[
  Suppose $(X, upright(T))$ is a topological space.

  - Given $x in X$, the constant function $f : [0, 1] -> X$ where $f(t) = x$ is a path from $x$ to $x$. So $x ~ x$, proving reflexivity.

  - Suppose $x, y in X$. If $f$ is a path from $x$ to $y$, then we define $g : [0, 1] -> X$ such that $g(t) = f(1 - t)$. Then $g$ is a path from $y$ to $x$. Thus $y ~ x$, proving symmetry.

  - Suppose $x, y, z in X$. If $f$ is a path from $x$ to $y$ and $g$ a path from $y$ to $z$, then we define $h : [0, 1] -> X$ such that

    $
      h(t) = cases(f(2t) &"if" t <= 1/2, g(2t - 1) quad &"if" t>= 1/2)
    $

    Then $h$ is a path from $x$ to $z$. So $x ~ z$, proving transitivity.
]

#remark[
  The equivalence classes of the above relation are the path-connected components of the space.
]

#theorem(number: none)[
  A path-connected topological space $(X, upright(T))$ is connected.
]

#proof[
  Suppose for contradiction that $X$ is path-connected but also disconnected by open sets $U$ and $V$. Let $f : [0, 1] -> X$ be a path from a point in $U$ to a point in $V$. Then $f^(-1)(U)$ and $f^(-1)(V)$ disconnect $[0, 1]$, but we know this interval is connected. So $X$ must be connected.
]
