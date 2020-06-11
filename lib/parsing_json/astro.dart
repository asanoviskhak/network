
class Astro {

  String sunrise;
  String sunset;
  String moonrise;
  String moonset;

	Astro.fromJsonMap(Map<String, dynamic> map): 
		sunrise = map["sunrise"],
		sunset = map["sunset"],
		moonrise = map["moonrise"],
		moonset = map["moonset"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['sunrise'] = sunrise;
		data['sunset'] = sunset;
		data['moonrise'] = moonrise;
		data['moonset'] = moonset;
		return data;
	}
}
