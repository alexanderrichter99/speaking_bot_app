// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_final_fields, curly_braces_in_flow_control_structures, unnecessary_string_interpolations, avoid_print, unused_local_variable

import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sound_stream/sound_stream.dart';
import 'package:speaking_bot_app/states/maneuver_state.dart';
import 'package:wakelock/wakelock.dart';

// import Dialogflow
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';

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
    Wakelock.disable();
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
    Wakelock.enable();
    _recorder.start();

    _audioStream = BehaviorSubject<List<int>>();
    _audioStreamSubscription = _recorder.audioStream.listen((data) {
      // print(data);
      _audioStream.add(data);
    });

    // Create SpeechContexts
    // Create an audio InputConfig
    var biasList = SpeechContextV2Beta1(phrases: [
      'Auffahren',
      'Manöver',
      'Kickdown',
      'Spurwechseln',
      'Spurpendeln'
    ], boost: 20.0);

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

      DetectIntentResponse dataBecker = await dialogflow.detectIntent(
          data.recognitionResult.transcript, 'de-DE');

      if (dataBecker.queryResult.fulfillmentText.contains("fallback")) {
        return;
      }

      print('transcript: ' + data.recognitionResult.transcript);
      print('fulfillmentText: ' + dataBecker.queryResult.fulfillmentText);

      if (dataBecker.queryResult.fulfillmentText.length == 1) {
        // bool eile =
        //     dataBecker.queryResult.fulfillmentText == "0" ? true : false;
        String eile = dataBecker.queryResult.fulfillmentText;
        int intEile = int.parse(eile);
        Provider.of<ManeuverState>(context, listen: false)
            .setEile(intEile, context);
        return;
      }

      String id = dataBecker.queryResult.fulfillmentText
          .substring(4, dataBecker.queryResult.fulfillmentText.length);
      int intId = int.parse(id);

      // wenn ST dann werden Eile Buttons deaktiviert, falls SP dann wieder aktiviert
      if (dataBecker.queryResult.fulfillmentText.contains("ST")) {
        Provider.of<ManeuverState>(context, listen: false)
            .setManeuver(intId, context, true);
      } else if (dataBecker.queryResult.fulfillmentText.contains("SP")) {
        Provider.of<ManeuverState>(context, listen: false)
            .setManeuver(intId, context, false);
      }
    }, onError: (e) {
      //print(e);
    }, onDone: () {
      //print('done');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      animate: _isRecording,
      glowColor: Theme.of(context).primaryColor,
      endRadius: 50.0,
      duration: const Duration(milliseconds: 2000),
      repeatPauseDuration: const Duration(milliseconds: 100),
      repeat: true,
      child: FloatingActionButton(
        child: IconButton(
          iconSize: 30.0,
          icon: Icon(_isRecording ? Icons.mic : Icons.mic_off),
          onPressed: _isRecording ? stopStream : handleStream,
        ),
        onPressed: () {},
      ),
    );
  }
}
