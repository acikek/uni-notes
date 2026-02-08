// TODO: standardize notation for row, col matrix entry lookups

#import "../math-lecture-template.typ": *

#let span = math.op("span")

#let gen(body) = $chevron.l lr(body) chevron.r$

#let template(doc, draft: true) = {
  set math.mat(delim: "[")

  base-template(doc, color: colors.blue, draft: draft)
}
