// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      cityKey: json['Key'] as String,
      country: City._countryFromJson(json['Country'] as Map<String, dynamic>),
      name: json['LocalizedName'] as String,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'Key': instance.cityKey,
      'LocalizedName': instance.name,
      'Country': instance.country,
    };
