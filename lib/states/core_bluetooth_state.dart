import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class CoreBluetoothState extends ChangeNotifier {
  // state -> is bluetooth on or off?
  BluetoothState _enabled = BluetoothState.UNKNOWN;
  BluetoothState get state => _enabled;

  // holds a list of all prev. connected devices. kein state im sinne
  List<BluetoothDevice> _devices = [];
  List<BluetoothDevice> get devices => _devices;

  // state -> when trying to connect
  bool _isTryingToConnect = false;
  bool get isTryingToConnect => _isTryingToConnect;

  // state -> is connected? and information about connection
  BluetoothConnection? _bluetoothConnection;
  BluetoothConnection? get currentConnection => _bluetoothConnection;

  String? _addressOfCurrentlyConnectedDevice;
  String? get addressOfCurrentlyConnectedDeviceName =>
      _addressOfCurrentlyConnectedDevice;

  String? _nameOfCurrentlyConnectedDevice;
  String? get nameOfCurrentlyConnectedDeviceName =>
      _nameOfCurrentlyConnectedDevice;

  // ----------------------------------------------------------------------------------- //
  // ----------------------------------------------------------------------------------- //

  // Construtor, einmal ganz am anfang zu init des bl state
  // die ganze app hängt maßgeblich vom BL state ab.
  // Das bl zeug hängt so zusammen dass viele widgets gleichzeig gändert werden sollen
  // deshalb hält diese Provider auch viele States :)
  CoreBluetoothState() {
    // ignore: avoid_print
    print("init bluetooth provider ....");

    // Das hier passiert nur einmal am anfang (then()) und dann nie wieder
    FlutterBluetoothSerial.instance.state.then(onBluetoothStateChange);

    // das passiert NACH dem ersten mal (listen()), es ist ein stream
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen(onBluetoothStateChange);
  }

  // ----------------------------------------------------------------------------------- //
  // ----------------------------------------------------------------------------------- //

  // # ausgelagert
  void onBluetoothStateChange(BluetoothState bluetoothState) {
    // state setzten
    _enabled = bluetoothState;
    // clean up (just in case)
    disconnect();
    // wir sparen uns das "notifyListeners()" da es in "disconnect()" eh getan wird

    // In jedem Fall (BT State: an oder aus - is egal) können wir nach geräten Fragen.
    // ob wir einen Antwort bekommen hängt von BT State an.
    FlutterBluetoothSerial.instance.getBondedDevices().then((value) {
      // update die Liste an geräten
      _devices = value;
      notifyListeners();
    });
  }

  // ----------------------------------------------------------------------------------- //
  // ----------------------------------------------------------------------------------- //

  // call this when trying to connect. the msg_view an the dis page will change visualise this process.
  void tryingToConnect(String deviceName) {
    _nameOfCurrentlyConnectedDevice = deviceName;
    _isTryingToConnect = true;

    notifyListeners();
  }

  // mark a failed connection. is mostly the same as "disconnect". könnte man fusionieren.
  void failedToConnect() {
    _nameOfCurrentlyConnectedDevice = null;
    _isTryingToConnect = false;

    notifyListeners();
  }

  // use this to mark a successfull connection. bl state is not affacted
  void successfullyEstablishedConnectionWithDevice(
      BluetoothConnection bluetoothConnection, String name, String address) {
    _isTryingToConnect = false;
    _bluetoothConnection = bluetoothConnection;
    _addressOfCurrentlyConnectedDevice = address;
    _nameOfCurrentlyConnectedDevice = name;

    notifyListeners();
  }

  // use this to reset connection all to zero. bl state is not affacted
  void disconnect() {
    _bluetoothConnection?.finish();
    _bluetoothConnection = null;
    _addressOfCurrentlyConnectedDevice = null;
    _nameOfCurrentlyConnectedDevice = null;

    notifyListeners();
  }

  // ----------------------------------------------------------------------------------- //
  // ----------------------------------------------------------------------------------- //
  void startDiscorvery() {
    FlutterBluetoothSerial.instance.getBondedDevices().then((value) {
      // update die Liste an geräten
      _devices = value;
      notifyListeners();
    });
  }
}
