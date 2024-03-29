// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speaking_bot_app/model/maneuvers.dart';

import 'core_bluetooth_state.dart';

class CoreService {
  bool _eile = false;

  get eile => _eile;

  set setEile(bool eile) {
    _eile = eile;
  }

  // speichere in die File
  void startManeuver(BuildContext context, int id) {
    DateTime time = DateTime.now();
    Provider.of<CoreBluetoothState>(context, listen: false)
        .currentConnection
        ?.output
        .add(ascii.encode("$id ${_eile ? "0" : "1"} ST\n"
            //"Starte $id${eile ? "" : " nicht"} in Eile: ${time.hour}:${time.minute}:${time.second}!\n")
            ));

    print(
        "Starte ${maneuverList.elementAt(id).title} ${_eile ? "" : "nicht "}in Eile: ${time.hour}:${time.minute}:${time.second}!");
  }

// speichere das Ende des Manövers in der File
  void stopManeuver(BuildContext context, int id) {
    DateTime time = DateTime.now();
    Provider.of<CoreBluetoothState>(context, listen: false)
        .currentConnection
        ?.output
        .add(ascii.encode("$id ${_eile ? "0" : "1"} SP\n"
            //"Beende $id${eile ? "" : " nicht"} in Eile: ${time.hour}:${time.minute}:${time.second}!\n"
            ));

    print(
        "Beende ${maneuverList.elementAt(id).title} ${_eile ? "" : "nicht "}in Eile: ${time.hour}:${time.minute}:${time.second}!");
  }
}
