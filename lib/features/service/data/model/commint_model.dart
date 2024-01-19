import '/index.dart';

part 'commint_model.g.dart';

@JsonSerializable(createToJson: false)
class CommintModel extends BaseResponse<CommintEntity> {
  const CommintModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory CommintModel.fromJson(Map<String, dynamic> json) =>
      _$CommintModelFromJson(json);
}
