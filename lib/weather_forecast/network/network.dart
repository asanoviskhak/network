import 'dart:convert';

import 'package:http/http.dart';
import 'package:network/weather_forecast/model/weather_forecast_model.dart';
import 'package:network/weather_forecast/model/weather_forecast_model2.dart';
import 'package:network/weather_forecast/util/forecast_util.dart';
import 'package:network/weather_forecast/weather_forecast.dart';

class Network{
  Future<WeatherForecastModel2> getWeatherForecast({String cityName}) async{
    var finalUrl = "http://api.weatherapi.com/v1/forecast.json?key="+Util.appId+"&q="+cityName+"&days=7";
    final response = await get(Uri.encodeFull(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");
    if (response.statusCode == 200){
      print("GETTING WEATHER DATA! : ${response.body}");
      return WeatherForecastModel2.fromJson(json.decode(response.body)); //we get actual mapped model (dart object)
    }
    else{
      throw Exception("Error getting forecast!");
    }
  }
}