import 'package:network/parsing_json/forecastday.dart';

class Forecast {

  List<Forecastday> forecastday;

	Forecast.fromJsonMap(Map<String, dynamic> map): 
		forecastday = List<Forecastday>.from(map["forecastday"].map((it) => Forecastday.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['forecastday'] = forecastday != null ? 
			this.forecastday.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
