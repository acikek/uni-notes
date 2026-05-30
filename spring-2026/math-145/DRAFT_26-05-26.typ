// credit to Roy

#import "lecture-template.typ": *

#set document(
  title: "MATH 145 Notes May 26, 2026",
  date: datetime(day: 26, month: 5, year: 2026),
)

#show: template

#exercise[
  Let $X$ be a topological space, and suppose $Z subset.eq Y subset.eq X$. Let $Y$ have the relative topology as a subset of $X$. Prove that the topology on $Z$ as a subset of $Y$ is the same as its topology as a subset of $X$.
]

#proof[
  Suppose $U subset.eq Z$ is open in the relative topology from $Z subset.eq Y$. So $U = V inter Z$ for some $V$ open in Y. Moreover, $V$ being open in $Y$ means $V = W inter Y$ for some $W$ open in $X$. Then

  $
    U = W inter X.
  $

  Thus $U$ is open in the relative topology on $X$.

  Conversely, suppose $U subset.eq Z$ is open in the relative topology from $Z subset.eq X$. This means $U = W inter Z$ for some $W$ open in $X$. Then

  $
    U = (W inter Y) inter Z
  $

  /*you can also do 1pat!*/
  where $W inter Y$ is open in the relative topology on $Y$. Thus $U$ is open in the relative topology on $Y$.
]

#exercise[
  The usual topology on $RR$ has base open intervals $(a, b)$. Let the *lower limit topology* have base intervals of the form $[a, b)$. Prove that open sets in the usual topology are also open in the lower limit topology.
]

#proof[
  Let $U subset.eq RR$ be open in the usual topology. Let $u in U$ be arbitrary.

  Then $u in (a, b) subset.eq U$ for some basic open $(a, b)$. Thus $u in [u, b) subset.eq U$, so $U$ is open in the lower limit topology.
]

The converse is not true. For example, let $U = [0, 1)$ be an open set in the lower limit topology. If $U$ were open in the usual topology, then

$
  0 in (a, b) in U
$

for some basic open $(a, b)$ where $a < 0 < b$.

In this case, $a slash 2 in (a, b)$ yet $a slash 2 in.not [0, 1)$. This is a contradiction, so $U$ cannot be open in the usual topology.

#exercise[
  Prove that $X$ is a Hausdorff topological space if and only if

  $
    Delta = { (x, x) : x in X }
  $

  is closed in $X times X$.
]

#proof[
  Suppose $X$ is Hausdorff. The notetaker has not yet proven the forward direction, but she swears it's true.

  Conversely, suppose $Delta$ is closed. This means $(X times X) without Delta$ is open.

  Let $x, y in X$ be distinct points. Then $(x, y) in.not Delta$, so $(x, y)$ is a point in $(X times X) without Delta$, an open set. Thus

  $
    (x, y) in U times V subset.eq (X times X) without Delta
  $

  for some basic open set $U times V$.

  Assume $z in U inter V$. Then $(z, z)$ is a point in $(U times V) inter Delta$, a contradiction. So  $x in U$, which is open; $y in V$, which is also open; and $U inter V = emptyset$. Thus $X$ is Hausdorff.
]

#exercise[
  Let $X$ be a topological space. Prove that the diagonal map

  $
    f : X -> X times X, quad x |-> (x, x)
  $

  is continuous.
]

#proof[
  Let $W subset.eq W times W$ be an arbitrary open set, and let $x in f^(-1)(W)$ be an arbitrary point in the preimage. Hence $f(x) in W$. Since $W$ is open,

  $
    f(x) in U times V subset.eq W
  $

  for some basic open $U times V$.

  Expanding $f(x)$, we have $(x, x) in U times V$. So $x in U$ and $x in V$, meaning $x in U inter V$.

  Let $y in U inter V$. Then $(y, y) in U times V$, so

  $
    (y, y) in W ==> f(y) in W ==> y in f^(-1)(W).
  $

  Therefore,

  $
    x in U inter V subset.eq f^(-1)(W).
  $
]

#exercise[
  Prove if $X$ is a compact topological space and $f : X -> RR$ is continuous, then $f(X)$ is bounded.
]

#proof[
  Suppose $x in X$. Let $n$ be an absolute bound for $f(x)$. That is,

  $
    n = ceil(abs(f(x))).
  $

  /* footnote: times one hundred */ Then $f(x) in (-n, n)$, so $x in f^(-1)(-n, n)$. Since $f$ is continuous, the preimage $f^(-1)(-n, n)$ is open for any $n$. Hence

  $
    X = union.big_(n = 1)^oo f^(-1)(-n, n)
  $

  is an open cover of $X$. Since $X$ is compact, it has a finite subcover

  $
    X = f^(-1)\(-n_1, n_1) union dots.c union f^(-1)\(-n_k, n_k).
  $

  Let $N = max \{ n_1, ..., n_k }$. Then $X = f^(-1)[N, N]$. Therefore,

  $
    f(X) subset.eq [-N, N]
  $

  meaning $f$ is bounded.
]
