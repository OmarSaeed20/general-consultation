import '/index.dart';

class VerifyRegisterCodeUseCase
    extends UseCaseWithParams<AuthenticationModel, VerifyParameter> {
  final BaseAuthenticationRepository _repository;

  VerifyRegisterCodeUseCase(this._repository);
  @override
  ResultFuture<AuthenticationModel> call(VerifyParameter params) async =>
      await _repository.verifyCodeRegister(params);
}
