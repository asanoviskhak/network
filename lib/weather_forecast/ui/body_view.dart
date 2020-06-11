import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:network/parsing_json/WeatherForecastModel2.dart';
import 'package:network/weather_forecast/util/convert_icon.dart';
import 'package:network/weather_forecast/util/forecast_util.dart';

Widget bodyView(AsyncSnapshot<WeatherForecastModel2> snapshot){
  var forecastList = snapshot.data;
  var city = snapshot.data.location.name;
  var country = snapshot.data.location.country;
  var forecast1 = forecastList.forecast.forecastday[0].day;
  var formattedDate = Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(forecastList.current.last_updated_epoch*1000));
  Container bodyView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("$city, $country", textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,

            ),
          ),
          Text("$formattedDate", style: TextStyle(
            fontSize: 14
          ),),
          SizedBox(height: 10,),
          //Icon(FontAwesomeIcons.cloud, size: 120,),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: getWeatherIcon(forecast1.condition.icon, 0, 120, snapshot),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${forecast1.avgtemp_c.toStringAsFixed(0)}℃", style: TextStyle(
                      fontSize: 46,
                    ),),
                    Text(" ${forecast1.condition.text.toUpperCase()}")
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecast1.maxwind_kph.toStringAsFixed(1)} km/h"),
                      Icon(FontAwesomeIcons.wind, size: 20, color: Colors.blueGrey[900])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecast1.avghumidity.toStringAsFixed(0)}%"),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20, color: Colors.blueGrey[900])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecast1.maxtemp_c.toStringAsFixed(0)}℃"),
                      Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.blueGrey[900])
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
  return bodyView;
}