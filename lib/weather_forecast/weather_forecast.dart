import 'package:flutter/material.dart';
import 'package:network/weather_forecast/model/weather_forecast_model.dart';
import 'package:network/weather_forecast/network/network.dart';
import 'package:network/weather_forecast/ui/bottom_view.dart';
import 'dart:convert';

import 'ui/body_view.dart';
class WeatherForecast extends StatefulWidget{
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<WeatherForecast>{
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "London";
  @override
  void initState(){
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
    /*forecastObject.then((weather)=>{
      print(weather.list[0].main.temp)
    });*/
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){
                if (snapshot.hasData){
                  return Column(
                    children: <Widget>[
                      bodyView(snapshot),
                      bottomView(snapshot, context),
                    ],
                  );
                }
                else{
                  return Container(
                    child: Center(child: CircularProgressIndicator(),),
                  );
                }
              }),
          ),
        ],
      ),
        /*appBar: AppBar(
          title: Text("Forecast"),
        ),*/
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "City",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
          onSubmitted: (value){
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) =>
      new Network().getWeatherForecast(cityName: _cityName);
}