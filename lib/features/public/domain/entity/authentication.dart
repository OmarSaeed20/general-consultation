import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'authentication.g.dart';

@JsonSerializable(createToJson: false)
class AuthenticationEntity extends Equatable {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "code_country")
  final String codeCountry;
  @JsonKey(name: "mobile")
  final String phone;
  @JsonKey(name: "email_verified_at")
  final bool emailVerifiedAt;
  @JsonKey(name: "mobile_verified_at")
  final bool phoneVerifiedAt;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "token")
  final String token;
  @JsonKey(name: "block_notification")
  final bool blockNotification;

  const AuthenticationEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.codeCountry,
    required this.phone,
    required this.emailVerifiedAt,
    required this.phoneVerifiedAt,
    required this.type,
    required this.token,
    required this.blockNotification,
  });
  factory AuthenticationEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationEntityFromJson(json);
  @override
  List<Object?> get props => [
        id,
        name,
        email,
        image,
        codeCountry,
        phone,
        emailVerifiedAt,
        phoneVerifiedAt,
        type,
        token,
        blockNotification,
      ];
}
