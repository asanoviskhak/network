import 'package:network/parsing_json/condition.dart';

class Day {

  double maxtemp_c;
  double maxtemp_f;
  double mintemp_c;
  double mintemp_f;
  double avgtemp_c;
  double avgtemp_f;
  double maxwind_mph;
  double maxwind_kph;
  double totalprecip_mm;
  double totalprecip_in;
  double avgvis_km;
  double avgvis_miles;
  double avghumidity;
  int daily_will_it_rain;
  String daily_chance_of_rain;
  int daily_will_it_snow;
  String daily_chance_of_snow;
  Condition condition;
  double uv;

	Day.fromJsonMap(Map<String, dynamic> map): 
		maxtemp_c = map["maxtemp_c"],
		maxtemp_f = map["maxtemp_f"],
		mintemp_c = map["mintemp_c"],
		mintemp_f = map["mintemp_f"],
		avgtemp_c = map["avgtemp_c"],
		avgtemp_f = map["avgtemp_f"],
		maxwind_mph = map["maxwind_mph"],
		maxwind_kph = map["maxwind_kph"],
		totalprecip_mm = map["totalprecip_mm"],
		totalprecip_in = map["totalprecip_in"],
		avgvis_km = map["avgvis_km"],
		avgvis_miles = map["avgvis_miles"],
		avghumidity = map["avghumidity"],
		daily_will_it_rain = map["daily_will_it_rain"],
		daily_chance_of_rain = map["daily_chance_of_rain"],
		daily_will_it_snow = map["daily_will_it_snow"],
		daily_chance_of_snow = map["daily_chance_of_snow"],
		condition = Condition.fromJsonMap(map["condition"]),
		uv = map["uv"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['maxtemp_c'] = maxtemp_c;
		data['maxtemp_f'] = maxtemp_f;
		data['mintemp_c'] = mintemp_c;
		data['mintemp_f'] = mintemp_f;
		data['avgtemp_c'] = avgtemp_c;
		data['avgtemp_f'] = avgtemp_f;
		data['maxwind_mph'] = maxwind_mph;
		data['maxwind_kph'] = maxwind_kph;
		data['totalprecip_mm'] = totalprecip_mm;
		data['totalprecip_in'] = totalprecip_in;
		data['avgvis_km'] = avgvis_km;
		data['avgvis_miles'] = avgvis_miles;
		data['avghumidity'] = avghumidity;
		data['daily_will_it_rain'] = daily_will_it_rain;
		data['daily_chance_of_rain'] = daily_chance_of_rain;
		data['daily_will_it_snow'] = daily_will_it_snow;
		data['daily_chance_of_snow'] = daily_chance_of_snow;
		data['condition'] = condition == null ? null : condition.toJson();
		data['uv'] = uv;
		return data;
	}
}
