import '/index.dart';

class VerifyEmailUseCase
    extends UseCaseWithParams<AuthenticationModel, ForgotPasswordParameter> {
  final BaseAuthenticationRepository _repo;

  VerifyEmailUseCase(this._repo);
  @override
  ResultFuture<AuthenticationModel> call(
          ForgotPasswordParameter params) async =>
      await _repo.verifyEmailAddress(params);
}
