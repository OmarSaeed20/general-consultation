// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagenation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagenationModel<T> _$PagenationModelFromJson<T>(Map<String, dynamic> json) =>
    PagenationModel<T>(
      meta: MetaDataModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: DataConverter<T>().fromJson(json['data']),
    );

MetaDataModel _$MetaDataModelFromJson(Map<String, dynamic> json) =>
    MetaDataModel(
      currentPage: json['current_page'] as int?,
      lastPage: json['last_page'] as int?,
      totalPages: json['total_pages'] as int?,
      perPage: json['per_page'] as int?,
    );
