import 'package:flutter/foundation.dart';

class ManeuverState extends ChangeNotifier {
  bool ongoing = false;

  void isOngoing(bool state) {
    ongoing = state;
    notifyListeners();
    print("Maneuver is ongoing: " + state.toString());
  }
}
