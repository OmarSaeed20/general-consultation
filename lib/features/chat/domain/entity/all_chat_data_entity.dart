import '/index.dart';

part 'all_chat_data_entity.g.dart';

@JsonSerializable(createToJson: false)
class AllChatData extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "customer_id")
  final int? customerId;
  @JsonKey(name: "vendor_id")
  final int? vendorId;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "vendor")
  final Vendor? vendor;
  @JsonKey(name: "last_message")
  final MessageEntity? lastMessage;

  const AllChatData({
    required this.id,
    required this.customerId,
    required this.vendorId,
    required this.vendor,
    required this.lastMessage,
    required this.createdAt,
  });
  factory AllChatData.fromJson(Map<String, dynamic> json) =>
      _$AllChatDataFromJson(json);
  @override
  List<Object?> get props => [
        id,
        vendor,
        createdAt,
        lastMessage,
        customerId,
        vendorId,
      ];
}

@JsonSerializable(createToJson: false)
class Vendor extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "image")
  final String? image;

  const Vendor({
    required this.id,
    required this.name,
    required this.image,
  });
  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
  @override
  List<Object?> get props => [id, name, image];
}

/* @JsonSerializable(createToJson: false)
class ChatEntity extends Equatable {
  @JsonKey(name: "chat_data")
  final AllChatDataEntity? chatData;
  @JsonKey(name: "name")
  final PagenationModel<MessageEntity>? model;

  const ChatEntity({
    required this.chatData,
    required this.model,
  });
  factory ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatEntityFromJson(json);
  @override
  List<Object?> get props => [chatData, model];
}
 */