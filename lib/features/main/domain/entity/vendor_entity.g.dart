// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorEntity _$VendorEntityFromJson(Map<String, dynamic> json) => VendorEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      about: json['about'] as String?,
      yearsOfExperience: json['years_of_experience'] as int?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      locationText: json['location_text'] as String?,
      locationLat: json['location_lat'] as String?,
      locationLong: json['location_long'] as String?,
      licenseWorkImage: json['license_work_image'] as String?,
      licenseWorkDate: json['license_work_date'] as String?,
      category:
          CategoriesEntity.fromJson(json['category'] as Map<String, dynamic>),
      subCategory: json['sub_category'] == null
          ? null
          : SubCategoryEntity.fromJson(
              json['sub_category'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : CountryData.fromJson(json['country'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : CountryData.fromJson(json['city'] as Map<String, dynamic>),
      dayes: json['dayes'] == null
          ? null
          : Dayes.fromJson(json['dayes'] as Map<String, dynamic>),
      serviceDescription: json['service_description'] as String?,
      aboutMedia: json['about_media'] as String?,
      avgRate: json['avg_rate'] as String,
      accountVerificationSign: json['account_verification_sign'] as bool?,
      isOffice: json['is_office'] as bool?,
    );

Dayes _$DayesFromJson(Map<String, dynamic> json) => Dayes(
      saturday: json['saturday'] == null
          ? null
          : Day.fromJson(json['saturday'] as Map<String, dynamic>),
      sunday: json['sunday'] == null
          ? null
          : Day.fromJson(json['sunday'] as Map<String, dynamic>),
      monday: json['monday'] == null
          ? null
          : Day.fromJson(json['monday'] as Map<String, dynamic>),
      tuesday: json['tuesday'] == null
          ? null
          : Day.fromJson(json['tuesday'] as Map<String, dynamic>),
      wednesday: json['wednesday'] == null
          ? null
          : Day.fromJson(json['wednesday'] as Map<String, dynamic>),
      thursday: json['thursday'] == null
          ? null
          : Day.fromJson(json['thursday'] as Map<String, dynamic>),
      friday: json['friday'] == null
          ? null
          : Day.fromJson(json['friday'] as Map<String, dynamic>),
    );

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      from: json['from'] as String?,
      to: json['to'] as String?,
      name: json['translate_word'] as String?,
    );
