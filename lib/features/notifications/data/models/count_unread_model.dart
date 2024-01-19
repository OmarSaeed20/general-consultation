import 'package:general_consultation/index.dart';
part 'count_unread_model.g.dart';

@JsonSerializable(createToJson: false)
class CountUnreadModel extends BaseResponse<CountUnreadEntity> {
  const CountUnreadModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory CountUnreadModel.fromJson(Map<String, dynamic> json) =>
      _$CountUnreadModelFromJson(json);
}
