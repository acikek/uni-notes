#import "@preview/theoretic:0.3.0"
#import theoretic.presets.bar: *

#let colors = (
  black: rgb(56, 45, 57),
  gray: rgb(135, 108, 137),
  light_gray: rgb(200, 186, 201),
  orange: rgb(254, 118, 72),
  blue: rgb(91, 133, 170),
  green: rgb(124, 174, 122),
)

#let qed = square(width: 0.5em, stroke: none, fill: colors.light_gray)

#let template = (doc, draft: true) => {
  show ref: theoretic.show-ref

  set text(font: "Fira Sans", fill: black, size: 12pt)

  set page(
    paper: "a4",
    // numbering: "1",
    // number-align: left,
    header: context {
      if counter(page).get().first() == 1 {
        box(width: 100%, height: 100%, fill: colors.orange, outset: (left: 2.5cm, right: 2.6cm))[
          #set align(horizon)
          #text(fill: white, size: 20pt)[
            #grid(
              align: (left, right),
              columns: (100%, 1fr),
              [*_ #document.title _*], if draft { [Draft] } else { none },
            )
          ]
        ]
      } else {
        none
      }
    },
  )

  show math.equation: set text(font: "Fira Math", fill: black)

  show math.equation.where(block: true): block.with(width: 100%)

  set enum(numbering: "(i)")

  doc
}

#let lemma = lemma.with(options: (color: colors.blue))
#let note = note.with(options: (color: colors.gray))
#let remark = remark.with(options: (color: colors.gray))
#let proof = proof.with(suffix: qed)
