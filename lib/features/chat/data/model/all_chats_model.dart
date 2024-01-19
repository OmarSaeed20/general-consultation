import '/index.dart';

part 'all_chats_model.g.dart';

@JsonSerializable(createToJson: false)
class AllChatsModel extends BaseResponse<AllChatsEntity> {
  const AllChatsModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory AllChatsModel.fromJson(Map<String, dynamic> json) =>
      _$AllChatsModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  converters: [DataConverter()],
)
class AllChatsEntity extends Equatable {
  @JsonKey(name: "meta")
  final MetaDataModel meta;
  @JsonKey(name: "data")
  final List<AllChatData> list;

  const AllChatsEntity({required this.meta, required this.list});

  factory AllChatsEntity.fromJson(Map<String, dynamic> json) =>
      _$AllChatsEntityFromJson(json);

  @override
  List<Object?> get props => [meta, list];
}
