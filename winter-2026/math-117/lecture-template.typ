// TODO: Escape parentheses when using superscripts
// TODO: Add stylized professor quotes

#import "../../math-lecture-template.typ": *

#let template = base-template.with(color: colors.orange)

#let Re = math.op("Re")
#let Im = math.op("Im")

#let limbar = (
  u: $limits(overline(lim))$,
  l: $limits(underline(lim))$,
)

#let ulim(char) = $limbar.u_(#char -> oo)$
#let llim(char) = $limbar.l_(#char -> oo)$
