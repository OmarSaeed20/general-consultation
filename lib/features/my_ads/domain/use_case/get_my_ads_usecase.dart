import 'package:general_consultation/index.dart';

class GetMyAllAdsUseCase
    extends UseCaseWithParams<MyAllAdsModel, PageOnlyParameter> {
  final AdsRepositoryImp _repo;

  GetMyAllAdsUseCase(this._repo);
  @override
  ResultFuture<MyAllAdsModel> call(PageOnlyParameter params) =>
      _repo.getMyAllAds(params);
}
