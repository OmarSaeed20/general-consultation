
import '/index.dart';
part 'about_us_model.g.dart';

@JsonSerializable(createToJson: false)
class AboutUsModel extends BaseResponse<AboutUsEntity> {
  const AboutUsModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) =>
      _$AboutUsModelFromJson(json);
}