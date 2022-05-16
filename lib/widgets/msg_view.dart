// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:speaking_bot_app/states/core_bluetooth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';

class MsgView extends StatelessWidget {
  const MsgView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CoreBluetoothState>(
      builder: (context, value, child) {
        Color bgColor = Colors.black;
        String msgText = "";
        if (value.isTryingToConnect) {
          bgColor = Colors.green.shade200;
          msgText =
              "Verbinde mit ${value.nameOfCurrentlyConnectedDeviceName} . . .";
        } else if (value.state == BluetoothState.STATE_ON &&
            value.currentConnection != null) {
          bgColor = Colors.green.shade400;
          msgText = "Verbunden mit ${value.nameOfCurrentlyConnectedDeviceName}";
        } else if (value.state == BluetoothState.STATE_ON) {
          bgColor = Colors.blue.shade400;
          msgText = "Bluetooth ist aktiviert";
        } else if (value.state == BluetoothState.STATE_OFF) {
          bgColor = Colors.red.shade400;
          msgText = "Bluetooth ist deaktiviert";
        } else if (value.state == BluetoothState.STATE_TURNING_ON) {
          bgColor = Colors.yellow.shade600;
          msgText = "Bluetooth wird aktiviert";
        } else if (value.state == BluetoothState.STATE_TURNING_OFF) {
          bgColor = Colors.red.shade300;
          msgText = "Bluetooth wird deaktiviert";
        } else {
          bgColor = Colors.blue.shade400;
          msgText = "Bluetooth Status ist unbekannt";
        }

        return Container(
            height: 60,
            color: bgColor,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: AutoSizeText(
                        msgText,
                        maxLines: 1,
                        minFontSize: 0,
                        maxFontSize: 100,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
