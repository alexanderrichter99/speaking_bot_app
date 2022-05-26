// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:speaking_bot_app/model/maneuvers.dart';

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

// speichere in die File
  void startManeuver(BuildContext context, int id) {
    DateTime time = DateTime.now();
    Provider.of<CoreBluetoothState>(context, listen: false)
        .currentConnection
        ?.output
        .add(ascii.encode("$id ${eile ? "0" : "1"} ST\n"
            //"Starte $id${eile ? "" : " nicht"} in Eile: ${time.hour}:${time.minute}:${time.second}!\n")
            ));

    print(
        "Starte ${maneuverList.elementAt(id).title} ${eile ? "" : "nicht "}in Eile: ${time.hour}:${time.minute}:${time.second}!");
  }

// speichere das Ende des Manövers in der File
  void stopManeuver(BuildContext context, int id) {
    DateTime time = DateTime.now();
    Provider.of<CoreBluetoothState>(context, listen: false)
        .currentConnection
        ?.output
        .add(ascii.encode("$id ${eile ? "0" : "1"} SP\n"
            //"Beende $id${eile ? "" : " nicht"} in Eile: ${time.hour}:${time.minute}:${time.second}!\n"
            ));

    print(
        "Beende ${maneuverList.elementAt(id).title} ${eile ? "" : "nicht "}in Eile: ${time.hour}:${time.minute}:${time.second}!");
  }
}
