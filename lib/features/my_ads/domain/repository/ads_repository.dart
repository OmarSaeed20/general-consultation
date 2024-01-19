import '/index.dart';

abstract class BaseAdsRepository {
  ResultFuture<MyAllAdsModel> getMyAllAds(PageOnlyParameter parameter);
  ResultFuture<BaseResponse> createAds(CreateAdsParameter parameters);
  ResultFuture<BaseResponse> deleteAdvertisemrnts(
    IdOnlyParameter params,
  );
  ResultFuture<BaseResponse> updateAdvertisemrnts(
    UpdateAdvertisementsParameter params,
  );
}
