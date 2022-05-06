// ignore_for_file: prefer_const_constructors

// ignore: unused_import
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speaking_bot_app/core/routes/routes.dart';
import 'package:speaking_bot_app/states/core_bluetooth_state.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

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
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text("Send a Text", style: TextStyle(fontSize: 30)),
              ),
              onPressed: () {
                DateTime time = DateTime.now();
                // bluetoothEnabledState.currentConnection?.output.add(ascii.encode(
                //     "Eile at ${time.hour}:${time.minute}:${time.second}!\n"));
                Navigator.of(context).pushNamed(Routes.home);
              },
            ),
          ),
        );
      },
    );
  }
}
