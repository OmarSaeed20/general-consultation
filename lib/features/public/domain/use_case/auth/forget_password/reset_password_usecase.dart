import '/index.dart';

class ResetPasswordUseCase
    extends UseCaseWithParams<AuthenticationModel, ForgotPasswordParameter> {
  final BaseAuthenticationRepository _repo;

  ResetPasswordUseCase(this._repo);
  @override
  ResultFuture<AuthenticationModel> call(
          ForgotPasswordParameter params) async =>
      await _repo.resetPassword(params);
}

class ForgotPasswordParameter extends Equatable {
  final String? email;
  final String? code;
  final String? oldpassword;
  final String? password;

  const ForgotPasswordParameter({
    this.email,
    this.code,
    this.oldpassword,
    this.password,
  });

  @override
  List<Object?> get props => [email, code, oldpassword, password];
}

