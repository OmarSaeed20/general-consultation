import '/index.dart';

class LogOutUseCase extends UseCaseWithoutParams<ContactUsModel> {
  final HomeRepositoryImp _repo;

  LogOutUseCase(this._repo);
  @override
  ResultFuture<ContactUsModel> call() async => await _repo.logOut();
}
