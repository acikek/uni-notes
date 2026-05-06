#import "lecture-template.typ": *

#set document(
  title: "MATH 145 Notes Apr. 30, 2026",
  date: datetime(day: 30, month: 4, year: 2026),
)

#show: template

#definition(number: none)[Subspace Topology][
  Let $(X, upright(T))$ be a topological space. Then $\(Y, upright(T)_Y)$ is a *subspace topology* if

  - $Y$ is a subset of $X$, and
  - A set $U subset.eq Y$ is open if there is some $V subset.eq X$ open in $X$ where $U = V inter Y$. That is,

    $
      U in upright(T)_Y <==> exists V subset.eq upright(T) "st." U = V inter Y.
    $
]

#note[
  We use the notation *$open(X)$* to say that a set is open in a topological space $X$. If a set is open in a subspace topology, we may say the set is *relatively open*.
]

#proposition(number: none)[
  A subspace topology satisfies the topological axioms.
]

#proof[
  Suppose $\(Y, upright(T_Y))$ is a subspace topology of $(X, upright(T))$. Then

  - We have $emptyset = emptyset inter Y$, and $emptyset$ is $open(X)$, so $emptyset$ is $open(Y)$.

  - Also, $Y = X inter Y$, and $X$ is $open(X)$, so $Y$ is $open(Y)$.

  - If $U_1$ and $U_2$ are $open(Y)$, then

    $
      U_1 = V_1 inter Y quad "and" quad U_2 = V_2 inter Y
    $

    for some $V_1$ and $V_2$, both $open(X)$. So $U_1 inter U_2 = \(V_1 inter V_2) inter Y$. We know $V_1 inter V_2$ is $open(X)$ by the topological axioms, so $U_1 inter U_2$ is $open(Y)$.

  - Suppose $U_alpha$ are $open(Y)$ for $alpha$ in some indexing set. Then $U_alpha = V_alpha inter Y$ for some $open(X)$ set $V_alpha$, for every $alpha$. Hence

    $
      union.big U_alpha = union.big \(V_alpha inter Y) = (union.big V_alpha) inter Y.
    $

    Since $union.big V_alpha$ is $open(X)$, the union $union.big U_alpha$ is $open(Y).$
]

#definition(number: none)[Relatively Closed][
  Let $A subset.eq Y subset.eq X$ for a topological space $(X, upright(T))$ and subspace topology $\(Y, upright(T)_Y)$. Then we say $A$ is *$closed(Y)$*, or *relatively closed*, if $Y without A$ is $open(Y)$.
]

#theorem(number: none)[
  Suppose $A subset.eq Y subset.eq X$ for a topological space $(X, upright(T))$ and subspace topology $(Y, upright(T)_Y)$. Then $A$ is $closed(Y)$ if and only if $A = B inter Y$ for some $B$ that is $closed(X)$.
]

#proof[
  To begin, suppose $A$ is $closed(Y)$. Then $Y without A$ is $open(Y)$, so $Y without A = V inter Y$ for some $V$ that is $open(X)$. It follows that $A = Y without V$. Furthermore, $A = (X without V) inter Y$, hence $X without Y$ is $closed(X)$. Therefore, $A$ is a $closed(X)$ set intersected with $Y$.
]

#exercise(number: none)[
  Finish the proof above by showing the converse.
]

#theorem(number: none)[
  Suppose $A subset.eq Y subset.eq X$ and $b in Y$ where $(X, upright(T))$ is a topological space with a subspace topology $\(Y, upright(T)_Y)$. Then $b$ is $adherent(X)$ to $A$ if and only if $b$ is $adherent(Y)$ to $A$.
]

#proof[
  Suppose $b$ is $adherent(X)$ to $A$. Let $U$ be an arbitrary $open(Y)$ neighborhood of $b$. So $U = V inter Y$ for some $V$ that is $open(X)$. Hence $V$ is open neighborhood of a point $adherent(X)$ to $A$, meaning $V$ meets $A$. Thus $U$ meets $A$, as $U inter A = V inter A$. So $b$ is $adherent(Y)$ to $A$.

  Conversely, suppose $b$ is $adherent(Y)$ to $A$. Let $V$ be an $open(X)$ neighborhood of $b$. Then $V inter Y$ is an $open(Y)$ neighborhood of $b$, so $V inter Y$ meets $A$. Thus

  $
    V inter A = V inter Y inter A != emptyset.
  $

  So $V$ meets $A$, meaning $b$ is $adherent(X)$ to $A$.
]

= Continuity in Topological Spaces

#definition(number: none)[Continuous][
  Let $f : X -> Y$ be a function where $\(X, upright(T))$ and $(Y, upright(U))$ are topological spaces. Then $f$ is *continuous* if for every $V subset.eq Y$ that is $open(Y)$, the preimage $f^(-1)(V)$ is $open(X)$.
]

#definition(number: none)[Continuous at a Point][
  Let $f : X -> Y$ where $(X, upright(T))$ and $(Y, upright(U))$ are topological spaces. Suppose $x in X$ and its image $f(x) = y in Y$.

  Then $f$ is *continuous at $x$* if for every open neighborhood $V$ of $y$, $f^(-1)(V)$ is a neighborhood of $x$. That is, if $V$ is an open neighborhood of $y$, then $x$ is interior to $f^(-1)(V)$.

  Note that the preimage of $V$ need not be an _open_ neighborhood.
]

#theorem(number: none)[
  Suppose $f : X -> Y$ is a function over topological spaces $(X, upright(T))$ and $(Y, upright(U))$. Then $f$ is continuous if and only if it is continuous at every point.
]

#proof[
  Suppose $f$ is continuous. Let $x in X$ be arbitrary. Further, let $V$ be an open neighborhood of $f(x)$. Then $f^(-1)(V)$ is open and contains $x$, so $x$ is certainly interior to $f^(-1)(V)$.

  Conversely, suppose $f$ is continuous at every point. Let $V subset.eq V$ be an arbitrary open set. We prove $f^(-1)(V)$ is open, one point at a time.

  Let $x in f^(-1)(V)$. Then $f(x) in V$. So $V$ is an open neighborhood of $f(x)$, and since $f$ is continuous at $x$, we know $x$ is interior to $f^(-1)(V)$. Thus $x in U_x subset.eq f^(-1)(V)$ for some open set $U_x$. Then

  $
    f^(-1)(V) = union.big_(x in f^(-1)(V)) U_x
  $

  is open by the topological axioms.
]

#theorem(number: none)[
  If $X$, $Y$, and $Z$ are topological spaces, and $f : X -> Y$ and $g : Y -> Z$ are continuous, then $g compose f : X -> Z$ is also continuous.
]

#proof[
  Let $V subset.eq Z$ be open. Then

  $
    (g compose f)^(-1)(V) = f^(-1)(g^(-1)(V)).
  $

  We know $g^(-1)(V)$ is open since $g$ is continuous. So $f^(-1)(g^(-1)(V))$ is open because $f$ is also continuous. Therefore, $g compose f$ is continuous.
]

#definition(number: none)[Homeomorphism][
  Let $X$ and $Y$ be topological spaces. Then $f : X -> Y$ is a *homeomorphism* if

  - $f$ is injective

  - $f$ is surjective

  - $f$ is continuous

  - $f^(-1) : Y -> X$ is continuous where $f^(-1)$ is the inverse of $f$
]

#example[
  Without proof, here are some spaces that are homeomorphic. If $X$ and $Y$ are homeomorphic, we denote it with $X tilde.equiv Y$.

  - $(0, 1) tilde.equiv RR$.

  - $(-pi/2, pi/2) tilde.equiv RR$ with the $tan$ function

  - A donut and a coffee cup
]

#example[
  Suppose $X$ and $Y$ are subspaces of $RR$ where

  $
    X = [1, 2] union (3, 4] quad "and" quad Y = [1, 3].
  $

  Suppose further that $f : X -> Y$ is defined as

  $
    f(x) = cases(x & quad "if" x in [1, 2], x - 1 & quad "if" x in (3, 4])
  $

  Then $f^(-1) : Y -> X$ would be defined as

  $
    f^(-1)(x) = cases(x & quad "if" x in [1, 3], x + 1 & quad "if" x in (2, 3])
  $

  But $f^(-1)$ is not continuous. So $f$ is not a homeomorphism.

  // TODO: discover the significance of this example
]
