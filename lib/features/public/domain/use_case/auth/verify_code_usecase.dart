import '/index.dart';

class VerifyCodeUseCase
    extends UseCaseWithParams<AuthenticationModel, VerifyParameter> {
  final BaseAuthenticationRepository _repo;

  VerifyCodeUseCase(this._repo);
  @override
  ResultFuture<AuthenticationModel> call(
          VerifyParameter params) async =>
      await _repo.verifyCodeRegister(params);
}

class VerifyParameter extends Equatable {
  final String code;

  const VerifyParameter({required this.code});

  @override
  List<Object?> get props => [code];
}
