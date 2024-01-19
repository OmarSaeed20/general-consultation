import '/index.dart';

class RegisterUseCase
    extends UseCaseWithParams<AuthenticationModel, RegisterParameter> {
  final BaseAuthenticationRepository _repository;

  RegisterUseCase(this._repository);
  @override
  ResultFuture<AuthenticationModel> call(RegisterParameter params) async =>
      await _repository.register(params);
}

class RegisterParameter extends Equatable {
  const RegisterParameter({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.codeCountry,
    required this.fcmToken,
    required this.type,
  });
  final String name;
  final String phone;
  final String password;
  final String email;
  final String codeCountry;
  final String fcmToken;
  final String type;
  @override
  List<Object> get props => [
        name,
        phone,
        password,
        email,
        codeCountry,
        fcmToken,
        type,
      ];
}
