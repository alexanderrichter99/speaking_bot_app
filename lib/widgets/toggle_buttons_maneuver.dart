// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speaking_bot_app/model/maneuvers.dart';
import 'package:speaking_bot_app/states/maneuver_state.dart';
import 'package:speaking_bot_app/widgets/service_widget.dart';

class ToggleButtonManeuver extends StatefulWidget {
  const ToggleButtonManeuver({Key? key}) : super(key: key);

  @override
  _ToggleButtonManeuverState createState() => _ToggleButtonManeuverState();
}

class _ToggleButtonManeuverState extends State<ToggleButtonManeuver> {
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) => Center(
        child: ToggleButtons(
          direction: Axis.vertical,
          isSelected: isSelected,
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
          onPressed: (int newIndex) {
            bool isStartofManeuver = true;

            setState(() {
              for (int index = 0; index < isSelected.length; index++) {
                if (index == newIndex) {
                  isSelected[index] = !isSelected[index];
                  isStartofManeuver = isSelected[index];
                } else {
                  if (isSelected[index]) {
                    int id = maneuverList.elementAt(index).id;

                    ServiceWidget.of(context)
                        ?.coreService
                        .stopManeuver(context, id);
                  }
                  isSelected[index] = false;
                }
              }
            });

            int id = maneuverList.elementAt(newIndex).id;

            if (isStartofManeuver) {
              ServiceWidget.of(context)?.coreService.startManeuver(context, id);
              Provider.of<ManeuverState>(context, listen: false)
                  .isOngoing(true);
            } else {
              ServiceWidget.of(context)?.coreService.stopManeuver(context, id);
              Provider.of<ManeuverState>(context, listen: false)
                  .isOngoing(false);
            }
          },
        ),
      );
}
