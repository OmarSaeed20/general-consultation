// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesEntity _$CategoriesEntityFromJson(Map<String, dynamic> json) =>
    CategoriesEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$CategoriesEntityToJson(CategoriesEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'is_active': instance.isActive,
    };
