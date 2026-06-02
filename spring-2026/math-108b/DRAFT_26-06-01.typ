#import "lecture-template.typ": *

#set document(
  title: "MATH 108B Notes June 1, 2026",
  date: datetime(day: 1, month: 6, year: 2026),
)

#show: template

#definition(number: none)[Minimal Polynomial][
  Let $T$ be a linear operator on a vector space. A polynomial $m(t)$ of least degree such that $m(T) = T_0$ is called the *minimal polynomial* if it is monic, meaning its coefficient of highest degree is $1$.
]

#theorem(number: none)[Uniqueness of Minimal Polynomials][
  Suppose $T$ is a linear operator on a vector space with two minimal polynomials $m(t)$ and $m'(t)$ such that $m(T) = m'(T) = T_0$. Then $m(t) = m'(t)$.
]

#proof[
  Applying the division algorithm for polynomials, we get

  $
    m(t) = m'(t) q(t) + r(t).
  $

  Setting $t = T$ yields

  $
    m(T) & = m'(T) q(T) + r(T).
  $

  Because $m(T)$ and $m'(T)$ are minimal polynomials, they send $T$ to $T_0$. We are then left with $r(T) = T_0$.

  In general, $r(t) = 0$. Otherwise, it would be a polynomial, whose degree is less than the degree of $m'(t)$, that sends $T$ to $T_0$. That would be a contradiction. Hence, rewriting the equation for $m(t)$, we have

  $
    m(t) = m'(t) q(t).
  $

  Since $m(t)$ and $m'(t)$ are both characteristic polynomials, they have the same degree. Thus $deg q(t) = 0$, so $q(t)$ is a constant function, meaning

  $
    m(t) = c m' (t).
  $

  Comparing coefficients of highest degree, we get $c = 1$. Therefore,

  $
    m(t) = m' (t).
  $
]

#proposition(
  number: none,
)[$#text(fill: colors.yellow, weight: "bold")[$m(t)$]$ Divides $#text(fill: colors.yellow, weight: "bold")[$p(t)$]$][
  Let $T$ be a linear operator on a complex finite-dimensional vector space. Then

  $
    m(t) divides p(t).
  $
]

#proof[
  Applying the division algorithm yields

  $
    p(t) = m(t) q(t) + r(t).
  $

  Substituting $t = T$, we get

  $
    p(T) = m(T) q(T) + r(T)
  $

  hence $r(T) = T_0$. Since $deg r(t) < deg m(t)$, it follows that $r(t) = 0$. Hence $m(t)$ divides $q(t)$.
]

// ridiculous, but it will have to do
#proposition(
  number: none,
)[$#text(fill: colors.yellow, weight: "bold")[$m(t)$]$ and $#text(fill: colors.yellow, weight: "bold")[$p(t)$]$ Have the Same Roots][
  Suppose $T$ is a linear operator on a complex finite-dimensional vector space $V$. Then $p(t)$ and $m(t)$ have exactly the same roots: the eigenvalues of $T$.
]

#proof[
  Let $lambda$ be an eigenvalue of $T$. Choose a corresponding nonzero eigenvector $v in V$ such that $T(v) = lambda v$.

  The minimal polynomial $m(t)$ can be written as

  $
    m(t) = t^k + a_(k - 1) t^(k - 1) + dots.c + a_1 t + a_0.
  $

  Setting $t = T$, we get

  $
    m(T) = T^k + a_(k - 1) T^(k - 1) + dots.c + a_1 T + a_o I.
  $

  Hence $m(T)(v)$ expands to

  $
    m(T)(v) & = T^k (v) + a_(k - 1) T^(k - 1) (v) + dots.c + a_1 T(v) + a_0 v \
            & = lambda^k v + a_(k - 1) lambda^(k - 1) v + dots.c + a_1 lambda v + a_0 v \
            & = \(lambda^k + a_(k - 1) lambda^(k - 1) + dots.c + a_1 lambda + a_0) v \
            & = m(lambda) v.
  $

  However, since $m(T) = T_0$, we have $m(T)(v) = bold(0)$. Hence $m(lambda) v = bold(0)$. Since $v$ is nonzero, $m(lambda) = 0$. Thus $lambda$ is a root of $m(t)$. Because $lambda$ was an arbitrary choice, it follows that the eigenvalues of $T$ are the roots of $m(t)$, which we know is also true for $p(t)$.
]

#example[
  Let $T : CC^3 -> CC^3$ be defined as

  $
    T\(z_1, z_2, z_3) = \(6z_1 + 3z_2 + 4z_3, 6z_2 + 2z_3, 7z_3).
  $

  Given the standard basis $beta$ for $CC$, the matrix representation for $T$ under $beta$ is

  $
    [T]_beta = mat(6, 0, 0; 3, 6, 0; 4, 2, 7).
  $

  We then find the characteristic polynomial:

  $
    p(t) = (t - 6)^2 (t - 7)
  $

  Since $m(t)$ and $p(t)$ have the same roots, the only possibilities for $m(t)$ are

  $
    m(t) = p(t) quad "or" quad m(t) = (t - 6) (t - 7).
  $

  The second option has lower degree, so if it sends $T$ to $T_0$, it is the minimal polynomial. Testing this idea, we find

  $
    (T - 6I)(T - 7I) = mat(0, 0, 0; 3, 0, 0; 4, 2, 1) mat(-1, 0, 0; 3, -1, 0; 4, 2, 0) = mat(0, 0, 0; -3, 0, 0; 6, 0, 0) != 0_(3 times 3).
  $

  So the characteristic polynomial $p(t)$ is indeed the minimal polynomial $m(t)$.
]

#remark[
  Let $T$ be a linear operator on an $n$-dimensional vector space $V$. Suppose $T$ has $n$ distinct eigenvalues. Then the characteristic polynomial $p(t)$ splits, meaning

  $
    p(t) = \(t - lambda_1) \(t - lambda_2) dots.c \(t - lambda_n).
  $

  Given that $m(t)$ and $p(t)$ have the same roots, the only possibility for $m(t)$ is

  $
    m(t) = p(t).
  $
]

// recall: if T lo on a fd complex vs, exists a basis st mat rep of T is block-diagonal

#definition(number: none)[Jordan Form][
  A basis $beta$ for a vector space $V$ is called a *Jordan basis* for a a linear operator $T$ on $V$ if the matrix representation of $T$ takes the form

  $
    [T]_beta = mat(A_1; , A_2; , , dots.down; , , , A_m)
  $

  where each block $A_j$ = $lambda_j I$. We call each $A_j$ a *Jordan block*.
]
