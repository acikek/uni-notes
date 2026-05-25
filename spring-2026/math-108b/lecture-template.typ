#import "../../math-lecture-template.typ": *

#let template = base-template.with(color: colors.blue.darken(20%))

#let span = math.op("span")

#let range = math.op("range")

#let ip(..args) = $chevron.l #args.pos().join($comma$) chevron.r$

#let singval = math.op("SingVal")
