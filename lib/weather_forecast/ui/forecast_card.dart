import 'package:flutter/material.dart';
import 'package:network/weather_forecast/model/weather_forecast_model.dart';
import 'package:network/weather_forecast/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index){
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt*1000);
  dayOfWeek = Util.getDayOfWeek(date);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(dayOfWeek, style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),)
    ],
  );
}