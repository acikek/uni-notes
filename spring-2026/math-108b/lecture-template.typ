#import "../../math-lecture-template.typ": *

#let template = base-template.with(color: colors.blue.darken(20%))

#let ip(..args) = $chevron.l #args.pos().join($comma$) chevron.r$

#let span = math.op("span")
