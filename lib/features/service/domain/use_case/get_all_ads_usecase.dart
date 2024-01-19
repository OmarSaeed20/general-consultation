import '/index.dart';

class GetAllAdsUseCase extends UseCaseWithParams<AllAdsModel, PageOnlyParameter> {
  final ServiceRepositoryImp _repo;
  GetAllAdsUseCase(this._repo);

  @override
  ResultFuture<AllAdsModel> call(PageOnlyParameter params) async =>
      await _repo.getAllAds(params);
}
