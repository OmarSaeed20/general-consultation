// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryEntity _$CountryEntityFromJson(Map<String, dynamic> json) =>
    CountryEntity(
      countries: (json['countries'] as List<dynamic>)
          .map((e) => CountryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CountryData _$CountryDataFromJson(Map<String, dynamic> json) => CountryData(
      id: json['value'] as int,
      label: json['label'] as String,
      isActive: json['is_active'] as bool,
    );
