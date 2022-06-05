// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speaking_bot_app/states/maneuver_state.dart';
import 'package:speaking_bot_app/widgets/micro_dialogflow_input.dart';
import 'package:speaking_bot_app/widgets/service_widget.dart';
import 'package:speaking_bot_app/widgets/toggle_button_eile.dart';
import 'package:speaking_bot_app/widgets/toggle_buttons_maneuver.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Consumer<ManeuverState>(
          builder: (context, value, child) {
            var additionalText = value.ongoing
                ? " - ${ServiceWidget.of(context)?.coreService.eile ? "" : "nicht "}in Eile"
                : "";
            return Text("Use Cases" + additionalText,
                style: const TextStyle(fontSize: 20, color: Colors.white));
          },
        ),
        backgroundColor: Colors.blue.shade400,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Was soll aufgezeichnet werden?"),
                    content: const Text(
                        "- Manöver in Eile\n- UND Manöver nicht in Eile"),
                    actions: [
                      TextButton(
                        child: const Text("OK"),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ToggleButtonEile(),
                  SizedBox(height: 16),
                  ToggleButtonManeuver(),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: MicroDialogflowInput(),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0),
        color: Colors.blue.shade400,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
