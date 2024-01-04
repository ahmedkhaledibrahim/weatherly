import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(name: "ID")
  final String id;

  @JsonKey(name: "LocalizedName")
  final String localizedName;

  Country({required this.id, required this.localizedName});

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
