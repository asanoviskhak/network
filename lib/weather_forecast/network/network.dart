import 'dart:convert';

import 'package:http/http.dart';
import 'package:network/weather_forecast/model/weather_forecast_model.dart';
import 'package:network/weather_forecast/util/forecast_util.dart';
import 'package:network/weather_forecast/weather_forecast.dart';

class Network{
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async{
    var finalUrl = "http://api.openweathermap.org/data/2.5/forecast?q="+cityName+"&appid="+Util.appId+"&units=metric"; //imperial - metric type
    final response = await get(Uri.encodeFull(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");
    if (response.statusCode == 200){
      print("GETTING WEATHER DATA! : ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body)); //we get actual mapped model (dart object)
    }
    else{
      throw Exception("Error getting forecast!");
    }
  }
}