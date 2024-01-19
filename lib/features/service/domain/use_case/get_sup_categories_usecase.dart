import '/index.dart';

class GetSupCategoriesUseCase extends UseCaseWithParams<SubCategoryModel, int> {
  final ServiceRepositoryImp _repo;

  GetSupCategoriesUseCase(this._repo);
  @override
  ResultFuture<SubCategoryModel> call(int params) async =>
      await _repo.getSupCategories(id: params);
}
