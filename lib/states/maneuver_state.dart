import 'package:flutter/foundation.dart';

class ManeuverState extends ChangeNotifier {
  bool _ongoing = false;

  get ongoing => _ongoing;

  void isOngoing(bool state) {
    print("Maneuver is ongoing: " + state.toString());
    _ongoing = state;
    notifyListeners();
  }
}
