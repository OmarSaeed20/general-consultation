import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'message_entity.g.dart';

@JsonSerializable(createToJson: false)
class MessageEntity extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "chat_id")
  final int? chatId;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "type")
  final String? type;

  const MessageEntity({
    required this.id,
    required this.createdAt,
    required this.chatId,
    required this.message,
    required this.userId,
    required this.type,
  });
  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);
  @override
  List<Object?> get props => [id, chatId, type, userId, message, createdAt];
}
