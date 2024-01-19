// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commint_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommintEntity _$CommintEntityFromJson(Map<String, dynamic> json) =>
    CommintEntity(
      countRates: json['count_rates'] as int,
      commints: json['rates'] == null
          ? null
          : CommintDataEntity.fromJson(json['rates'] as Map<String, dynamic>),
    );

CommintDataEntity _$CommintDataEntityFromJson(Map<String, dynamic> json) =>
    CommintDataEntity(
      rates: (json['data'] as List<dynamic>)
          .map((e) => CommintData.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : MetaDataModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

CommintData _$CommintDataFromJson(Map<String, dynamic> json) => CommintData(
      rate: json['rate'] as int?,
      image: json['image'] as String?,
      message: json['message'] as String,
      name: json['name'] as String,
      createdAt: json['created_at'] as String,
    );
