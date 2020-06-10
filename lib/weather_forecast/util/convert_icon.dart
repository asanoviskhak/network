import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget getWeatherIcon({int description, Color color, double size}){
  switch(description){
    case 1000:
      {return Icon(FontAwesomeIcons.sun, color: color, size: size,);}
      break;
    case 1006:
      {return Icon(FontAwesomeIcons.cloud, color: color, size: size,);}
      break;
    case 1189:
      {return Icon(FontAwesomeIcons.cloudRain, color: color, size: size,);}
      break;
    case 1219:
      {return Icon(FontAwesomeIcons.snowflake, color: color, size: size,);}
      break;
    default: {return Icon(FontAwesomeIcons.sun, color: color, size: size,);}
    break;
  }
}