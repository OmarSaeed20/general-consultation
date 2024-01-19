import '/index.dart';

class GetAboutUsUseCase extends UseCaseWithoutParams<AboutUsModel> {
  final BaseAuthenticationRepository _repo;

  GetAboutUsUseCase(this._repo);
  @override
  ResultFuture<AboutUsModel> call() async => await _repo.aboutUs();
}

