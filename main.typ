// LTeX: language=de-DE

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
      mail: "s9276615@student.dhbw-mannheim.de",
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

= Einführung

#lorem(200)

#show heading.where(level: 1): set text(fill: color.black, size: 10pt)
#bibliography("refs.bib", title: "Referenzen")
