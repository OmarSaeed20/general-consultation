// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chat_by_vendor_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatByVendorEntity _$GetChatByVendorEntityFromJson(
        Map<String, dynamic> json) =>
    GetChatByVendorEntity(
      chat: AllChatData.fromJson(json['chat_data'] as Map<String, dynamic>),
      messages: MessagesData.fromJson(json['messages'] as Map<String, dynamic>),
    );

MessagesData _$MessagesDataFromJson(Map<String, dynamic> json) => MessagesData(
      messages: (json['data'] as List<dynamic>)
          .map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
    );
