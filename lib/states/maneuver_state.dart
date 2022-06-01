import 'package:flutter/foundation.dart';

class ManeuverState extends ChangeNotifier {
  // only refers to eile buttons
  bool _ongoing = false;

  bool _maneuverActivated = false;

  get ongoing => _ongoing;

  get maneuverActivated => _maneuverActivated;

  void isOngoing(bool state) {
    _ongoing = state;
    notifyListeners();
  }

  void isManeuverActivated(bool state) {
    _maneuverActivated = state;
    notifyListeners();
  }
}
