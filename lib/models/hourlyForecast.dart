import 'package:json_annotation/json_annotation.dart';

part 'hourlyForecast.g.dart';

@JsonSerializable()
class HourlyForecast {
  @JsonKey(name: 'DateTime')
  final String dateTime;

  @JsonKey(name: 'IsDaylight')
  final bool isDayLight;
  @JsonKey(name: 'IconPhrase')
  final String iconPhrase;
  @JsonKey(name: 'Temperature', fromJson: _temperatureFromJson)
  final double temprature;

  static double _temperatureFromJson(Map<String, dynamic> json) {
    // Extract the "Value" field from the "Temperature" map
    double temp = json['Value'] as double;
    temp = ((temp - 32) * 5 / 9);
    return temp;
  }

  HourlyForecast(
      {required this.dateTime,
      required this.isDayLight,
      required this.iconPhrase,
      required this.temprature});

  factory HourlyForecast.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyForecastToJson(this);
}
