// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEntity _$HomeEntityFromJson(Map<String, dynamic> json) => HomeEntity(
      banners:
          (json['Banners'] as List<dynamic>).map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoriesEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      vendors: VendorHomeData.fromJson(json['vendors'] as Map<String, dynamic>),
      countUnread: json['count-unread'] as int,
    );

VendorHomeData _$VendorHomeDataFromJson(Map<String, dynamic> json) =>
    VendorHomeData(
      meta: MetaDataModel.fromJson(json['meta'] as Map<String, dynamic>),
      list: (json['data'] as List<dynamic>)
          .map((e) => VendorEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
