import '/index.dart';

part 'get_chat_by_vendor_model.g.dart';

@JsonSerializable(createToJson: false)
class GetChatByVendorModel extends BaseResponse<GetChatByVendorEntity> {
  const GetChatByVendorModel({
    required super.code,
    required super.data,
    required super.message,
    required super.status,
  });

  factory GetChatByVendorModel.fromJson(Map<String, dynamic> json) =>
      _$GetChatByVendorModelFromJson(json);
}
