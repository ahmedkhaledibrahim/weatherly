// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      key: json['Key'] as String,
      country:
          Location._countryFromJson(json['Country'] as Map<String, dynamic>),
      localizedName: json['LocalizedName'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'Key': instance.key,
      'LocalizedName': instance.localizedName,
      'Country': instance.country,
    };
