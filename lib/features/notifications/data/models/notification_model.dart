import 'package:general_consultation/index.dart';

part 'notification_model.g.dart';

@JsonSerializable(createToJson: false)
class NotificationModel extends BaseResponse<NotificationEntity> {
  const NotificationModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
