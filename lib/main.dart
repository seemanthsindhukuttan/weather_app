import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/views/screen_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // transparent status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData.dark(),
      home: const ScreenHome(),
    );
  }
}
