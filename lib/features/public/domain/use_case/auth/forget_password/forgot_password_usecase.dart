import '/index.dart';

class EmailAddressUseCase
    extends UseCaseWithParams<AuthenticationModel, ForgotPasswordParameter> {
  final BaseAuthenticationRepository _repo;

  EmailAddressUseCase(this._repo);
  @override
  ResultFuture<AuthenticationModel> call(
          ForgotPasswordParameter params) async =>
      await _repo.setEmailAddress(params);
}
