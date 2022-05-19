// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'core_bluetooth_state.dart';

class CoreService {
  bool eile = false;

  set setEile(bool eile) {
    this.eile = eile;

    // Provider.of<CoreBluetoothState>(context, listen: false)
    //     .currentConnection
    //     ?.output
    //     .add(ascii.encode(
    //         "${newIndex == 0 ? "" : "Nicht in "} Eile at ${time.hour}:${time.minute}:${time.second}!\n"));
    //print("switch $eile");
  }

// TODO speichere in die File
  void startManeuver(BuildContext context, String maneuver) {
    DateTime time = DateTime.now();
    Provider.of<CoreBluetoothState>(context, listen: false)
        .currentConnection
        ?.output
        .add(ascii.encode(
            "Starte $maneuver${eile ? "" : " nicht"} in Eile: ${time.hour}:${time.minute}:${time.second}!\n"));

    //print("Starte $maneuver ${eile ? "" : "nicht"} in Eile");
  }

// TODO speichere das Ende des Manövers in der File
  void stopManeuver(BuildContext context, String maneuver) {
    DateTime time = DateTime.now();
    Provider.of<CoreBluetoothState>(context, listen: false)
        .currentConnection
        ?.output
        .add(ascii.encode(
            "Beende $maneuver${eile ? "" : " nicht"} in Eile: ${time.hour}:${time.minute}:${time.second}!\n"));

    //print("Beende $maneuver ${eile ? "" : "nicht"} in Eile");
  }
}
