// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
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
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                  'Starkes Beschleunigen nach Verschwinden des Vordermannes',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('Überholen mit überhöhter Geschwindigkeit',
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('Kickdown',
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('Spurpendeln',
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('Spurwechseln',
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('Anfahren nach Stillstand',
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('Auffahren',
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('Speedlimitreue',
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('Hohe Kurvengeschwindigkeit',
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            ),
          ],
          onPressed: (int newIndex) {
            bool isStartofManeuver = true;

            setState(() {
              for (int index = 0; index < isSelected.length; index++) {
                if (index == newIndex) {
                  isSelected[index] = !isSelected[index];
                  isStartofManeuver = isSelected[index];
                } else {
                  if (isSelected[index]) {
                    String maneuver = "";
                    if (index == 0) {
                      maneuver =
                          "Starkes Beschleunigen nach Verschwinden des Vordermannes";
                    } else if (index == 1) {
                      maneuver = "Ueberholen mit ueberhoehter Geschwindigkeit";
                    } else if (index == 2) {
                      maneuver = "Kickdown";
                    } else if (index == 3) {
                      maneuver = "Spurpendeln";
                    } else if (index == 4) {
                      maneuver = "Spurwechseln";
                    } else if (index == 5) {
                      maneuver = "Anfahren nach Stillstand";
                    } else if (index == 6) {
                      maneuver = "Auffahren";
                    } else if (index == 7) {
                      maneuver = "Speedlimitreue";
                    } else if (index == 8) {
                      maneuver = "Hohe Kurvengeschwindigkeit";
                    }
                    ServiceWidget.of(context)
                        ?.coreService
                        .stopManeuver(context, maneuver);
                  }
                  isSelected[index] = false;
                }
              }
            });

            String maneuver = "";

            if (newIndex == 0) {
              maneuver =
                  "Starkes Beschleunigen nach Verschwinden des Vordermannes";
            } else if (newIndex == 1) {
              maneuver = "Ueberholen mit ueberhoehter Geschwindigkeit";
            } else if (newIndex == 2) {
              maneuver = "Kickdown";
            } else if (newIndex == 3) {
              maneuver = "Spurpendeln";
            } else if (newIndex == 4) {
              maneuver = "Spurwechseln";
            } else if (newIndex == 5) {
              maneuver = "Anfahren nach Stillstand";
            } else if (newIndex == 6) {
              maneuver = "Auffahren";
            } else if (newIndex == 7) {
              maneuver = "Speedlimitreue";
            } else if (newIndex == 8) {
              maneuver = "Hohe Kurvengeschwindigkeit";
            }

            if (isStartofManeuver) {
              ServiceWidget.of(context)
                  ?.coreService
                  .startManeuver(context, maneuver);
            } else {
              ServiceWidget.of(context)
                  ?.coreService
                  .stopManeuver(context, maneuver);
            }
          },
        ),
      );
}
