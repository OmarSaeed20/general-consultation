import '/index.dart';

class ResendCodeUseCase extends UseCaseWithoutParams<AuthenticationModel> {
  final BaseAuthenticationRepository _repository;

  ResendCodeUseCase(this._repository);
  @override
  ResultFuture<AuthenticationModel> call() async =>
      await _repository.resendCode();
}
