#import "lecture-template.typ": *

#set document(
  title: "MATH 145 Notes May 7, 2026",
  date: datetime(day: 7, month: 5, year: 2026),
)

#show: template

#definition(number: none)[Compactness][
  A topological space $(X, upright(T))$ is *compact* if every open cover has a finite subcover. That is, if

  $
    X = union.big_(alpha in Omega) U_alpha
  $

  is an open cover, then there is some finite subcover

  $
    X = U_alpha_1 union U_alpha_2 union dots.c union U_alpha_n
  $

  for some $alpha_1, ..., alpha_n in Omega$.
]

#remark[
  Suppose $Y$ is a subset of a topological space $(X, upright(T))$. Then we have notions of $open(X)$ and $open(Y)$. So an open cover of $Y$ is a collection $U_alpha$ of $open(Y)$ sets such that $Y subset.eq union.big U_alpha$, and a finite subcover is $Y subset.eq U_alpha_1, union dots.c union U_alpha_2$.

  Note here that open covers (and subcovers) may contain more than the subset. However, when restricted to the subspace topology, the union becomes equal to the subset.
]

#theorem(number: none)[
  Suppose $A, B subset.eq X$ are compact subspaces of a topological space $(X, upright(T))$. Then their union $A union B$ is also compact.
]

#proof[
  Let $A union B subset.eq union.big U_alpha$ be an open cover of the union. Then it is an open cover of $A$ since $A subset.eq A union B$, so it has a finite subcover

  $
    A subset.eq U_alpha_1 union dots.c union U_alpha_n.
  $

  Similarly,

  $
    B subset.eq U_beta_1 union dots.c union U_beta_m.
  $

  Then

  $
    A union B subset.eq U_alpha_1 union dots.c union U_alpha_n union U_beta_1 union dots.c union U_beta_m
  $

  is a finite subcover of the union. So $A union B$ is compact.
]

#theorem(number: none)[
  Suppose $(X, upright(T))$ is a compact topological space and $A subset.eq X$ is closed. Then $A$ is a compact subset.
]

#proof[
  Suppose $a subset.eq union.big U_alpha$ is an open cover of $A$.

  If $X = union.big U_alpha$, then this has a finite subcover because $X$ is compact, meaning

  $
    A subset.eq U_alpha_1 union dots.c union U_alpha_n.
  $

  If this open cover is a proper subset of $X$, then we can add one more open set, namely $X without A$.

  So $X = union.big U_alpha union (X without A)$ is an open cover of $X$, hence it has a finite subcover

  $
    X = (X without A) union U_alpha_1 union dots.c union U_alpha_n.
  $

  Then

  $
    A subset.eq U_alpha_1 union dots.c union U_alpha_n
  $

  so in either case, this open cover of $A$ has a finite subcover. Thus, $A$ is compact.
]

#theorem(number: none)[
  Suppose $(X, upright(T))$ is a topological space that is Hausdorff, and $A subset.eq X$ is a compact subset. Then $A$ is closed.
]

#proof[
  We prove that $X without A$ is open.

  Let $x in X without A$. Then because $A$ is Hausdorff, for every $a in A$, we can find disjoint open sets $U_a$ and $V_a$ such that $a in U_a$ and $x in V_a$.

  Now $A subset.eq limits(union.big)_(a in A) U_a$ is an open cover of $A$, so it has a finite subcover

  $
    A subset.eq U_a_1 union dots.c union U_a_n.
  $

  Given these indices, we know $x in V_a_1 inter dots.c inter V_a_n = V$. Then $V$ is an intersection of finitely many open sets, so $V$ is open. It is also a disjoint from $A$, since every point $a in A$ is an element of some $U_a_i$ which is disjoint from $V$.

  Now $x in V subset.eq X without A$, so $x$ is interior to $X without A$. Since $x$ was arbitrary, $X without A$ is open.
]

#theorem(number: none)[
  Suppose $(X, upright(T))$ and $(Y, upright(U))$ are topological spaces, and suppose $f : X -> Y$ is a continuous function. Then if $X$ is compact, $f(X)$ is a compact subset of $Y$.
]

#proof[
  Suppose $f(X) subset.eq union.big V_alpha$ is a cover for sets $V_alpha$ open in $Y$. Then if $x in X$, we have $f(x) in f(X)$, so $f(x) in V_alpha$ for some $alpha$. Hence $x in f^(-1)\(V_alpha)$, meaning

  $
    X = union.big f^(-1)\(V_alpha)
  $

  is an open cover of $X$. Since $X$ is compact, there is a finite subcover

  $
    X = f^(-1)\(V_alpha_1) union dots.c union f^(-1)\(V_alpha_n).
  $

  Now for any $f(x) in f(X)$, we know $x in X$ and thus $x in f^(-1)\(V_alpha_i)$ for some $i$, so indeed $f(x) in V_alpha_i$. Thus

  $
    f(X) subset.eq V_alpha_1 union dots.c union V_alpha_n
  $

  is a finite subcover of $f(X)$. Therefore, $f(X)$ is compact.
]

#theorem(number: none)[
  Suppose $(X, upright(T))$ is compact, $(Y, upright(T))$ is Hausdorff, and $f : X -> Y$ is a continuous and bijective function. Then $f$ is a homeomorphism.
]

#proof[
  We first prove that $f$ is a *closed map*, meaning if $A subset.eq X$ is $closed(X)$, then $f(X)$ is $closed(Y)$.

  Suppose $A subset.eq X$ is closed. Then we know $A$ is compact, so $f(A)$ is also compact. Hence $f(A)$ is closed because it is a compact subset of a Hausdorff space.

  Now we prove that $f$ is an *open map*. If $U subset.eq X$ is $open(X)$, then $X without U$ is $closed(X)$. So $f(X without U)$ is $closed(Y)$, but $f(U) subset.eq Y without f(X without U)$ because $f$ is a bijection.

  #exercise(number: none)[
    Explain the above statement.
  ]

  We now prove $f^(-1) = g : Y -> X$ is continuous. Since $f$ is bijective, we know $g(y)$ equals the unique $x$ for which $f(x) = y$. Moreover, if $U$ is an $open(X)$ set, $g^(-1)(U)$ is the preimage of $U$, hence $y in g^(-1)(U)$ if and only if $g(y) in U$. This implies $x in U$, meaning $y in f(U)$. So $g^(-1)(U) = f(U)$, which is open. Hence $g$ is continuous.
]

#example[
  The space $[0, 1]$ with the standard topology on $RR$ is compact.

  However, there is no continuous bijection between $[0, 1]$ and $[0, 1] times [0, 1]$. Isn't that interesting?
]

#definition(number: none)[Connected][
  A topological space $(X, upright(T))$ is *_not_ connected* if there are some open sets $U$ and $V$ such that

  - $U$ and $V$ are disjoint

  - Their union $U union V$ equals $X$

  - $U$ and $V$ are both nonempty
]
