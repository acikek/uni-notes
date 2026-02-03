#import "@preview/theoretic:0.3.0"
#import theoretic.presets.bar: *

#let colors = (
  black: rgb(56, 45, 57),
  gray: rgb(135, 108, 137),
  light_gray: rgb(200, 186, 201),
  red: rgb("#d4346c"),
  orange: rgb(254, 118, 72),
  yellow: rgb(224, 190, 54),
  green: rgb(124, 174, 122),
  blue: rgb(91, 133, 170),
  purple: rgb(155, 98, 225),
)

#let qed = square(width: 0.5em, stroke: none, fill: colors.light_gray)

#let base-template(doc, color: white, draft: true) = {
  show ref: theoretic.show-ref

  set text(font: "Fira Sans", fill: colors.black, size: 12pt)

  set page(
    paper: "a4",
    // numbering: "1",
    // number-align: left,
    header: context {
      if counter(page).get().first() > 1 {
        return none
      }
      box(width: 100%, height: 100%, fill: color, outset: (left: 2.5cm, right: 2.6cm))[
        #set align(horizon)
        #text(fill: white, size: 20pt)[
          #grid(
            align: (left, right),
            columns: (100%, 1fr),
            [*_ #document.title _*], if draft { [Draft] } else { none },
          )
        ]
      ]
    },
  )

  show math.equation: set text(font: "Fira Math", fill: colors.black)

  show math.equation.where(block: true): block.with(width: 100%)

  set enum(numbering: "(i)")

  doc
}

#let definition = definition.with(options: (color: colors.red))
#let theorem = theorem.with(options: (color: colors.orange))
#let lemma = lemma.with(options: (color: colors.yellow))
#let proof = proof.with(suffix: qed)
#let corollary = corollary.with(options: (color: colors.green))
#let note = note.with(options: (color: colors.gray))
#let remark = remark.with(options: (color: colors.gray))
#let example = example.with(options: (color: colors.blue))
#let exercise = exercise.with(options: (color: colors.purple))
