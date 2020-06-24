import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network/weather_forecast/weather_forecast.dart';
void main() => runApp(new MaterialApp(
  home: AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
      child: WeatherForecast()),
  debugShowCheckedModeBanner: false,
  debugShowMaterialGrid: false,
));

