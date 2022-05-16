class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/car.jpg',
    title: 'Smartphone Companion APP',
    description:
        'Das Ziel der Smartphone Companion App ist es, die Labelung von Situationen zu unterstützen sowie zu automatisieren, indem sie Eingaben bzw. Feedback vom Fahrer einholt.',
  ),
  Slide(
    imageUrl: 'assets/images/presentation.jpg',
    title: 'Automatisierung der Daten',
    description:
        'Anstatt die Daten aufwendig manuell zu taggen, soll die App diesen Prozess automatisieren. Anschließend soll die App die Daten an den Arduino senden.',
  ),
  Slide(
    imageUrl: 'assets/images/information.jpg',
    title: 'Bluetooth Verbindung',
    description:
        'Um demnach Daten an den Arduino senden zu können, muss der Fahrer eine Bluetooth-Verbindung mit dem HC-05 Modul des Arduinos aufbauen.',
  ),
];
