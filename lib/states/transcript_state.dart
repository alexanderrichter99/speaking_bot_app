import 'package:flutter/material.dart';

class TranscriptState extends ChangeNotifier {
  String _transcript = "";

  get transcript => _transcript;

  void setTranscript(String newTranscript, BuildContext context) {
    _transcript = newTranscript;
    notifyListeners();
  }
}
