// LTeX: language=de-DE

= Kinematik

Zunächst folgt eine grundsätzliche Beschreibung der Kinematik und deren Aufbau.
Als Kinematik wird im Rahmen dieses Dokumentes die komplette Mechanik beschrieben,
welche zum Steuern und Bewegen der Selbstschussanlage benötigt wird.

== Freiheitsgrade und Arbeitsraum

Ziel der Selbstschussanlage ist es, Insekten von einer stationären Position im
Raum aus auf beliebige Punkte zielen zu können, welche sich im Umkreis der
Anlage befinden. Dementsprechend bedarf es einer Kinematik, welche beliebige
Punkte im drei dimensionalem Raum anzusteuern. Anzusteuern bedeutet in diesem Sinne
nicht den @TCP an diesen Punkt zu bewegen, sondern lediglich, dass eine
orthogonal zu den zur X und Y-Achsen des lokalen Koordinatensystems des @TCP
verlaufenden Gerade zu diesem Punkt verläuft (siehe @figure:target).

#figure(image("../res/target.svg", width: 40%), caption: [Ansteuerung eines Zieles.]) <figure:target>

Damit der @TCP der Kinematik in der Lage ist einen beliebigen Punkt anzusteuern
bedarf es zwei Freiheitsgrade. Der @TCP muss Fähig sein sich, um die y-Achse
des Weltkoordinatensystems zu drehen, um Punkte zu erreichen, welche sich um ihn herum
auf derselben Ebene im Befinden. Zusätzlich wird mit einer beliebigen Drehung
um die z-Achse es ermöglicht den @TCP nach oben oder unten zu schwenken damit auch
Punkte erreicht werden, welche sich über oder unter dem @TCP befinden.

#figure(image("../res/cinematic-visual.png", width: 40%), caption: [Freiheitsgrade der Kinematik.]) <figure:cinematic>

@figure:cinematic zeigt ein digitales Modell das darstellt wie eine Mögliche Kinematik samt
Freiheitsgraden aussehen könnte. Dieses Modell dient im folgenden Dokument als
primäre Mechanik, mit welcher die Kinematik umgesetzt wird.
Beide Freiheitsgrade werden in diesem Modell über jeweils einen Motor umgesetzt,
welcher um eine Achse im Raum dreht. Die Drehung in der Horizontalen erfolgt
ungehindert, während in der Vertikalen das Fundament und die Dimensionen des
Aufsatzes welcher das Geschütz beherbergt die Drehung auf etwa 0 - 180° einschränkt.
Daraus folgt ein annäherungsweise Kugelförmiger Arbeitsraum, welcher am unteren
Ende abgeschnitten ist. Damit kann die Kinematik einen nahezu beliebigen Punkt
ansteuern, sofern dieser sich auf einer Kugelschicht des Arbeitsraumes befindet.

== Modellierung

Eine mathematische Modellierung der Kinematik erfolgt durch einige wenige
Kenngrößen wie der Höhe $h$ der Kinematik und der Länge $d$ des Aufsatzes für das Geschütz.
Die Höhe der Kinematik ergibt sich aus der Summe der Distanz von Basis zum zweiten Gelenk
welches Vertikal rotiert und der Distanz vom zweiten Gelenk zum Aufsatz: $h = h_1 + h_2$
Eine Zwischenhöhe $h_1$ ist in der Praxis notwendig, da es einfacher ist,
den Aufsatz nicht direkt aus dem Gelenk wachsen zu lassen, sondern eine verstärkte
Halterung mit Versatz zu verbauen. @figure:model visualisiert das mathematische
Model das zum Beschreiben der Kinematik angewendet wird.

#figure(image("../res/model.svg", width: 70%), caption: [Modell der Kinematik mit Kenngrößen.]) <figure:model>

@figure:model arbeitet mit der in der Robotik üblicheren @DH-Transformation.
Im weiteren Verlauf wird vom Weltkoordinatensystem ausgegangen, bei welchem die y-Achse
nach oben, die x-Achse nach rechts und die z-Achse in Bild zeigen.
Die Steuerung der Kinematik erfolgt über zwei Winkel. Die horizontale Rotation
wird beschrieben durch $Phi$ und findet am ersten Gelenk direkt auf der Basis statt.
Eine vertikale Drehung wird von $theta$ im zweiten Gelenk beschrieben. Ein beliebiger
Punkt im Raum kann nun durch ein Tupel der Winkel $(theta, Phi)$ beschrieben
werden, welche festlegen wie die Gelenke sich zu drehen haben.
Um die Winkel aus einem gegebenen Zielpunkt mit den Koordinaten $P in RR^3$ zu errechnen,
können zwei Schritte benutzt werden. Gegeben sei zusätzlich die Weltposition
der Basis $B in RR^3$ und die Kenngrößen $h_1$, $h_2$ und $d$.
Im ersten Schritt wird $theta$ unter Anwendung des Kosinussatzes errechnet.

$
  arrow(B)' = vec(arrow(P)_x - arrow(B)_x, 0, arrow(P)_z - arrow(B)_z)
  quad
  arrow(P)' = vec(1, 0, 0)
  quad
  theta = cos^(-1)(frac(arrow(B)' dot arrow(P)', abs(arrow(B)') dot abs(arrow(P)')))
$

#figure(image("../res/theta.svg", width: 65%), caption: [Lösung für $theta$.]) <figure:theta>

Dieses ergibt sich aus dem Winkel, der zwischen dem Vektor liegt, welcher
die Basis mit dem Zielpunkt auf der Ebene der Basis verbindet und der Richtung
auf der Basisebene in welche in der Ruheposition gezeigt wird. Damit gibt
$theta$ an wie weit von der Ruheposition aus sich in der horizontalen gedreht werden muss.
Für die Gleichungen gehen wir davon aus, dass die Ebene der Basis sich aus der
folgenden Orthonormalbasis $V_1$ zusammensetzt.

$
  V_1 = {vec(1, 0, 0), vec(0, 0, 1)}
$

Das Gelenk dreht mit $theta$ in der horizontalen
um die y-Achse der Welt. Als Ruheposition wird angenommen, dass der Aufsatz entlang
der x-Achse schaut.

Der Winkel $Phi$ des zweiten Gelenkes kann durch folgende Rechnungen erlangt werden.
Zunächst wird der Punkt errechnet an welchem das zweite Gelenk sitzt:

$
  arrow(K) = arrow(B) + vec(0, h_2, 0)
$

Punkt $arrow(K)$ und die Position $arrow(P)$ des Zieles befinden sich in Weltkoordinaten.
Durch Transformation in ein Koordinatensystem relativ zum zweiten Gelenk
werden die nächsten Schritte ungemein vereinfacht. Werden beide Punkte durch eine
Einbeziehung der horizontalen Rotation in für das zweite Gelenk lokale Koordinaten
durch eine Matrixmultiplikation
gebracht,

$
  r = mat(delim: "[",
    cos(theta), 0, sin(theta);
    0, 1, 0;
    -sin(theta), 0, cos(theta))
  quad
  arrow(P)' = r dot arrow(P)
  quad
  arrow(K)' = r dot arrow(K)
$

kann nach dem zweiten Winkel mittels einfacher Trigonometrie gelöst werden,
da die Koordinate auf der z-Achse immer null sein wird. Eine Einordnung aller
Größen benötigt für diese Rechnung können in @figure:phi und @figure:model
gefunden werden.

$
  gamma = sin^(-1)(frac(h_1, abs(arrow(P)'-arrow(K)')))
  quad
  phi = cos^(-1)(frac(arrow(K)' dot arrow(P)', abs(arrow(K)') dot abs(arrow(P)')))
$
$
  Phi = phi - gamma
$

#figure(image("../res/phi.svg", width: 40%), caption: [Lösung für $Phi$ nach der Transformation.]) <figure:phi>

== Bauteile

Bei der Betrachtung einer Kinematik in einem konkreten Anwendungsfall darf auch nicht
die Praxis vernachlässigt werden. Zunächst betrachtet wird die Motorisierung.
Der Antrieb beider Gelenke soll über zwei Elektromotoren funktionieren.
@figure:aufbau zeigt die angedachte Position beider Motoren (orange) im Robotor.

#figure(image("../res/aufbau.png", width: 40%), caption: [Schematischer Aufbau.]) <figure:aufbau>

Der erste Motor, zuständig für die horizontale Rotation, sitzt seitlich versetzt
im statischen Fundament. Über ein Zahnrad überträgt der Motor seine kinetische
Energie an ein inneres Stirnrad (gelb). Das Stirnrad ist fest mit der Basis
verbunden, wodurch die Basis gedreht wird. Durch das große Verhältnis Stirnrad
zu Zahnrad am Motor verringert sich drastisch die maximale Winkelgeschwindigkeit
für die Basis. Aufgrund dessen sollte ein Motor eingesetzt werden welcher eine
hohe Drehzahl erreichen kann. Um eine genaue Kontrolle über den Parameter $theta$
zu haben wäre bietet sich ein Schrittmotor an. Diese erlauben eine hohe Auflösung
von Schritten in der Rotation. Gleichzeitig können diese um beliebig große Winkel
gedreht werden @Bouat_2023.

Für die vertikale Rotation, welche im Bereich 0° - 180° arbeitet, bietet sich
ein Servomotor an. Klassische Servomotoren haben den eben beschriebenen Arbeitsraum.
Ein wesentlicher Vorteil für einen Servomotor ist dessen erschwinglicher Preis.
Einfache Servomotoren wie sie für Kontroller wie einem Arduino verwendet werden
starten bereits bei 7,14 €.

=== Schleifring

Grund für den Zwischenschritt, den das innere Stirnrad bildet,
ist das Kabelproblem. Da sich die Basis vorzugsweise um mehr als 360° drehen
kann führen Kabel welche am Gehäuse geführt werden, um Komponenten mit Strom
zu versorgen, zu einem Problem: Kabelsalat. Bei mehrfachen Drehungen wickeln
sich die Kabel auf und verhindern ab einem gewissen Punkt weitere Rotationen
oder führen zu Schaden. Um dieses Problem zu lösen wird Storm nicht über externe
Kabel geleitet, sondern wird durch einen Schleifring (cyan) in der Mitte geführt.

#figure(image("../res/schleifring.jpg", width: 40%), caption: [MD6038 Schleifring der Firma Moog @slipring-moog.]) <figure:slipring>

Wie der Name bereits verrät, befinden sich im Inneren des Schleifringes zwei
Kontakte die aneinander schleifen und durch mechanischen Kontakt eine leitende
Verbindung über den gesamten Umfang des Ringes sicherstellen. Die große Stärke
des Schleifringes ist gleichzeitig auch dessen größter Nachteil. Das kontinuierliche
Reiben der Kontakte für über kurz oder lang zu einer verschnellerten Abnutzung
im Vergleich zu reinen Kabeln.
Ein weiterer wesentlicher Faktor in der Abnutzung
sind sogenannte Müdigkeitserscheinungen. Dies sind Brüche im Schleifring welche
vor allem Aufgrund drastisch wechselndem Stress durch hohe Beschleunigungen
oder abruptem Bremsen entstehen. Diese Mechanik führt zusätzlich zu einer gesteigerten
Geräuschentwicklung @zhang-Meng-Lui_2019. Eine Alternative zu mechanischen
Schleifringen wäre ein magnetischer Schleifring. Dieser überträgt den Strom
nicht über physische Kontakte, sondern über Spulen mittels Induktion.
Diese Art von Schleifring benötigen für die Versorgung und Übertragung
Wechselspannung und sind in der Regel deutlich teurer, leiden dafür unter einer
wesentlich geringeren Abnutzung @6908180. Aufgrund des niedrigen Preises und
des generell bisher einfach gestrickten Modells sind mechanische Schleifringe
zu bevorzugen.

== Auslegung der Motoren
