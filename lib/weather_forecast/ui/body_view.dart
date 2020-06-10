import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:network/weather_forecast/model/weather_forecast_model.dart';
import 'package:network/weather_forecast/model/weather_forecast_model2.dart';
import 'package:network/weather_forecast/util/convert_icon.dart';
import 'package:network/weather_forecast/util/forecast_util.dart';

Widget bodyView(AsyncSnapshot<WeatherForecastModel2> snapshot){
  var forecastList = snapshot.data.forecast;
  var city = snapshot.data.location.name;
  var country = snapshot.data.location.country;
  var forecast1 = forecastList.forecastday[0];
  var formattedDate = Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(forecast1.dateEpoch*1000));
  Container bodyView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("$city, $country",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black
            ),
          ),
          Text("$formattedDate", style: TextStyle(
            fontSize: 14
          ),),
          SizedBox(height: 10,),
          //Icon(FontAwesomeIcons.cloud, size: 120,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(description: forecast1.day.condition.code, color: Colors.black, size: 120),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${forecast1.day.avgtempC.toStringAsFixed(0)}℃", style: TextStyle(
                  fontSize: 36,
                ),),
                Text(" ${forecast1.day.condition.text.toUpperCase()}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecast1.day.maxwindKph.toStringAsFixed(1)} km/h"),
                      Icon(FontAwesomeIcons.wind, size: 20, color: Colors.blueGrey[900])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecast1.day.avghumidity.toStringAsFixed(0)}%"),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20, color: Colors.blueGrey[900])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecast1.day.maxtempC.toStringAsFixed(0)}℃"),
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