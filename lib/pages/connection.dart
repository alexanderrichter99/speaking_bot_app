import 'package:speaking_bot_app/states/core_bluetooth_state.dart';
import 'package:speaking_bot_app/widgets/bl_device_information_view.dart';
import 'package:speaking_bot_app/widgets/chat_view.dart';
import 'package:speaking_bot_app/widgets/discovery_page.dart';
import 'package:speaking_bot_app/widgets/msg_view.dart';
import 'package:speaking_bot_app/widgets/my_super_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterBluetoothSerial.instance.name.then((value) {
      // ignore: avoid_print
      print("BL Name: $value");
    });

    return Scaffold(
      floatingActionButton: const MySuperFab(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MsgView(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bluetooth Demo App",
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(height: 8),
                  const BluetoothDeviceInformationView(),
                  const SizedBox(height: 8),
                  const BluetoothDevicesDiscoveryPage(),
                  const ChatView(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
