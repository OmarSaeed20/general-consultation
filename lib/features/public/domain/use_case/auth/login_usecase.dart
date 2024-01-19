import '/index.dart';

class LoginUseCase
    extends UseCaseWithParams<AuthenticationModel, LoginParameter> {
  final AuthenticationRepositoryImp _repo;

  LoginUseCase(this._repo);
  @override
  ResultFuture<AuthenticationModel> call(LoginParameter params) =>
      _repo.login(params);
}

class LoginParameter extends Equatable {
  final String codeCountry;
  final String phone;
  final String password;
  final String fcmToken;
  final String type;

  const LoginParameter({
    required this.codeCountry,
    required this.phone,
    required this.password,
    required this.fcmToken,
    required this.type,
  });

  @override
  List<Object> get props => [codeCountry, phone, password, fcmToken, type];
}
