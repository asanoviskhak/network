import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:network/parsing_json/WeatherForecastModel2.dart';
import 'package:network/weather_forecast/util/convert_icon.dart';
import 'package:network/weather_forecast/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel2> snapshot, int index){
  var forecastList = snapshot.data.forecast.forecastday[index];
  var dayOfWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch((forecastList.date_epoch)*1000);
  dayOfWeek = Util.getDayOfWeek(date);
  var curHour = Util.getHour(date);
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(dayOfWeek, style: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 12,
                ),),
              ),
              Text(forecastList.day.condition.text.toUpperCase(), textAlign: TextAlign.center, style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),)
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            getWeatherIcon(forecastList.day.condition.icon, index, 64, snapshot),
            Column(
              children: <Widget>[
                Row(
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.only(right: 4.0, left: 4.0, bottom: 4.0),
                       child: Text("${forecastList.day.mintemp_c.toStringAsFixed(0)}℃", style: TextStyle(color: Colors.white),),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 4.0),
                       child: Icon(FontAwesomeIcons.arrowDown, color: Colors.white, size: 17),
                     )
                   ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 4),
                      child: Text("${forecastList.day.maxtemp_c.toStringAsFixed(0)}℃", style: TextStyle(color: Colors.white),),
                    ),
                    Icon(FontAwesomeIcons.arrowUp, color: Colors.white, size: 17)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 4),
                child: Text("${forecastList.day.avghumidity.toStringAsFixed(0)}%", style: TextStyle(color: Colors.white, fontSize: 12),),
              ),
              Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white, size: 14),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 4),
                child: Text("${forecastList.day.maxwind_kph.toStringAsFixed(1)}km/h", style: TextStyle(color: Colors.white, fontSize: 12),),
              ),
              Icon(FontAwesomeIcons.wind, color: Colors.white, size: 14)
            ],
          ),
        ],
      ),

    ],
  );
}