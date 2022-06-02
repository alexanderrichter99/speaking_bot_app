// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speaking_bot_app/model/maneuvers.dart';
import 'package:speaking_bot_app/states/maneuver_state.dart';

class ToggleButtonManeuver extends StatefulWidget {
  const ToggleButtonManeuver({Key? key}) : super(key: key);

  @override
  _ToggleButtonManeuverState createState() => _ToggleButtonManeuverState();
}

class _ToggleButtonManeuverState extends State<ToggleButtonManeuver> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ManeuverState>(
      builder: (context, maneuverState, child) {
        return Center(
          child: ToggleButtons(
            direction: Axis.vertical,
            isSelected: maneuverState.isSelected,
            selectedColor: Colors.white,
            color: Colors.black,
            fillColor: Colors.blue.shade400,
            children: maneuverList.map<Widget>((e) {
              return GestureDetector(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(e.title,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),
                ),
                onDoubleTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(e.longTitle ?? e.title),
                      content: Text(e.description),
                      actions: [
                        TextButton(
                          child: const Text("OK"),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  );
                },
              );
            }).toList(),
            onPressed: (newIndex) {
              maneuverState.setManeuver(newIndex, context, null);
            },
          ),
        );
      },
    );
  }
}
