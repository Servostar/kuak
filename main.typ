#import "./template.typ" as graceful-genetics
#import "@preview/physica:0.9.3"

#show: graceful-genetics.template.with(
  title: [Selbstschussanlagen zur Insektenkontrolle],
  authors: (
    (
      name: "Sven Vogel",
      department: "Informatik",
      institution: "DHBW Mannheim",
      city: "Mannheim",
      country: "Germany",
      mail: "s222468@student.dhbw-mannheim.de",
    ),
    (
      name: "Felix L. Müller",
      department: "Informatik",
      institution: "DHBW Mannheim",
      city: "Mannheim",
      country: "Germany",
      mail: "s221978@student.dhbw-mannheim.de",
    ),
  ),
  date: (
    year: 2025,
    month: "March",
    day: 16,
  ),
  keywords: (
    "Robotik",
    "Insektenkontrolle",
    "Laser",
    "Selbstschussanlage",
    "Zielerkennung"
  ),
  doi: "10.7891/120948510",
  abstract: [
    #lorem(50)
  ],
)

#set text(lang: "de")

= Einführung

#lorem(200)

#include "chapters/zielerkennung.typ"

#show heading.where(level: 1): set text(fill: color.black, size: 10pt)
#bibliography("refs.bib", title: "Referenzen")
