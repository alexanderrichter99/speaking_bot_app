// ignore_for_file: avoid_print

class CoreService {
  bool eile = false;

  set setEile(bool eile) {
    this.eile = eile;
    //print("switch $eile");
  }

// TODO speichere in die File
  void startManeuver(String msg) {
    print("Starte $msg ${eile ? "" : "nicht"} in Eile");
  }

// TODO speichere das Ende des Manövers in der File
  void stopManeuver(String msg) {
    print("Beende $msg ${eile ? "" : "nicht"} in Eile");
  }

// TODO erstelle File
  void beginTrip() {
    DateTime time = DateTime.now();
    print("Beginne Fahrt um ${time.hour}:${time.minute}:${time.second}!\n");
  }

// TODO passe interne Zeit mit Arduino Zeit an
  void syncTime() {}
}
