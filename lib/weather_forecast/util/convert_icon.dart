import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget getWeatherIcon({String description, Color color, double size}){
  switch(description){
    case "Clear":
      {return Icon(FontAwesomeIcons.sun, color: color, size: size,);}
      break;
    case "Clouds":
      {return Icon(FontAwesomeIcons.cloud, color: color, size: size,);}
      break;
    case "Rain":
      {return Icon(FontAwesomeIcons.cloudRain, color: color, size: size,);}
      break;
    case "Snow":
      {return Icon(FontAwesomeIcons.snowflake, color: color, size: size,);}
      break;
    default: {return Icon(FontAwesomeIcons.sun, color: color, size: size,);}
    break;
  }
}