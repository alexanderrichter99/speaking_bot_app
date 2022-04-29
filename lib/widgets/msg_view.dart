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
              "Trying to connect with ${value.nameOfCurrentlyConnectedDeviceName}";
        } else if (value.state == BluetoothState.STATE_ON &&
            value.currentConnection != null) {
          bgColor = Colors.green.shade400;
          msgText =
              "Connected with ${value.nameOfCurrentlyConnectedDeviceName}";
        } else if (value.state == BluetoothState.STATE_ON) {
          bgColor = Colors.yellow.shade800;
          msgText = "Bluetooth is on but not connected";
        } else if (value.state == BluetoothState.STATE_OFF) {
          bgColor = Colors.red.shade400;
          msgText = "Bluetooth is off";
        } else if (value.state == BluetoothState.STATE_TURNING_ON) {
          bgColor = Colors.yellow.shade600;
          msgText = "Bluetooth is turning on";
        } else if (value.state == BluetoothState.STATE_TURNING_OFF) {
          bgColor = Colors.red.shade300;
          msgText = "Bluetooth is turning off";
        } else {
          bgColor = Colors.blue.shade400;
          msgText = "Bluetooth state is unknown";
        }

        return Container(
            height: 100,
            color: bgColor,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: AutoSizeText(
                        msgText,
                        maxLines: 1,
                        minFontSize: 25,
                        maxFontSize: 100,
                        overflow: TextOverflow.fade,
                        softWrap: false,
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
