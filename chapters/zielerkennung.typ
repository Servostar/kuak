// LTeX: language=de-DE

= Zielerkennung

Damit die Kinematik ihre Aufgabe der Insektenbekämpfung effizient ausführen kann,
ist eine präzise und zuverlässige Erkennung der relevanten Ziele erforderlich.
Dies setzt voraus, dass geeignete Sensorik eingesetzt wird. Ebenso wird ein System
benötigt, welche die Daten der Sensorik analysiert und die Ziele von
Umgebungsrauschen differenziert.

In diesem Kapitel werden verschiedene Sensortechnologien vorgestellt und ihre
Eignung für die Zielerkennung analysiert. Es werden die Vor- und Nachteile der
verschiedenen Sensorik behandelt und abgewogen, welche Art sich für das Vorhaben
am meisten eignet. Darauf folgend werden verschiedene Arten der Signalverarbeitung
für diesen Sensor beleuchtet und deren Vor- und Nachteile analysiert.

== Sensorik

Die Umgebung gibt verschiedene Signale aus, die durch geeignete Sensoren
aufgenommen werden können. Im Rahmen dieser Arbeit werden vor allem vier
verschiedene Sensortypen beleuchtet: Kameras zur visuellen Erfassung, @LiDAR
und @Radar zur Tiefenerkennung und Mikrofone zur akustischen Erfassung.

=== Kameras

Kameras dienen der visuellen Erfassung der Umgebung. Dabei wird eine hohe
Informationsdichte aufgenommen. Die gewonnenen Bilddaten können darauf folgend
auf besondere Eigenschaften des Zieles analysiert werden, um diese im Bild zu
identifizieren.

#figure(
  image("../res/camera.png", width: 65%),
  caption: [Raspberry Pi Camera Module 3 @camera],
) <figure:camera>

Ebenso sind Kameras im Vergleich zu weiteren Sensoren technologisch fortgeschritten
und besitzen dementsprechend niedrige Anschaffungskosten. Zum Beispiel kostet das
Modell in @figure:camera zum Stand der Arbeit 25 \$ und hat dabei für Videoaufnahmen
eine Auflösung von 2304 auf 1296 Pixel.@camera Jedoch kommen Kameras auch mit
Einschränkungen, welche vor allem im Hinblick zur Aufgabe der Kinematik zum Nachteil
werden könnten. Zum einen kann aus den Bilddaten einer einzelnen Kamera nur erschwert
bis keine Tiefeninformationen ermittelt werden, was das Treffen des Ziels erschwert.
Dieser Nachteil kann durch ein Stereo-Kamerasystem ausgeglichen werden, bei dem
mithilfe trigonometrischer Berechnungen und der bekannten Kamerapositionen die
Tiefendaten eines Objekts ermittelt werden. Damit entstehen jedoch durch eine
zusätzliche Kamera weitere Kosten und die Analyse der Bilddaten benötigt mehr
Leistung.

Ein weiterer Nachteil von Kameras ist die Abhängigkeit von Licht. Das führt
dazu, dass die Kinematik buchstäblich blind wird, wenn zu wenig Licht für
Bildaufnahmen existiert. Dies kann die Zielerkennung erschweren oder gar unmöglich
in der Nacht machen, wenn keine externe Lichtquelle eingesetzt wird. Ebenso sind
allgemeine Kameras nicht in der Lage in einen Blickwinkel von 360° aufzunehmen.
Dieser Nachteil kann jedoch umgangen werden, indem entweder mehrere Kameras
eingesetzt werden oder eine Kamera an die Kinematik gebunden wird, damit diese
sich mit bewegt.

=== Radar-Systeme

Radar-Systeme arbeiten nach dem Prinzip der Aussendung und Reflexion von Funkwellen.
Dabei wird der zeitliche Abstand zwischen dem Senden und dem Empfangen verwendet,
um die Entfernung des reflektierenden Objekts zu ermitteln. Durch den Dopplereffekt
kann dazu auch die Geschwindigkeit des Objekts ermittelt werden.

#figure(
  image("../res/radar.png", width: 65%),
  caption: [24GHz mmWave Sensor - Radar @radar],
) <figure:radar>


Ein entscheidender Vorteil von Radar-Systeme ist die Unabhängigkeit von Lichtquellen.
Ebenso sind diese wegen der großen Wellenlänge resistent gegenüber externen
Störungsquellen wie Regen, Nebel oder Schnee.

Damit sind Radar-Systeme besonders gut geeignet große und weit entfernte Objekte
ausfindig zu machen, wie zum Beispiel dem Flug und See-Verkehr. Die Stärke der
großen Wellenlänge wird im Rahmen dieser Arbeit jedoch zum Nachteil. Kleine Insekten,
welche das Ziel dieser Kinematik ist, werden ebenfalls durch die Größe nicht erfasst.
Damit ist ein Radar-System besonders für diesen Fall ungeeignet.

=== LiDAR-Systeme

LiDAR-Systeme basieren auf dem gleichen Prinzip wie Radar-Systeme, verwenden
jedoch anstelle von Funkwellen hochfrequente Lichtimpulse zur Distanzmessung.
Diese Technologie ermöglicht eine äußerst präzise Erfassung der Umgebung und
bietet im Vergleich zu Radar eine deutlich höhere räumliche Auflösung.
Allerdings ist der effektive Arbeitsbereich von LiDAR aufgrund der physikalischen
Eigenschaften von Lichtwellen auf wenige Meter begrenzt.


#figure(
  image("../res/lidar.png", width: 55%),
  caption: [Waveshare D500 LiDAR Kit @lidar],
) <figure:lidar>



Durch die hohe Messgeschwindigkeit eines LiDAR-Systems lassen sich Entfernungen
von Objekten mit außergewöhnlicher Genauigkeit bestimmen. Trotz dieser Präzision
ist die Auflösung dennoch nicht ausreichend, um kleine Insekten zuverlässig zu
identifizieren. Hinzu kommt, dass LiDAR-Systeme im Vergleich zu anderen
Sensortechnologien mit erheblich höheren Anschaffungskosten verbunden sind.
Aufgrund der unzureichenden Erkennungseigenschaften für die spezifische Aufgabe
der Insektenidentifikation erweist sich diese Technologie für den Einsatz in
dieser Arbeit als wenig geeignet.

=== Mikrofone

Viele fliegende Insekten geben durch den Flügelschlag Geräusche ab, weswegen die
Idee von Mikrofonen nicht weit entfernt liegt. Jedoch kommen Mikrofone mit mehr
Nachteilen als Vorteile. Zwar sind diese unabhängig von der Tageszeit, günstig
und energieeffizient,
können jedoch einzeln nicht die Position von Geräuschquellen ausmachen. Dies
kann wie bei Kameras mit einem weiteren Mikrofon kompensiert werden. Jedoch
reicht die Genauigkeit nicht aus, um Zentimeter genau drei dimensionale Position
zu ermitteln.

#figure(
  image("../res/microfon.png", width: 65%),
  caption: [Electret Microphone Amplifier @microfon],
) <figure:microfon>


Auch wenn der Klang von Insekten eher als störend empfunden wird, kann dieser
leicht von Umgebungsrauschen übertönt werden. Ebenfalls geben Insekten keinen
aufnehmbaren Klang von sich, wenn diese nicht fliegen. Dementsprechend sind
Mikrofone abhängig von einer leisen Umgebung, mit einem dauerhaft fliegenden
Ziel, wovon die Position schwer zu ermitteln ist. Damit sind Mikrofone für diese
Arbeit ungeeignet.

=== Entscheidung: Stereo-Kamera-System

Die verschiedenen Arten von Sensorik haben alle ihre Vor- und Nachteile. Radar
und LiDAR-Systeme können solch kleine Objekte wie Moskitos kaum Orten und
Mikrofone können nur eine grobe Richtung ausmachen.

Als Entscheidung werden deswegen Kameras als Sensorik verbaut. Zwar kann aus der
Aufnahme einer einzelnen Kamera nur schwer die Tiefe erhoben werden, was aber
durch eine zweite Kamera mit einem versetzten Blickwinkel behoben werden kann.
Die genaue Position kann dadurch wesentlich genauer aufgenommen werden, als bei
allen weiteren besprochenen Sensorik.

Einer der Nachteile von Kameras ist der beschränkte Sichtbereich. Dieser Kann
jedoch behoben werden, indem die Kameras bewegt werden, um so ein Ziel zu
verfolgen oder in einem Raum zu suchen. Ein weiterer Nachteil, welcher in Kauf
genommen werden muss, ist eine schlechte Aufnahme in schlechten
Lichtverhältnissen. Dies ist jedoch mit einer externen Lichtquelle wie einer
Taschenlampe entgegenzuwirken.

Somit bietet ein Stereo-Kamerasystem eine gute Lösung zur Aufnahme der Umgebung.


== Datenverarbeitung

Mit der Aufnahme der Umgebung durch eine passende Sensorik, können zwar
potenzielle Ziele gesehen, jedoch nicht als Ziele identifiziert werden. Da das
Kamerasystem zwei Streams liefert, wird eine Instanz benötigt, welche daraus
eine Position von einem Ziel ermittelt. Dabei fällt zum einen das Problem der
Identifizierung des Insektes an, als auch die Extraktion der genauen Position
davon in Weltkoordinaten.

=== Identifizierung

Um das genaue Ziel auf den Aufnahmen zu filtern, gibt es den klassischen Ansatz
der Bildverarbeitung und den Ansatz des maschinellen Lernens.

Bei der klassischen Bildverarbeitung wird über verschiedene Filter die
Eigenschaften der Aufnahme hervorgehoben und darauf hin diese mit den
Eigenschaften des Zieles verglichen. Zum einen kann über Licht und Farbe eine
Fliege von einem roten Fleck unterschieden werden. Dazu kann die Form, welche
über Kanten im Bild ermittelt werden, mit der einer Fliege verglichen werden.
Dieses Filtern ist für ein Bild effizient durchzuführen, kann jedoch viel
rauschen beinhalten, woraus nicht klar ist, ob es eine Fliege ist, oder doch nur
ein Fleck an der Wand.

Mit einer Klassifikation durch maschinelles Lernen, kann zwar potenziell
wesentlich genauer eine Fliege identifiziert werden, ist jedoch auch
Rechenintensiver als eine klassische Bildverarbeitung. Zudem kommt ein
benötigtes Training, was zuvor durchgeführt werden muss. Maschinelles Lernen
eröffnet ebenfalls die Frage nach der Berechnungsgeschwindigkeit. Dieser
entstehende Error muss vor allem bei kleinen Zielen bei der Zielerkennung
berücksichtigt werden.

Als Ansatz kann dabei eine Mischlösung verwendet werden, wobei eine Initiale
Filterung von potenziellen Fliegen durch eine klassische Bildverarbeitung
vorgenommen wird. Potenzielle Kandidaten können darauf folgend mithilfe einer
Klassifikation in kleinerer Bildgröße kategorisiert werden. So kann der Vorteil
einer besseren Klassifikation eingebunden werden, jedoch auch die benötigte
Rechenleistung und damit die benötigte Zeit minimiert werden. Jedoch bleibt
das Problem eines Trainings für die Klassifikation, was beschriftete Daten
benötigt.@Visalli2021

=== Positionsberechnung

Sobald für beide Aufnahmen ein Ziel identifiziert wurde, muss daraus folgend
eine Position in Weltkoordinaten errechnet werden, sodass die Kinematik sich
darauf ausrichten kann.

Zuvor wurden aus den Aufnahmen die jeweiligen Pixelkoordinaten des Zieles
berechnet. Die Positionen der Kameras lässt sich aus der Stellung der
Kinematik zu den Weltkoordinaten errechnen. Mit diesen Informationen lässt
sich durch Triangulation darauf folgend die Position des Zieles in
Weltkoordinaten berechnen.

Diese Methode ist jedoch vollständig von den Fehlern der Werte abhängig.
Wenn die Identifizierung leicht abweichende Koordinaten liefert, oder die
Position der Kameras nicht sauber berechnet wird, können diese Toleranzen
sich addieren und das Ziel verfehlen. @imageReconstruction
