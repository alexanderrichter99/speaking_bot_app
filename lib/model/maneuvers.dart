class Maneuvers {
  final int id;
  final String title;
  String? longTitle;
  final String description;

  Maneuvers({
    required this.id,
    required this.title,
    this.longTitle,
    required this.description,
  });
}

final maneuverList = [
  Maneuvers(
    id: 0,
    longTitle:
        'Starkes Beschleunigen nach Abbiegen / Spurwechsel (verschwinden) des Vordermanns (Drängeln)',
    title: 'Starkes Beschleunigen nach Verschwinden des Vordermannes',
    description: 'Signale:\n- Abstand Vorderfahrzeug\n- Längsbeschleunigung',
  ),
  Maneuvers(
    id: 1,
    title: 'Überholen mit überhöhter Geschwindigkeit',
    description:
        'Signale:\n- Lenkwinkel\n- Längsbeschleunigung\n- Querbeschleunigung\n- Tatsächliche Geschwindigkeit\n- Geschwindigkeitsbegrenzung\n- Abstand Vorderfahrzeug',
  ),
  Maneuvers(
    id: 2,
    title: 'Kickdown',
    description: 'Signale:\n- Fahrpedalwinkel',
  ),
  Maneuvers(
    id: 3,
    title: 'Spurpendeln',
    description:
        'Definition:\nHäufiges Pendeln in der eigenen Spur, um beispielsweise einen Überholvorgang zu überprüfen oder Sicht auf den kommenden Streckenabschnitt zu erlangen.\n\nSignale:\n- Lenkwinkel\n- Abstand Vorderfahrer',
  ),
  Maneuvers(
    id: 4,
    title: 'Spurwechseln',
    description:
        'Signale:\n- Lenkwinkel\n- Längsbeschleunigung\n- Querbeschleunigung\n- Abstand Vorderfahrer',
  ),
  Maneuvers(
    id: 5,
    longTitle: 'Hastiges Anfahren nach Stillstand',
    title: 'Anfahren nach Stillstand',
    description:
        'Signale:\n- Längsbeschleunigung\n- Tatsächliche Geschwindigkeit\n\nSituation:\n- An der Ampel\n- Nach Abbiegen des Vordermanns',
  ),
  Maneuvers(
    id: 6,
    title: 'Auffahren',
    description:
        'Signale:\n- Abstand Vorderfahrzeug\n- Winkel Fahrpedal\n- Bremsdruck\n- Längsbeschleunigung',
  ),
  Maneuvers(
    id: 7,
    title: 'Speedlimittreue',
    description:
        'Signale:\n- Tatsächliche Geschwindigkeit\n- Erlaubte Geschwindigkeit',
  ),
  Maneuvers(
    id: 8,
    title: 'Hohe Kurvengeschwindigkeit',
    description:
        'Signale:\n- Querbeschleunigung\n- Längsbeschleunigung\n- Lenkwinkel',
  ),
];
