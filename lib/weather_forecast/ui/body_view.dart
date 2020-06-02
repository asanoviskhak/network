import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:network/weather_forecast/model/weather_forecast_model.dart';
import 'package:network/weather_forecast/util/forecast_util.dart';

Widget bodyView(AsyncSnapshot<WeatherForecastModel> snapshot){
  var forecastList = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var forecast1 = forecastList[0];
  var formattedDate = Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(forecast1.dt*1000));
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
          Icon(FontAwesomeIcons.cloud, size: 120,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${forecast1.main.temp.toStringAsFixed(0)}℃", style: TextStyle(
                  fontSize: 36,
                ),),
                Text("${forecast1.weather[0].description.toUpperCase()}"),
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
                      Text("${forecast1.wind.speed.toStringAsFixed(1)} km/h"),
                      Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.blueGrey[900])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecast1.main.humidity.toStringAsFixed(0)}%"),
                      Icon(Icons.hot_tub, size: 20, color: Colors.blueGrey[900])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecast1.main.tempMax.toStringAsFixed(0)}℃"),
                      Icon(Icons.wb_sunny, size: 20, color: Colors.blueGrey[900])
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