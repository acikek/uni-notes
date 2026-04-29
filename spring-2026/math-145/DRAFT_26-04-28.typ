#import "lecture-template.typ": *

#set document(
  title: "MATH 145 Notes Apr. 28, 2026",
)

#show: template

= Topological Spaces

#definition(number: none)[Topology][
  Let $X$ be a set of points, and let $upright(T)$ be a collection of subsets of $X$ that we call *open*. Then $(X, upright(T))$ is a *topology* if it satisfies the following axioms:

  + The empty set $emptyset$ is open

  + The entire space $X$ is open

  + If $U$ and $V$ are open, then $U inter V$ is open

  + If $U_alpha$ are all open, then $union.big U_alpha$ is open
]

#example[
  The *discrete* topology $(X, upright(T))$ is one in which _every_ subset of $X$ is open.
]

#example[
  The *indiscrete* topology $(X, upright(T))$ is one in which _only_ $emptyset$ and $X$ are open.
]

#remark[
  Not every topological space comes from a metric. Those that do are called *metrizable* topologies.
]

#definition(number: none)[Neighborhood][
  Let $(X, upright(T))$ be a topology and $A$ be a subset of $X$. Then $A$ is a *neighborhood* of a point $x$ if there is an open set $U$ containing $x$ such that $U subset.eq A$.

  We also say $x$ is *interior* to $A$.

  Furthermore, $A$ is an *open neighborhood* of $x$ if $A$ is open and $x in A$.
]

#definition(number: none)[Interior of a Set][
  Let $A$ be a subset in a topological space. The *interior* of $A$, denoted $int A$, is the set of all points that $A$ is a neighborhood of. That is,

  $
    x in int A quad <==> quad exists U subset.eq A "such that" U "is open and" x in U.
  $
]

#theorem(number: "1.1")[
  Suppose $A$ is a subset of a topological space. Then $A$ is open if and only if

  $
    A = int A
    .
  $
]

#proof[
  Since $x in int A$ implies $x in A$ by definition, we know $int A subset.eq A$. Thus we aim to prove that $A$ is open if and only if every $x in A$ is interior to $A$.

  To begin, suppose $A$ is open. If $x in A$, then since $A$ is an open subset of itself, it follows that $x in int A$.

  Conversely, suppose every point in $A$ is interior to $A$. This means for every $x in A$, there exists an open set $U_x$ such that $x in U_x subset.eq A$.

  Now $union.big U_x$ is a subset of $A$ because it is a union of subsets of $A$. Furthermore, $A$ is a subset of $union.big U_x$ because each $x in A$ is an element of its own $U_x$. So $A = union.big U_x$, and therefore $A$ is open following the axioms of a topology.
]

#remark[How to prove that a set is open][
  Suppose we aim to prove that $A$ is an open set. We do so _one point at a time!_ We let $x in A$ be arbitrary, then we find an open set $U$ such that

  $
    x in U subset.eq A.
  $

  By showing that $x$ is interior to $A$ for an arbitrary point $x$, we prove that every point in $A$ is interior, meaning $A$ is open.
]

#theorem(number: "1.2")[
  Suppose $A$ is a subset in a topological space. Then $int A$ is open.
]

#proof[
  Let $x in int A$ be arbitrary. Hence $x in U$ for some open subset $U subset.eq A$. For any $u in U$, we have $u in U subset.eq A$, showing $u$ is interior to $A$. Thus $U subset.eq int A$. So $x$ is interior to $int A$.
]

#definition(number: none)[Closed Set][
  Let $(X, upright(T))$ be a topological space, and let $A subset.eq X$. Then $A$ is *closed* if $X without A$ is open.
]

#definition(number: none)[Adherence][
  Let $A$ be a subset in a topological space. Then $x$ is *adherent* to $A$ if $A$ *meets* every neighborhood of $x$. That is, for every neighborhood $U$ of $x$, we have

  $
    A inter U != emptyset quad ("or" exists y in A inter U).
  $
]

#definition(number: none)[Closure of a Set][
  Let $A$ be a subset in a topological space. The *closure* of $A$, denoted $overline(A)$, is the set of all points that are adherent to $A$.
]

#theorem(number: "1.3")[
  Suppose $A$ is a subset in a topological space. Then $A$ is closed if and only if

  $
    A = overline(A).
  $
]

#proof[
  Suppose $x in A$. Then since every neighborhood of $x$ contains $x$, $A$ meets every neighborhood of $x$. So $x$ is adherent to $A$, meaning $A subset.eq overline(A)$. Thus we aim to prove that $A$ is closed if and only if every point adherent to $A$ is also an element of $A$, i.e. $overline(A) subset.eq A$.

  To begin, suppose $A$ is closed. Suppose for contraposition that $x in.not A$. It follows that $x in X without A$, which is open. Now $X without A$ is an open neighborhood of $x$ that does not meet $A$, so $x$ is not adherent to $A$.

  Conversely, suppose every point adherent to $A$ is an element of $A$. We show that $X without A$ is open, and this will prove $A$ is closed.

  Let $x in X without A$ be arbitrary. Then $x in.not A$, so $x$ is not adherent to $A$. Hence there is some neighborhood $U$ of $x$ that does not meet $A$, so $x in N subset.eq X without A$. So $x$ is interior to $X without A$, meaning $X without A$ is open.
]

#theorem(number: "1.4")[
  Suppose $A$ is a subset in a topological space. Then $overline(A)$ is closed.
]

#proof[
  We aim to prove that $X without overline(A)$ is open.

  Let $x in X without overline(A)$. Then $x$ is not adherent to $A$, so some neighborhood $U$ of $x$ does not meet $A$. By definition, $x in V subset.eq U$ for some open set $V$, and $V$ is a neighborhood of all points in $V$. So every point in $V$ has an open neighborhood that does not meet $A$. Hence $x in V subset.eq X without overline(A)$.
]
