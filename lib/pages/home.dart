import 'package:flutter/material.dart';
import 'package:speaking_bot_app/widgets/toggle_button_eile.dart';
import 'package:speaking_bot_app/widgets/toggle_buttons_maneuver.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> isSelectedEile = [false];
  final List<bool> isSelectedUeberholen = [false];
  final List<bool> isSelectedKickdown = [false];
  final List<bool> isSelectedAuffahren = [false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Use Cases",
            style: TextStyle(fontSize: 20, color: Colors.white)),
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
    );
  }
}
