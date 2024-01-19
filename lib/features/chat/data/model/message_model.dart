import '/index.dart';

part 'message_model.g.dart';

@JsonSerializable(createToJson: false)
class MessageModel extends BaseResponse<MessageEntity> {
  const MessageModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
