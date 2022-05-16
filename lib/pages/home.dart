// ignore_for_file: avoid_print, prefer_const_constructors

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
  final List<bool> isSelectedEile = [false];
  final List<bool> isSelectedUeberholen = [false];
  final List<bool> isSelectedKickdown = [false];
  final List<bool> isSelectedAuffahren = [false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAB Button Example"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text("Use Cases",
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(height: 8),
                  const SizedBox(height: 16),
                  ToggleButtons(
                      selectedColor: Colors.white,
                      color: Colors.black,
                      fillColor: Colors.red.shade300,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text('EILE', style: TextStyle(fontSize: 18)),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 12),
                        //   child: Text('Nicht in Eile',
                        //       style: TextStyle(fontSize: 18)),
                        // ),
                      ],
                      onPressed: (int index) {
                        DateTime time = DateTime.now();
                        Provider.of<CoreBluetoothState>(context, listen: false)
                            .currentConnection
                            ?.output
                            .add(ascii.encode(
                                "Eile at ${time.hour}:${time.minute}:${time.second}!\n"));
                        print("Eile");
                        setState(() {
                          isSelectedEile[index] = !isSelectedEile[index];
                        });
                      },
                      isSelected: isSelectedEile),
                  const SizedBox(height: 8),
                  ToggleButtons(
                      selectedColor: Colors.white,
                      color: Colors.black,
                      fillColor: Colors.lightBlue.shade900,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text('Ueberholmanoever',
                              style: TextStyle(fontSize: 18)),
                        ),
                      ],
                      onPressed: (int index) {
                        DateTime time = DateTime.now();
                        Provider.of<CoreBluetoothState>(context, listen: false)
                            .currentConnection
                            ?.output
                            .add(ascii.encode(
                                "Ueberholmanoever at ${time.hour}:${time.minute}:${time.second}!\n"));
                        print("Ueberholmanoever");
                        setState(() {
                          isSelectedUeberholen[index] =
                              !isSelectedUeberholen[index];
                        });
                      },
                      isSelected: isSelectedUeberholen),
                  const SizedBox(height: 8),
                  ToggleButtons(
                      selectedColor: Colors.white,
                      color: Colors.black,
                      fillColor: Colors.lightBlue.shade900,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child:
                              Text('Kickdown', style: TextStyle(fontSize: 18)),
                        ),
                      ],
                      onPressed: (int index) {
                        DateTime time = DateTime.now();
                        Provider.of<CoreBluetoothState>(context, listen: false)
                            .currentConnection
                            ?.output
                            .add(ascii.encode(
                                "Kickdown at ${time.hour}:${time.minute}:${time.second}!\n"));
                        print("Kickdown");
                        setState(() {
                          isSelectedKickdown[index] =
                              !isSelectedKickdown[index];
                        });
                      },
                      isSelected: isSelectedKickdown),
                  const SizedBox(height: 8),
                  ToggleButtons(
                      selectedColor: Colors.white,
                      color: Colors.black,
                      fillColor: Colors.lightBlue.shade900,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child:
                              Text('Auffahren', style: TextStyle(fontSize: 18)),
                        ),
                      ],
                      onPressed: (int index) {
                        DateTime time = DateTime.now();
                        Provider.of<CoreBluetoothState>(context, listen: false)
                            .currentConnection
                            ?.output
                            .add(ascii.encode(
                                "Auffahren at ${time.hour}:${time.minute}:${time.second}!\n"));
                        print("Auffahren");
                        setState(() {
                          isSelectedAuffahren[index] =
                              !isSelectedAuffahren[index];
                        });
                      },
                      isSelected: isSelectedAuffahren),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
