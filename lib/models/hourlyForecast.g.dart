// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourlyForecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyForecast _$HourlyForecastFromJson(Map<String, dynamic> json) =>
    HourlyForecast(
      dateTime: json['DateTime'] as String,
      isDayLight: json['IsDaylight'] as bool,
      iconPhrase: json['IconPhrase'] as String,
      temprature: HourlyForecast._temperatureFromJson(
          json['Temperature'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HourlyForecastToJson(HourlyForecast instance) =>
    <String, dynamic>{
      'DateTime': instance.dateTime,
      'IsDaylight': instance.isDayLight,
      'IconPhrase': instance.iconPhrase,
      'Temperature': instance.temprature,
    };
