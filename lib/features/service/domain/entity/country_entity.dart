import 'package:general_consultation/index.dart';

part "country_entity.g.dart";

@JsonSerializable(createToJson: false)
class CountryEntity extends Equatable {
  // @JsonKey(name: "data" )
  final List<CountryData> countries;
  const CountryEntity({required this.countries});
  factory CountryEntity.fromJson(Map<String, dynamic> json) =>
      _$CountryEntityFromJson(json);

  @override
  List<Object?> get props => [countries];
}

@JsonSerializable(createToJson: false)
class CountryData extends Equatable {
  @JsonKey(name: "value")
  final int id;
  @JsonKey(name: "label")
  final String label;
  @JsonKey(name: "is_active")
  final bool isActive;
  const CountryData(
      {required this.id, required this.label, required this.isActive});
  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);

  @override
  List<Object?> get props => [id, label, isActive];
}
