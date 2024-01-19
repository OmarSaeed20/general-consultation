import '/index.dart';

class GetUserUseCase extends UseCaseWithoutParams<AuthenticationModel> {
  final BaseAuthenticationRepository repo;

  GetUserUseCase({required this.repo});

  @override
  ResultFuture<AuthenticationModel> call() async => await repo.getUserData();
}
