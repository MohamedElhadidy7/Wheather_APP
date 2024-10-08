// ignore_for_file: public_member_api_docs, sort_constructors_first
class WheatherModel {
  final String cityname;
  final DateTime date;
  final String? image;
  final double maxtemp;
  final double mintemp;
  final double temp;
  final String condition;

  WheatherModel({
    required this.cityname,
    required this.date,
    this.image,
    required this.maxtemp,
    required this.mintemp,
    required this.temp,
    required this.condition,
  });

  factory WheatherModel.fromJson(json) {
    return WheatherModel(
      cityname: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
