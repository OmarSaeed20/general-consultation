import '/index.dart';

part 'get_chat_by_vendor_entity.g.dart';

@JsonSerializable(createToJson: false)
class GetChatByVendorEntity extends Equatable {
  @JsonKey(name: "chat_data")
  final AllChatData chat;
  @JsonKey(name: "messages")
  final MessagesData messages;

  const GetChatByVendorEntity({required this.chat, required this.messages});

  factory GetChatByVendorEntity.fromJson(Map<String, dynamic> json) =>
      _$GetChatByVendorEntityFromJson(json);
  @override
  List<Object> get props => [chat, messages];
}

@JsonSerializable(createToJson: false)
class MessagesData extends Equatable {
  @JsonKey(name: "data")
  final List<MessageEntity> messages;
  @JsonKey(name: "current_page")
  final int currentPage;
  @JsonKey(name: "last_page")
  final int lastPage;
  @JsonKey(name: "per_page")
  final int perPage;
  @JsonKey(name: "total")
  final int total;

  factory MessagesData.fromJson(Map<String, dynamic> json) =>
      _$MessagesDataFromJson(json);

  const MessagesData({
    required this.messages,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });
  @override
  List<Object> get props => [
        messages,
        currentPage,
        lastPage,
        perPage,
        total,
      ];
}
