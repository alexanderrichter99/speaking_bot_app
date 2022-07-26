// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speaking_bot_app/model/highlights.dart';
import 'package:provider/provider.dart';
import 'package:speaking_bot_app/states/maneuver_state.dart';
import 'package:speaking_bot_app/states/transcript_state.dart';
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
          builder: (context, maneuverState, child) {
            var additionalText = maneuverState.ongoing
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
                  // SizedBox(
                  //     height: 75.0,
                  //     child: Padding(
                  //       child: Consumer<TranscriptState>(
                  //         builder: (context, transcriptState, child) {
                  //           return TextHighlight(
                  //             textAlign: TextAlign.center,
                  //             text: "${transcriptState.transcript}",
                  //             words: highlightList,
                  //             textStyle: const TextStyle(
                  //                 fontSize: 15,
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.w400),
                  //           );
                  //         },
                  //       ),
                  //       padding: EdgeInsets.only(
                  //           top: 32.0, bottom: 2.0, left: 2.0, right: 2.0),
                  //     )),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: MicroDialogflowInput(),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
            height: 75.0,
            child: Padding(
              child: Consumer<TranscriptState>(
                builder: (context, transcriptState, child) {
                  return TextHighlight(
                    textAlign: TextAlign.center,
                    text: "${transcriptState.transcript}",
                    words: highlightList,
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              padding: EdgeInsets.only(
                  top: 32.0, bottom: 2.0, left: 2.0, right: 2.0),
            )),
        color: Colors.blue.shade400,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
