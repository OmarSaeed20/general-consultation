// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_vendor_commints_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddVendorCommintsParameter _$AddVendorCommintsParameterFromJson(
        Map<String, dynamic> json) =>
    AddVendorCommintsParameter(
      rate: json['rate'] as int?,
      toUserId: json['to_user_id'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AddVendorCommintsParameterToJson(
        AddVendorCommintsParameter instance) =>
    <String, dynamic>{
      'to_user_id': instance.toUserId,
      'message': instance.message,
      'rate': instance.rate,
    };
