import '/index.dart';

class DeleteAccountUseCase extends UseCaseWithoutParams<ContactUsModel> {
  final HomeRepositoryImp _repo;

  DeleteAccountUseCase(this._repo);
  @override
  ResultFuture<ContactUsModel> call() async => await _repo.deleteAccount();
}
