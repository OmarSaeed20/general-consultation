import '/index.dart';
part 'authentication_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthenticationModel extends BaseResponse<AuthenticationEntity> {
  const AuthenticationModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ContactUsModel extends BaseResponse {
  const ContactUsModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) =>
      _$ContactUsModelFromJson(json);
}
