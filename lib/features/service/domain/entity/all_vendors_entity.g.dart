// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_vendors_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllVendorEntity _$AllVendorEntityFromJson(Map<String, dynamic> json) =>
    AllVendorEntity(
      meta: MetaDataModel.fromJson(json['meta'] as Map<String, dynamic>),
      vendors: (json['data'] as List<dynamic>)
          .map((e) => VendorEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
