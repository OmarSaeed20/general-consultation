import 'package:general_consultation/index.dart';

class DeleteAdvertisementsUseCase
    extends UseCaseWithParams<BaseResponse, IdOnlyParameter> {
  final AdsRepositoryImp _repo;
  DeleteAdvertisementsUseCase(this._repo);

  @override
  ResultFuture<BaseResponse> call(IdOnlyParameter params) async =>
      await _repo.deleteAdvertisemrnts(params);
}
