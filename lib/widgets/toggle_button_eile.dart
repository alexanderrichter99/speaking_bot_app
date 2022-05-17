import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/core_bluetooth_state.dart';

class ToggleButtonEile extends StatefulWidget {
  const ToggleButtonEile({Key? key}) : super(key: key);

  @override
  _ToggleButtonEileState createState() => _ToggleButtonEileState();
}

class _ToggleButtonEileState extends State<ToggleButtonEile> {
  List<bool> isSelected = [false, true];

  @override
  Widget build(BuildContext context) => Center(
        child: ToggleButtons(
          isSelected: isSelected,
          selectedColor: Colors.white,
          color: Colors.black,
          fillColor: Colors.red.shade600,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('EILE', style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('Nicht in EILE', style: TextStyle(fontSize: 18)),
            ),
          ],
          onPressed: (int newIndex) {
            setState(() {
              for (int index = 0; index < isSelected.length; index++) {
                if (index == newIndex) {
                  isSelected[index] = true;
                } else {
                  isSelected[index] = false;
                }
              }
            });

            DateTime time = DateTime.now();
            Provider.of<CoreBluetoothState>(context, listen: false)
                .currentConnection
                ?.output
                .add(ascii.encode(
                    "${newIndex == 0 ? "" : "Nicht in "} Eile at ${time.hour}:${time.minute}:${time.second}!\n"));
          },
        ),
      );
}
