import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speaking_bot_app/core/res/color.dart';
import 'package:speaking_bot_app/core/routes/routes.dart';

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
    return MaterialApp(
      title: 'Speaking Bot App',
      theme: AppColors.getTheme,
      initialRoute: Routes.tutorial,
      onGenerateRoute: RouterGenerator.generateRoutes,
    );
  }
}
