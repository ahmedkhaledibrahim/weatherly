import 'package:weatherly/models/country.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  @JsonKey(name: "Key")
  final String key;

  @JsonKey(name: "LocalizedName")
  final String localizedName;

  @JsonKey(name: "Country",fromJson: _countryFromJson)
  final String country;

  Location(
      {required this.key, required this.country, required this.localizedName});

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  static String _countryFromJson(Map<String, dynamic> json){
    String country = json['LocalizedName'];
    return country;
  }
}
