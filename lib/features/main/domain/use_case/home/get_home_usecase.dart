import '/features/main/data/model/home_model.dart';

import '/index.dart';

class GetHomeUseCase extends UseCaseWithoutParams<HomeModel> {
  final HomeRepositoryImp _repo;

  GetHomeUseCase(this._repo);
  @override
  ResultFuture<HomeModel> call() async => await _repo.getHome();
}
