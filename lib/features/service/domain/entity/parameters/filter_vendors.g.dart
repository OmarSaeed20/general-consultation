// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_vendors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterVendorParameter _$FilterVendorParameterFromJson(
        Map<String, dynamic> json) =>
    FilterVendorParameter(
      categoryId: json['category_id'] as int?,
      subCtegoriesIds: (json['sub_categories_ids'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      countryId: json['country_id'] as int?,
      citiesIds: (json['cities_ids'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      verifyAccount: json['verify_account'] as String?,
      rate: json['rate'] as int?,
      keyWords: json['key_words'] as String?,
      office: json['office'] as int?,
      yearsOfExperience: json['years_of_experience'] as String?,
    );

Map<String, dynamic> _$FilterVendorParameterToJson(
        FilterVendorParameter instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'sub_categories_ids': instance.subCtegoriesIds,
      'country_id': instance.countryId,
      'cities_ids': instance.citiesIds,
      'verify_account': instance.verifyAccount,
      'rate': instance.rate,
      'key_words': instance.keyWords,
      'years_of_experience': instance.yearsOfExperience,
      'office': instance.office,
    };
