// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_chat_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllChatData _$AllChatDataFromJson(Map<String, dynamic> json) => AllChatData(
      id: json['id'] as int?,
      customerId: json['customer_id'] as int?,
      vendorId: json['vendor_id'] as int?,
      vendor: json['vendor'] == null
          ? null
          : Vendor.fromJson(json['vendor'] as Map<String, dynamic>),
      lastMessage: json['last_message'] == null
          ? null
          : MessageEntity.fromJson(
              json['last_message'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
    );

Vendor _$VendorFromJson(Map<String, dynamic> json) => Vendor(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
