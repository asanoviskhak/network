import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:network/parsing_json/WeatherForecastModel2.dart';
Widget getWeatherIcon(String str, int i, double height, AsyncSnapshot<WeatherForecastModel2> snapshot){
  var forecastList = snapshot.data.forecast.forecastday[i].day.condition;
  String k = str, nw="http:";
  List l = k.split("/");
  for (int d=1; d<l.length; d++){
    if (d!=4) nw+="/"+l[d];
    if (d==4) nw+="/128x128";
  }
  nw.replaceRange(nw.length-2, nw.length-1," ");
  return Image(
    height: height,
    image: NetworkImage(nw),
  );
//  switch(description){
//    case 1000:
//      {return Icon(FontAwesomeIcons.sun, color: color, size: size,);}
//      break;
//    case 1006:
//      {return Icon(FontAwesomeIcons.cloud, color: color, size: size,);}
//      break;
//    case 1189:
//      {return Icon(FontAwesomeIcons.cloudRain, color: color, size: size,);}
//      break;
//    case 1219:
//      {return Icon(FontAwesomeIcons.snowflake, color: color, size: size,);}
//      break;
//    default: {return Icon(FontAwesomeIcons.sun, color: color, size: size,);}
//    break;
//  }
}

