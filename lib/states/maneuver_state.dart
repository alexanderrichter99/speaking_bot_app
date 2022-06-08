// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:speaking_bot_app/model/maneuvers.dart';
import 'package:speaking_bot_app/widgets/service_widget.dart';

class ManeuverState extends ChangeNotifier {
  // only refers to eile buttons
  bool _ongoing = false;

  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<bool> isSelectedEile = [false, true];

  get ongoing => _ongoing;

  void isOngoing(bool state) {
    _ongoing = state;
    notifyListeners();
  }

  void setManeuver(int newIndex, BuildContext context, bool? start) {
    // daran erkenn wir ob start oder nicht
    bool isStartofManeuver = true;

    for (int index = 0; index < isSelected.length; index++) {
      // auf gleichen Button geklickt => button wird entdrückt
      if (index == newIndex) {
        // button entdrückt
        isSelected[index] = start ?? !isSelected[index];
        isStartofManeuver = isSelected[index];
      } else {
        // anderer button gedrückt
        if (isSelected[index]) {
          int id = maneuverList.elementAt(index).id;

          // beende zuvor laufendes maneuver, falls direkt ein neues maneuver gestartet worden ist
          ServiceWidget.of(context)?.coreService.stopManeuver(context, id);
        }
        // nur auf button soll man drücken
        isSelected[index] = false;
      }
    }

    int id = maneuverList.elementAt(newIndex).id;

    if (isStartofManeuver) {
      ServiceWidget.of(context)?.coreService.startManeuver(context, id);
      _ongoing = true;
    } else {
      ServiceWidget.of(context)?.coreService.stopManeuver(context, id);
      _ongoing = false;
    }
    notifyListeners();
  }

  void setEile(int newIndex, BuildContext context) {
    if (ongoing) {
      return;
    }
    for (int index = 0; index < isSelectedEile.length; index++) {
      if (index == newIndex) {
        isSelectedEile[index] = true;
      } else {
        isSelectedEile[index] = false;
      }
    }

    ServiceWidget.of(context)?.coreService.setEile =
        newIndex == 0 ? true : false;
    notifyListeners();
  }

  int searchIndex() {
    int index = 0;
    for (int i = 0; i < isSelected.length; i++) {
      if (isSelected[i] == true) {
        index = i;
      }
    }
    return index;
  }
}
