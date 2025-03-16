
= Zielerkennung

Damit der KUAK seine Aufgabe der Insektenbekämpfung effizient ausführen kann, ist eine präzise und zuverlässige Erkennung der relevanten Ziele erforderlich. Dies setzt voraus, dass geeignete Sensorik eingesetz wird. Ebenso wird ein System benötigt, welche die Daten der Sensorik analysiert und die Ziele von Umgebungsrauschen differenziert. 

In diesem Kapitel werden verschiedene Sensortechnologien vorgestellt und ihre Eignung für die Zielerkennung analysiert. Es werden die Vor- und Nachteile der verschieden Sensorik behandelt und abgewogen, welche Art sich für das Vorhaben am meisten eignet. Darauf folgend werden verschiedene Arten der Signalverarbeitung für diesen Sensor beleuchtet und deren Vor- und Nachteile analysiert.


== Sensorik

Die Umgebung gibt verschiedene Signale aus, die durch geeignete Sensoren aufgenommen werden können. Im Rahmen dieser Arbeit werden vor allem vier verschiedene Sensortypen beleuchtet: Kameras zur visuellen Erfassung, LiDAR- und Radarsysteme zur Tiefenerkennung und Mikrofone zur akustischen Erfassung.

=== Kameras

Kameras dienen der visuellen Erfassung der Umgebung. Dabei wird eine hohe Informationsdichte aufgenommen. Die gewonnenen Bilddaten können darauf folgend auf besondere Eigenschaften des Zieles analysiert werden um diese im Bild zu identifizieren.

Ebenso sind Kameras im Vergleich zu weiteren Sensoren technologisch fortgeschritten und besitzen dementsprechend niedrige Anschaffungskosten. Jedoch kommen Kameras auch mit Einschränkungen, welche vor allem im Hinblick zur Aufgabe der Kinematik zum Nachteil werden könnten. Zum einen kann aus den Bilddaten einer einzelnen Kamera nur erschwert bis zu keine Tiefeninformationen ermittelt werden, was das Treffen des Ziels erschwert. Dieser Nachteil kann durch ein Stereo-Kamerasystem ausgeglichen werden, bei dem mithilfe trigonometrischer Berechnungen und der bekannten Kamerapositionen die Tiefendaten eines Objekts ermittelt werden. Damit entstehen jedoch durch eine zusätzliche Kamera weitere Kosten und die Analyse der Bilddaten benötigt mehr Leistung. 

Ein weiterer Nachteil von Kameras ist die Abhängigkeit von Licht. Das führt dazu, dass der KUAK buchstäblich blind wird, wenn zu wenig Licht für Bildaufnahmen existiert. Dies kann die Zielerkennung erschweren oder gar unmöglich in der Nacht machen, wenn keine externe Lichtquelle eingesetzt wird. Ebenso sind allgemeine Kameras nicht in der Lage in einen Blickwinkel von 360° aufzunehmen. Dieser Nachteil kann jedoch umgangen werden, indem entweder mehrere Kameras eingesetzt werden oder eine Kamera an die Kinematik gebunden wird, damit diese sich mit bewegt.

=== Radar-Systeme

Radar-Systeme arbeiten nach dem Prinzip der Aussendung und Reflexion von Funkwellen. Dabei wird der Zeitlicher Abstand zwischen dem Senden und dem Empfangen verwendet um die Entfernung des reflektierenden Objekts zu ermitteln. Durch den Doppler-effekt kann dazu auch die Geschwindigkeit des Objekts ermittelt werden. 

Ein entscheidender Vorteil von Radar-Systeme ist die Unabhängigkeit von Lichtquellen. Ebenso sind diese wegen der großen Wellenlänge resistent gegenüber externen störungsquellen wie Regen, Nebel oder Schnee. 

Damit sind Radar-Systeme besonders gut geeignet große und weit entfernte Objekte ausfindig zu machen, wie zum beispiel dem Flug und See-Verkehr. Die Stärke der großen Wellenlänge wird im Rahmen dieser Arbeit jedoch zum Nachteil. Kleine Insekten, welche das Ziel dieser Kinematik ist, werden ebenfalls durch die Größe nicht erfasst. Damit ist ein Radar-System besonders für diesen Fall ungeeignet.

=== LiDAR-Systeme

LiDAR-Systeme basieren auf dem gleichen Prinzip wie Radar-Systeme, verwenden jedoch anstelle von Funkwellen hochfrequente Lichtimpulse zur Distanzmessung. Diese Technologie ermöglicht eine äußerst präzise Erfassung der Umgebung und bietet im Vergleich zu Radar eine deutlich höhere räumliche Auflösung. Allerdings ist der effektive Arbeitsbereich von LiDAR aufgrund der physikalischen Eigenschaften von Lichtwellen auf wenige Meter begrenzt.

Durch die hohe Messgeschwindigkeit eines LiDAR-Systems lassen sich Entfernungen von Objekten mit außergewöhnlicher Genauigkeit bestimmen. Trotz dieser Präzision ist die Auflösung dennoch nicht ausreichend, um kleine Insekten zuverlässig zu identifizieren. Hinzu kommt, dass LiDAR-Systeme im Vergleich zu anderen Sensortechnologien mit erheblich höheren Anschaffungskosten verbunden sind. Aufgrund der unzureichenden Erkennungseigenschaften für die spezifische Aufgabe der Insektenidentifikation erweist sich diese Technologie für den Einsatz in dieser Arbeit als wenig geeignet.

=== Mikrofone

Viele fliegende Insekten geben durch den Flügelschlag Geräusche ab, weswegen die Idee von Mikrofonen nicht weit entfernt liegt. Jedoch kommen Mikrofone mit mehr Nachteilen als Vorteile. Zwar sind diese Tagesunabhängig, günstig und Energieeffizient, können jedoch einzeln nicht die Position von Geräuschquellen ausmachen. Dies kann wie bei Kameras mit einem weiteren Mikrofon kompensiert werden. Jedoch reicht die Genauigkeit nicht aus, um eine Centimeter genau drei dimensionale position zu ermitteln. 

Auch wenn der Klang von Insekten eher als störend empfunden wird, kann dieser leicht von Umgebungsrauschen übertönt werden. 