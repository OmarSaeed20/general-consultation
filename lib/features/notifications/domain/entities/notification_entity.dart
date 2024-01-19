import 'package:general_consultation/index.dart';
part 'notification_entity.g.dart';

@JsonSerializable(createToJson: false, converters: [DataConverter()])
class NotificationEntity extends Equatable {
  @JsonKey(name: "meta")
  final MetaDataModel meta;
  @JsonKey(name: "data")
  final List<NotificationData> notificatiion;

  const NotificationEntity({required this.meta, required this.notificatiion});

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);

  @override
  List<Object?> get props => [meta, notificatiion];
}

@JsonSerializable(createToJson: false)
class NotificationData extends Equatable {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "icon")
  final String type;
  @JsonKey(name: "content")
  final String content;

  const NotificationData({
    required this.id,
    required this.type,
    required this.content,
  });
  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);

  @override
  List<Object?> get props => [
        id,
        type,
        content,
      ];
}

NotificationType checkNotifcationType(String notificationType) =>
    switch (notificationType) {
      'message' => NotificationType.message,
      _ => NotificationType.welcome,
    };

enum NotificationType { message, welcome }
