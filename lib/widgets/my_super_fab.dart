// ignore_for_file: prefer_const_constructors

import 'package:speaking_bot_app/states/core_bluetooth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';

class MySuperFab extends StatelessWidget {
  const MySuperFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CoreBluetoothState>(
      builder: (context, coreBluetoothState, child) {
        if (coreBluetoothState.state == BluetoothState.STATE_OFF) {
          return ActivateBluetoothFAB(coreBluetoothState: coreBluetoothState);
        } else if (coreBluetoothState.state == BluetoothState.STATE_ON &&
            coreBluetoothState.isTryingToConnect == false &&
            coreBluetoothState.currentConnection == null) {
          return ReloadDevicesFAB(coreBluetoothState: coreBluetoothState);
        } else if (coreBluetoothState.currentConnection != null) {
          return CloseBtConnection(coreBluetoothState: coreBluetoothState);
        }

        return SizedBox();
      },
    );
  }
}

class ActivateBluetoothFAB extends StatelessWidget {
  final CoreBluetoothState coreBluetoothState;
  const ActivateBluetoothFAB({Key? key, required this.coreBluetoothState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.bluetooth),
      label: Text("Bluetooth aktivieren"),
      onPressed: () {
        FlutterBluetoothSerial.instance.requestEnable();
      },
    );
  }
}

class ReloadDevicesFAB extends StatelessWidget {
  final CoreBluetoothState coreBluetoothState;
  const ReloadDevicesFAB({Key? key, required this.coreBluetoothState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.replay_outlined),
      label: Text("Geräte suchen"),
      onPressed: () {
        coreBluetoothState.startDiscorvery();
      },
    );
  }
}

class CloseBtConnection extends StatelessWidget {
  final CoreBluetoothState coreBluetoothState;
  const CloseBtConnection({Key? key, required this.coreBluetoothState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.stop_circle_outlined),
      label: Text("Verbindung trennen"),
      onPressed: () {
        coreBluetoothState.disconnect();
      },
    );
  }
}
