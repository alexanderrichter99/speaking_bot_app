import 'package:flutter/foundation.dart';

class ManeuverState extends ChangeNotifier {
  bool _ongoing = false;

  get ongoing => _ongoing;

  void isOngoing(bool state) {
    _ongoing = state;
    notifyListeners();
  }
}
