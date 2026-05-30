#import "lecture-template.typ": *

#set text(hyphenate: true)

#set document(
  title: "MATH 145 Notes May 28, 2026",
  date: datetime(day: 28, month: 5, year: 2026),
)

#show: template

#theorem(number: none)[
  If $X$ and $Y$ are Hausdorff topological spaces, then so is $X times Y$.
]

#proof[
  Let $\(x_1, y_1)$ and $\(x_2, y_2)$ be distinct points in $X times Y$. Then $x_1 != x_2$ or $y_1 != y_2$.

  Suppose $x_1 != x_2$. Since $X$ is Hausdorff, there are disjoint sets $U_1$ and $U_2$ open in $X$ such that $x_1 in U_1$ and $x_2 in U_2$.

  Then $U_1 times Y$ and $U_2 times Y$ are open neighborhoods of $\(x_1, y_1)$ and $\(x_2, y_2)$ respectively, and

  $
    \(U_1 times Y) inter \(U_2 times Y) = emptyset.
  $

  A similar argument holds if $y_1 != y_2$. Therefore, $X times Y$ is Hausdorff.
]

#theorem(number: none)[
  If $X$ and $Y$ are nonempty topological spaces, and $X times Y$ is Hausdorff, then $X$ is also Hausdorff.
]

#proof[
  Let $x_1$ and $x_2$ be distinct points in $X$. Because $Y$ is nonempty, choose another point $y in Y$.

  Then $\(x_1, y)$ and $\(x_2, y)$ are distinct points in $X times Y$. Since $X times Y$ is Hausdorff, there are disjoint open sets $W_1, W_2 subset.eq X times Y$ such that $\(x_1, y) in W_1$ and $\(x_2, y) in W_2$.

  Moreover, because $W_1$ and $W_2$ are open,

  $
    \(x_1, y) & in U_1 & times V_1 & subset.eq W_1 \
    \(x_2, y) & in U_2 & times V_2 & subset.eq W_2
  $

  for some basic open neighborhoods $U_1 times V_1$ and $U_2 times V_2$.

  Then $x_1 in U_1$ and $x_2 in U_2$. We now show $U_1$ and $U_2$ are disjoint. Assume for contradiction that $u in U_1 inter U_2$. Then

  $
    (u, y) in U_1 times V_1 subset.eq W_1 \
    (u, y) in U_2 times V_2 subset.eq W_2
  $

  which would contradict $W_1 inter W_2 = emptyset$.

  So the open sets $U_1$ and $U_2$ separate the points $x_1$ and $x_2$. Therefore, $X$ is a Hausdorff topological space.
]

#pagebreak()

#theorem(number: none)[
  If $X$ and $Y$ are path-connected topological spaces, then $X times Y$ is also #text(hyphenate: false)[path-connected.]
]

#proof[
  Let $\(x_0, y_0)$ and $\(x_1, y_1)$ be points in $X times Y$. Then $x_0$ and $x_1$ are connected by a path, and so are $y_0$ and $y_1$. Let $f$ and $g$ be these paths respectively:

  $
    f : & [0, 1] -> X quad & f(0) & = x_0 "and" & f(1) & = x_1 \
    g : & [0, 1] -> Y quad & g(0) & = y_0 "and" & g(1) & = y_1
  $

  Let $F$ be a path between $\(x_0, y_0)$ and $\(x_1, y_1)$ defined as

  $
    F : [0, 1] -> X times Y, \ F(t) = (f(t), g(t)).
  $

  Then $F(0) = \(x_0, y_0)$ and $F(1) = \(x_1, y_1)$.

  A theorem in the text states that if all projections of a function $f$ to a product are continuous, then $f$ is also continuous.

  // TODO: put the theorem here.

  In this case, $pi_X compose F = f$ and $pi_Y compose F = g$ are continuous because they are paths, so $F$ is also continuous. However, we can prove the continuity of $F$ directly.

  Suppose $W subset.eq X times Y$ is open. Let $t in F^(-1)(W)$. Then $F(t) in W$. Hence

  $
    (f(t), g(t)) in U times V subset.eq W
  $

  for some sets $U$ open in $X$ and $V$ open in $Y$.

  Thus $f(t) in U$ and $g(t) in V$, meaning

  $
    t in f^(-1)(U) inter g^(-1)(V) subset.eq F^(-1)(W)
  $

  which by the continuity of $f$ and $g$ is an intersection of open sets. We have thus proven $F^(-1)(W)$ is open one point at a time.

  Therefore, $F$ is a path between $\(x_0, y_0)$ and $\(x_1, y_1)$. Since these points were arbitrary, it follows that $X times Y$ is path-connected.
]
