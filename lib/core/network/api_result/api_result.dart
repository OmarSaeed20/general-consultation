import 'package:freezed_annotation/freezed_annotation.dart';
import '/core/network/base/network_exceptions/network_exceptions.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;

  const factory ApiResult.failure(NetworkExceptions exceptions) = Failure<T>;
}
