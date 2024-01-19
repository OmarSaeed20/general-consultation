import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data_converter.dart';

part 'base_response.g.dart';

@JsonSerializable(createToJson: false)
class BaseResponse<T> extends Equatable {
  @JsonKey(name: "status")
  final bool status;
  @JsonKey(name: "status_code")
  final int code;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data", includeIfNull: true)
  @DataConverter()
  final T? data;

  const BaseResponse({
    required this.status,
    required this.code,
    required this.message,
    this.data,
  });

  @override
  List<Object?> get props => [status, code, message, data];
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}

/* @JsonSerializable(createToJson: false)
class BaseResponseList<T> extends Equatable {
  @JsonKey(name: "status")
  final bool status;
  @JsonKey(name: "status_code")
  final int code;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  @DataConverter()
  final List<T?> data;

  const BaseResponseList({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory BaseResponseList.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseListFromJson(json);
  @override
  List<Object?> get props => [status, code, message, data];
}
 */