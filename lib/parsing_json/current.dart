import 'package:network/parsing_json/condition.dart';

class Current {

  int last_updated_epoch;
  String last_updated;
  double temp_c;
  double temp_f;
  int is_day;
  Condition condition;
  double wind_mph;
  double wind_kph;
  int wind_degree;
  String wind_dir;
  double pressure_mb;
  double pressure_in;
  double precip_mm;
  double precip_in;
  int humidity;
  int cloud;
  double feelslike_c;
  double feelslike_f;
  double vis_km;
  double vis_miles;
  double uv;
  double gust_mph;
  double gust_kph;

	Current.fromJsonMap(Map<String, dynamic> map): 
		last_updated_epoch = map["last_updated_epoch"],
		last_updated = map["last_updated"],
		temp_c = map["temp_c"],
		temp_f = map["temp_f"],
		is_day = map["is_day"],
		condition = Condition.fromJsonMap(map["condition"]),
		wind_mph = map["wind_mph"],
		wind_kph = map["wind_kph"],
		wind_degree = map["wind_degree"],
		wind_dir = map["wind_dir"],
		pressure_mb = map["pressure_mb"],
		pressure_in = map["pressure_in"],
		precip_mm = map["precip_mm"],
		precip_in = map["precip_in"],
		humidity = map["humidity"],
		cloud = map["cloud"],
		feelslike_c = map["feelslike_c"],
		feelslike_f = map["feelslike_f"],
		vis_km = map["vis_km"],
		vis_miles = map["vis_miles"],
		uv = map["uv"],
		gust_mph = map["gust_mph"],
		gust_kph = map["gust_kph"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['last_updated_epoch'] = last_updated_epoch;
		data['last_updated'] = last_updated;
		data['temp_c'] = temp_c;
		data['temp_f'] = temp_f;
		data['is_day'] = is_day;
		data['condition'] = condition == null ? null : condition.toJson();
		data['wind_mph'] = wind_mph;
		data['wind_kph'] = wind_kph;
		data['wind_degree'] = wind_degree;
		data['wind_dir'] = wind_dir;
		data['pressure_mb'] = pressure_mb;
		data['pressure_in'] = pressure_in;
		data['precip_mm'] = precip_mm;
		data['precip_in'] = precip_in;
		data['humidity'] = humidity;
		data['cloud'] = cloud;
		data['feelslike_c'] = feelslike_c;
		data['feelslike_f'] = feelslike_f;
		data['vis_km'] = vis_km;
		data['vis_miles'] = vis_miles;
		data['uv'] = uv;
		data['gust_mph'] = gust_mph;
		data['gust_kph'] = gust_kph;
		return data;
	}
}
