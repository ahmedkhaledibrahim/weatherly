import 'package:json_annotation/json_annotation.dart';
part 'city.g.dart';
@JsonSerializable()
class City {
  @JsonKey(name: 'Key')
  final String cityKey;
  @JsonKey(name: 'LocalizedName')
  final String name;
  @JsonKey(name: 'Country', fromJson: _countryFromJson)
  final String country;

  City({required this.cityKey, required this.country, required this.name});

  static String _countryFromJson(Map<String, dynamic> json){
    String country = json['LocalizedName'];
    return country;
  }

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String,dynamic> toJson() => _$CityToJson(this);
}
