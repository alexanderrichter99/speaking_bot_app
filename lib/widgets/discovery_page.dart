// ignore_for_file: prefer_const_constructors

import 'package:speaking_bot_app/states/core_bluetooth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';

class BluetoothDevicesDiscoveryPage extends StatelessWidget {
  const BluetoothDevicesDiscoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CoreBluetoothState>(
      builder: (context, bluetoothEnabledState, child) {
        if (bluetoothEnabledState.devices.isEmpty) {
          return const SizedBox();
        }

        if (bluetoothEnabledState.currentConnection != null) {
          return const SizedBox();
        }

        if (bluetoothEnabledState.isTryingToConnect) {
          return const Expanded(
              child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              strokeWidth: 5,
            ),
          ));
        }

        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Deine Geräte",
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 8),
              Expanded(
                child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: bluetoothEnabledState.devices.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          //print(_devices[index].name ?? "rr");
                          String deName =
                              bluetoothEnabledState.devices[index].name ?? "";
                          String deAddress =
                              bluetoothEnabledState.devices[index].address;
                          return Card(
                            child: ListTile(
                              leading: SizedBox(
                                  height: double.infinity,
                                  child: Icon(
                                    Icons.bluetooth,
                                  )),
                              title: Text(deName),
                              subtitle: Text(deAddress),
                              trailing: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios),
                                onPressed: null,
                              ),
                              onTap: () async {
                                bluetoothEnabledState.tryingToConnect(deName);
                                try {
                                  BluetoothConnection bluetoothConnection =
                                      await BluetoothConnection.toAddress(
                                          deAddress);
                                  bluetoothEnabledState
                                      .successfullyEstablishedConnectionWithDevice(
                                          bluetoothConnection,
                                          deName,
                                          deAddress);
                                } catch (_) {
                                  bluetoothEnabledState.failedToConnect();
                                }
                              },
                            ),
                          );
                        },
                      ),
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
