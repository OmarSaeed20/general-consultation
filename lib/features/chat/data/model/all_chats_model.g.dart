// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_chats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllChatsModel _$AllChatsModelFromJson(Map<String, dynamic> json) =>
    AllChatsModel(
      status: json['status'] as bool,
      code: json['status_code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : AllChatsEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

AllChatsEntity _$AllChatsEntityFromJson(Map<String, dynamic> json) =>
    AllChatsEntity(
      meta: MetaDataModel.fromJson(json['meta'] as Map<String, dynamic>),
      list: (json['data'] as List<dynamic>)
          .map((e) => AllChatData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
