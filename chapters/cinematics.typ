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

#figure(image("../res/target.svg", width: 40%), caption: [Ansteuerung eines Zieles]) <figure:target>

Damit der @TCP der Kinematik in der Lage ist einen beliebigen Punkt anzusteuern
bedarf es zwei Freiheitsgrade. Der @TCP muss Fähig sein sich, um die y-Achse
des Weltkoordinatensystems zu drehen, um Punkte zu erreichen, welche sich um ihn herum
auf derselben Ebene im Befinden. Zusätzlich wird mit einer beliebigen Drehung
um die z-Achse es ermöglicht den @TCP nach oben oder unten zu schwenken damit auch
Punkte erreicht werden, welche sich über oder unter dem @TCP befinden.

#figure(image("../res/cinematic-visual.png", width: 40%), caption: [Freiheitsgrade der Kinematik]) <figure:cinematic>

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
