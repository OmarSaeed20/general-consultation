// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sup_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) =>
    SubCategoryModel(
      status: json['status'] as bool,
      code: json['status_code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubCategoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
