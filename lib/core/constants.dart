import 'package:flutter/material.dart';

class AppConstants {
  static const String baseUrl =
      "https://api.openweathermap.org/data/2.5/weather?";

  static Size screenSize =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
}
