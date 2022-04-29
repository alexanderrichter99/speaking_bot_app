import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speaking_bot_app/states/core_bluetooth_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoreBluetoothState>(
      builder: (context, bluetoothEnabledState, child) {
        if (bluetoothEnabledState.currentConnection == null) {
          return const SizedBox();
        }

        return Expanded(
          child: Center(
            child: ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text("Send a Text", style: TextStyle(fontSize: 30)),
              ),
              onPressed: () {
                DateTime time = DateTime.now();
                bluetoothEnabledState.currentConnection?.output.add(ascii.encode(
                    "EILE at ${time.hour}:${time.minute}:${time.second}!\n"));
                //EILE
              },
            ),
          ),
        );
      },
    );
  }
}
