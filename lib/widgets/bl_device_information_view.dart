import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothDeviceInformationView extends StatefulWidget {
  const BluetoothDeviceInformationView({Key? key}) : super(key: key);

  @override
  State<BluetoothDeviceInformationView> createState() =>
      _BluetoothDeviceInformationViewState();
}

class _BluetoothDeviceInformationViewState
    extends State<BluetoothDeviceInformationView> {
  String _name = "";
  String _adress = "";

  @override
  void initState() {
    super.initState();

    FlutterBluetoothSerial.instance.name.then((value) {
      setState(() {
        _name = value ?? "unknown";
      });
    });

    FlutterBluetoothSerial.instance.address.then((value) {
      setState(() {
        _adress = value ?? "unknown";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_name == "" || _adress == "") {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Dein Gerät heißt $_name",
            style: Theme.of(context).textTheme.subtitle1),
        Text("mit der Adresse $_adress",
            style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }
}
