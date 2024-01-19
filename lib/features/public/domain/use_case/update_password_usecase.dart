import '/index.dart';

class UpdatePasswordUsecase
    extends UseCaseWithParams<BaseResponse, ForgotPasswordParameter> {
  final BaseAuthenticationRepository _repo;

  UpdatePasswordUsecase(this._repo);
  @override
  ResultFuture<BaseResponse> call(ForgotPasswordParameter params) async =>
      await _repo.updatePassword(params);
}
