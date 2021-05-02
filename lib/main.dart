import 'package:flutter/material.dart';
import 'package:flutter_weather_app/weather_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      home: WeatherPage(),
    );
  }
}
