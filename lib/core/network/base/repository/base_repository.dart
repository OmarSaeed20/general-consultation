import '/index.dart';

ResultFuture<T> executAndHandelError<T>(Future<T> Function() function) async {
  try {
    final response = await function();
    return ApiResult.success(response);
  } catch (error) {
    return ApiResult.failure(NetworkExceptions.getDioException(error));
  }
}
