import 'package:flutter/material.dart';
import 'package:network/weather_forecast/model/weather_forecast_model.dart';
import 'package:network/weather_forecast/model/weather_forecast_model2.dart';
import 'package:network/weather_forecast/util/convert_icon.dart';
import 'package:network/weather_forecast/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel2> snapshot, int index){
  var forecastList = snapshot.data.forecast;
  var dayOfWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch((forecastList.forecastday[index].dateEpoch)*1000);
  dayOfWeek = Util.getDayOfWeek(date);
  var curHour = Util.getHour(date);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(dayOfWeek, style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),),
              Text(curHour, style: TextStyle(
                color: Colors.white,
                fontSize: 16,
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
            getWeatherIcon(description: forecastList.forecastday[index].day.condition.code, color: Colors.white, size: 48),
            Column(
              children: <Widget>[
                Text("${forecastList.forecastday[index].day.avgtempC.toStringAsFixed(0)}℃"),

              ],
            ),
          ],
        ),
      ),
    ],
  );
}