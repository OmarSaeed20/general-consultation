import '/index.dart';

class GetAllCategoriesUseCase extends UseCaseWithoutParams<CategoriesModel> {
  final ServiceRepositoryImp _repo;

  GetAllCategoriesUseCase(this._repo);
  @override
  ResultFuture<CategoriesModel> call() async => await _repo.getAllCategories();
}
