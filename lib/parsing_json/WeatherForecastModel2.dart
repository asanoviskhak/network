import 'package:network/parsing_json/location.dart';
import 'package:network/parsing_json/current.dart';
import 'package:network/parsing_json/forecast.dart';
import 'package:network/parsing_json/alert.dart';

class WeatherForecastModel2 {

  Location location;
  Current current;
  Forecast forecast;
  Alert alert;

	WeatherForecastModel2.fromJsonMap(Map<String, dynamic> map): 
		location = Location.fromJsonMap(map["location"]),
		current = Current.fromJsonMap(map["current"]),
		forecast = Forecast.fromJsonMap(map["forecast"]),
		alert = Alert.fromJsonMap(map["alert"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['location'] = location == null ? null : location.toJson();
		data['current'] = current == null ? null : current.toJson();
		data['forecast'] = forecast == null ? null : forecast.toJson();
		data['alert'] = alert == null ? null : alert.toJson();
		return data;
	}
}
