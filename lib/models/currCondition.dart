class CurrCondition {
  final String weatherText;
  final String temprature;

  CurrCondition({required this.temprature, required this.weatherText});

  factory CurrCondition.fromJson(Map<String, dynamic> json) {
    return CurrCondition(
        temprature: double.parse(json['Temperature']['Metric']['Value'].toString()).toStringAsFixed(0),
        weatherText: json['WeatherText']);
  }
}
