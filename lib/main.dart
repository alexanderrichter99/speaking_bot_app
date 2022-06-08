import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:speaking_bot_app/core/routes/routes.dart';
import 'package:speaking_bot_app/states/core_bluetooth_state.dart';
import 'package:speaking_bot_app/states/core_service.dart';
import 'package:speaking_bot_app/states/maneuver_state.dart';
import 'package:speaking_bot_app/states/transcript_state.dart';
import 'package:speaking_bot_app/widgets/service_widget.dart';

void main() {
  // This makes the statusbar transparent
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ServiceWidget(
      coreService: CoreService(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<CoreBluetoothState>(
              create: (context) => CoreBluetoothState()),
          ChangeNotifierProvider<ManeuverState>(
              create: (context) => ManeuverState()),
          ChangeNotifierProvider<TranscriptState>(
              create: (context) => TranscriptState()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Speaking Bot App',
          initialRoute: Routes.tutorial,
          onGenerateRoute: RouterGenerator.generateRoutes,
          //theme: AppColors.getTheme,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        ),
      ),
    );
  }
}
