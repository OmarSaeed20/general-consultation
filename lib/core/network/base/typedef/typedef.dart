import '/core/network/api_result/api_result.dart';

typedef ResultFuture<T> = Future<ApiResult<T>>;
typedef ResultVoid = Future<ApiResult<void>>;
