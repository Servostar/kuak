// LTeX: language=de-DE

#import "./template.typ" as graceful-genetics
#import "@preview/physica:0.9.3"
#import "@preview/glossarium:0.5.4": (
  make-glossary,
  register-glossary,
  print-glossary,
  gls,
  glspl,
)
#import "glossary.typ" as glossary

#set document(
  author: (
    "Sven Vogel <s222468@student.dhbw-mannheim.de>",
    "Felix L. Müller <s221978@student.dhbw-mannheim.de>",
  ),
  description: "Presentation held on march 10th 2025 at class.",
  title: "Selbstschussanlagen zur Insektenkontrolle",
  keywords: (
    "Robotik",
    "Insektenkontrolle",
    "Laser",
    "Selbstschussanlage",
    "Zielerkennung",
  ),
)

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
    day: 24,
  ),
  keywords: (
    "Robotik",
    "Insektenkontrolle",
    "Laser",
    "Selbstschussanlage",
    "Zielerkennung",
  ),
  doi: "10.7891/120948510",
  abstract: [
    Aus einer Kollaboration der Oxford Universität und der non-profit Organisation "Global
    Change Data Lab" wurden im Jahr 2022 in etwa 700.000 Menschen ermordet @owid-homicides.
    Mehr als doppelt so viele Menschen starben im selben Jahr an den folgen
    eines Moskitostiches durch die Übertragung einer Krankheit wie Malaria oder Gelbfieber @statista-deadliest-animal.
    Diese Tatsache ist Motivation zur Ergründung alternativer Methoden der Insektenkontrolle
    inspiriert von vorherigen Versuchen durch vollautomatisierte Selbstschussanlagen wie in @202101.0412 oder @chinese-gun.
    In dieser Arbeit werden die Anforderungen an eine solche Kinematik und ein System zur
    Zielerkennung beschrieben und bewertet.
  ],
)

#set text(lang: "de")

#show: make-glossary

#register-glossary(glossary.entries)
// Your document body

#include "chapters/cinematics.typ"

#include "chapters/zielerkennung.typ"

#include "chapters/laser.typ"

#show heading.where(level: 1): set text(fill: color.black, size: 10pt)

= Glossar

#print-glossary(glossary.entries)

#v(2em)

#bibliography("refs.bib", title: "Referenzen")

#pdf.embed(
  "attachments/kuak.odp",
  relationship: "supplement",
  mime-type: "application/vnd.oasis.opendocument.presentation",
  description: "Presentation held on march 10th 2025 at class.",
)
