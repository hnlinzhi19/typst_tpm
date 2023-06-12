#let project(
  title: "",
  authors: (),
  abstract: none,
  keywords: (),
  body
) = {
  let song = "FZShuSong-Z01"
  let hei = "FZHei-B01"
  let kai = "FZKai-Z03"
  let xbsong = "FZXiaoBiaoSong-B05"
  let code = "DejaVu Sans Mono"
  // Moidfy the following to change the font.
  let title-font = hei
  let author-font = kai
  let body-font = song
  let heading-font = xbsong
  let caption-font = kai
  let header-font = kai
  let strong-font = hei
  let emph-font = kai
  let raw-font = code
  
  set document(author: authors, title: title)
  set page(
    margin: (x:4pt, y: 1pt),
    height: 560pt,
    width: 420pt
  )

  // set page(numbering: "1", number-align: center, header: align(left)[
  //  #set text(font: header-font)
  //  #title
  // ])
  set heading(numbering: "1.1")
  set text(font: body-font, lang: "zh", size: 14pt)
  
  show heading: it => box(width: 100%)[
    #v(0.50em)
    #set text(font: heading-font)
    #counter(heading).display()
    #h(0.55em)
    #it.body
]

  show heading.where(
    level: 1
  ): it => box(width: 100%)[
    #v(0.2em)
    #set align(center)
    #set heading(numbering: "一")
    #it
    #v(0.25em)
  ]

  // Title
  align(center)[
    #block(text(font: title-font, weight: 700, 1.75em, title))
    #v(0.2em)
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, text(font: author-font, author))),
    ),
  )

  // Main body
  set enum(indent: 2em)
  set figure(gap: 0.8cm)

  show figure: it => [
    #v(12pt)
    #set text(font: caption-font)
    #it
    #v(12pt)
  ]
  show table: it => [
    #set text(font: body-font)
    #it
  ]
  show strong: set text(font: strong-font)
  show emph: set text(font: emph-font)
  show ref: set text(red)
  show raw.where(block: true): block.with(
    width: 100%,
    fill: luma(240),
    inset: 10pt,
  )

  show raw: set text(font: (raw-font, hei), size: 10pt)
  show link: underline
  show link: set text(blue)

  if abstract != none [
    #v(2pt)
    #h(2em) *摘要：* #abstract

    #if keywords!= () [
      *关键字：* #keywords.join("；")
    ]
    #v(2pt)
  ]

  body
}
#let problem-counter = counter("problem")
#problem-counter.step()

#let problem(body) = {
  problem-counter.step()
  set enum(numbering: "(1)")
  block(
    fill: rgb(241, 241, 255),
    inset: 8pt,
    radius: 2pt,
    width: 100%,
  )[*题目 #problem-counter.display().* #h(0.75em) #body]
}

#let solution(body) = {
  set enum(numbering: "(1)")
  block(
    inset: 8pt,
    width: 100%
  )[*解答.* #h(0.75em) #body]
}

#let cell = rect.with(
  inset: 8pt,
  width: 100%,
  radius: 6pt
)
#let cannotes(
  question: "",
  notes:"",
  summarize:""
) ={

  show par: set block(spacing: 0.45em)
  set par(
    justify: true,
  )
  grid(
    columns: (33%, 1fr),
    gutter: 3pt,
    [
      *问题*\
      #question
    ],
    [
      *笔记*\
      #notes
    ]
  )
  line(length: 100%,stroke: .5pt)
  [
    *总结*\
    #summarize
  ]
}

