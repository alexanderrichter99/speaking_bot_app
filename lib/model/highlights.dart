// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';

final Map<String, HighlightedWord> highlightList = {
  'Starkes Beschleunigen nach Verschwinden des Vordermannes': HighlightedWord(
    onTap: () => print('Starkes Beschleunigen'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  '0': HighlightedWord(
    onTap: () => print('0'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'null': HighlightedWord(
    onTap: () => print('null'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'Überholen mit überhöhter Geschwindigkeit': HighlightedWord(
    onTap: () => print('Überholen mit überhöhter Geschwindigkeit'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  '1': HighlightedWord(
    onTap: () => print('1'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'eins': HighlightedWord(
    onTap: () => print('eins'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'Kickdown': HighlightedWord(
    onTap: () => print('Spurpendeln'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  '2': HighlightedWord(
    onTap: () => print('2'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'zwei': HighlightedWord(
    onTap: () => print('zwei'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'Spurpendeln': HighlightedWord(
    onTap: () => print('Spurpendeln'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  '3': HighlightedWord(
    onTap: () => print('3'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'drei': HighlightedWord(
    onTap: () => print('drei'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'Spurwechseln': HighlightedWord(
    onTap: () => print('Spurwechseln'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  '4': HighlightedWord(
    onTap: () => print('4'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'vier': HighlightedWord(
    onTap: () => print('vier'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'Hastiges Anfahren nach Stillstand': HighlightedWord(
    onTap: () => print('Anfahren nach Stillstand'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  '5': HighlightedWord(
    onTap: () => print('5'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'fünf': HighlightedWord(
    onTap: () => print('fünf'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'Auffahren': HighlightedWord(
    onTap: () => print('Auffahren'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  '6': HighlightedWord(
    onTap: () => print('6'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'sechs': HighlightedWord(
    onTap: () => print('sechs'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'Speedlimittreue': HighlightedWord(
    onTap: () => print('Speedlimittreue'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  '7': HighlightedWord(
    onTap: () => print('7'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'sieben': HighlightedWord(
    onTap: () => print('sieben'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'Hohe Kurvengeschwindigkeit': HighlightedWord(
    onTap: () => print('Hohe Kurvengeschwindigkeit'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  '8': HighlightedWord(
    onTap: () => print('8'),
    textStyle: const TextStyle(
      // color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'acht': HighlightedWord(
    onTap: () => print('acht'),
    textStyle: const TextStyle(
      //color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'starte': HighlightedWord(
    onTap: () => print('starte'),
    textStyle: const TextStyle(
      // color: Colors.green,
      fontWeight: FontWeight.bold,
    ),
  ),
  'starten': HighlightedWord(
    onTap: () => print('starten'),
    textStyle: const TextStyle(
      //color: Colors.green,
      fontWeight: FontWeight.bold,
    ),
  ),
  'beginne': HighlightedWord(
    onTap: () => print('beginne'),
    textStyle: const TextStyle(
        //color: Colors.green,
        //fontWeight: FontWeight.bold,
        ),
  ),
  'beginnen': HighlightedWord(
    onTap: () => print('beginnen'),
    textStyle: const TextStyle(
        //color: Colors.green,
        //fontWeight: FontWeight.bold,
        ),
  ),
  'beende': HighlightedWord(
    onTap: () => print('beende'),
    textStyle: const TextStyle(
      //color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
  'beenden': HighlightedWord(
    onTap: () => print('beenden'),
    textStyle: const TextStyle(
      //color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
  'stoppe': HighlightedWord(
    onTap: () => print('stoppe'),
    textStyle: const TextStyle(
      //color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
  'stoppen': HighlightedWord(
    onTap: () => print('stoppen'),
    textStyle: const TextStyle(
      // color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
  'Eile': HighlightedWord(
    onTap: () => print('Eile'),
    textStyle: const TextStyle(
      //color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
  'nicht in Eile': HighlightedWord(
    onTap: () => print('nicht in Eile'),
    textStyle: const TextStyle(
      //color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
};
