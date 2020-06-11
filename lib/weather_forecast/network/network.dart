import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:network/weather_forecast/model/weather_forecast_model2.dart';
import 'package:network/weather_forecast/util/forecast_util.dart';
import 'package:network/parsing_json/WeatherForecastModel2.dart';

class Network{
  Future<WeatherForecastModel2> getWeatherForecast({String cityName}) async{
    var finalUrl = "http://api.weatherapi.com/v1/forecast.json?key="+Util.appId+"&q="+cityName+"&days=3";
    final response = await http.get(finalUrl);
    print("URL: $finalUrl");
    bool k = false;
    if (response.statusCode == 200) k = true;
    if (k){
      final weatherForecastModel2 = WeatherForecastModel2.fromJsonMap(jsonDecode(response.body));
      return weatherForecastModel2; //we get actual mapped model (dart object)
    }
    else{
      throw Exception("Error getting forecast!");
    }
  }
}