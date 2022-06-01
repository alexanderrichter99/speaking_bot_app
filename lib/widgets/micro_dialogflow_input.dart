// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_final_fields, curly_braces_in_flow_control_structures, unnecessary_string_interpolations, avoid_print, unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sound_stream/sound_stream.dart';

// import Dialogflow
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';
import 'package:speaking_bot_app/states/maneuver_state.dart';

class MicroDialogflowInput extends StatefulWidget {
  const MicroDialogflowInput({Key? key}) : super(key: key);

  @override
  _MicroDialogflowState createState() => _MicroDialogflowState();
}

class _MicroDialogflowState extends State<MicroDialogflowInput> {
  bool _isRecording = false;

  RecorderStream _recorder = RecorderStream();
  late StreamSubscription _recorderStatus;
  late StreamSubscription<List<int>> _audioStreamSubscription;
  late BehaviorSubject<List<int>> _audioStream;

  // DialogflowGrpcV2Beta1 class instance
  late DialogflowGrpcV2Beta1 dialogflow;

  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  @override
  void dispose() {
    _recorderStatus.cancel();
    _audioStreamSubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    _recorderStatus = _recorder.status.listen((status) {
      if (mounted)
        setState(() {
          _isRecording = status == SoundStreamStatus.Playing;
        });
    });

    await Future.wait([_recorder.initialize()]);

    // Get a Service account
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('assets/credentials.json'))}');
    // Create a DialogflowGrpc Instance
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
    print('init complete');
  }

  void stopStream() async {
    await _recorder.stop();
    await _audioStreamSubscription.cancel();
    await _audioStream.close();
  }

  void handleSubmitted(text) async {
    setState(() {
      // _messages.insert(0, message);
    });

    DetectIntentResponse data = await dialogflow.detectIntent(text, 'de-DE');
    String fulfillmentText = data.queryResult.fulfillmentText;
    if (fulfillmentText.isNotEmpty) {
      setState(() {
        // _messages.insert(0, botMessage);
      });
    }
  }

  void handleStream() async {
    _recorder.start();

    _audioStream = BehaviorSubject<List<int>>();
    _audioStreamSubscription = _recorder.audioStream.listen((data) {
      // print(data);
      _audioStream.add(data);
    });

    // Create SpeechContexts
    // Create an audio InputConfig
    var biasList =
        SpeechContextV2Beta1(phrases: ['Auffahren', 'Manöver'], boost: 20.0);

    // See: https://cloud.google.com/dialogflow/es/docs/reference/rpc/google.cloud.dialogflow.v2#google.cloud.dialogflow.v2.InputAudioConfig
    var config = InputConfigV2beta1(
        encoding: 'AUDIO_ENCODING_LINEAR_16',
        languageCode: 'de-DE',
        sampleRateHertz: 16000,
        singleUtterance: false,
        speechContexts: [biasList]);

    // Make the streamingDetectIntent call, with the InputConfig and the audioStream
    final responseStream =
        dialogflow.streamingDetectIntent(config, _audioStream);

    // Get the transcript and detectedIntent and show on screen
    responseStream.listen((data) async {
      // jedes einzelne Wort
      print('transcript: ' + data.recognitionResult.transcript);

      // Abfrage
      print('query text: ' + data.queryResult.queryText);

      DetectIntentResponse dataBecker = await dialogflow.detectIntent(
          data.recognitionResult.transcript, 'de-DE');

      // wenn ST dann werden Eile Buttons deaktiviert, falls SP dann wieder aktiviert
      if (dataBecker.queryResult.fulfillmentText.contains("ST")) {
        Provider.of<ManeuverState>(context, listen: false).isOngoing(true);
      } else if (dataBecker.queryResult.fulfillmentText.contains("SP")) {
        Provider.of<ManeuverState>(context, listen: false).isOngoing(false);
      }

      print('fulfillmentText: ' + dataBecker.queryResult.fulfillmentText);
    }, onError: (e) {
      //print(e);
    }, onDone: () {
      //print('done');
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30.0,
      icon: Icon(_isRecording ? Icons.mic : Icons.mic_off),
      onPressed: _isRecording ? stopStream : handleStream,
    );
  }
}
