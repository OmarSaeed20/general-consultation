import 'package:general_consultation/index.dart';

class HideAdsUseCase extends UseCaseWithParams<AllAdsModel, IdOnlyParameter> {
  final ServiceRepositoryImp _repository;

  HideAdsUseCase(this._repository);
  @override
  ResultFuture<AllAdsModel> call(IdOnlyParameter params) async =>
      await _repository.hideAds(params);
}
