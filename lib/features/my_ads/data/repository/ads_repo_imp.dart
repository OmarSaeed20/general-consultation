import '/index.dart';

class AdsRepositoryImp implements BaseAdsRepository {
  AdsRepositoryImp(this._remoteData, this._preferences);
  final AdsClient _remoteData;
  final AppPreferences _preferences;

  @override
  ResultFuture<MyAllAdsModel> getMyAllAds(PageOnlyParameter parameter) async =>
      executAndHandelError<MyAllAdsModel>(
        () => _remoteData.myAllAds(
          page: parameter.page,
          token: _preferences.getToken,
        ),
      );

  @override
  ResultFuture<BaseResponse> createAds(CreateAdsParameter parameters) async =>
      executAndHandelError<BaseResponse>(
        () => _remoteData.createAd(
          description: parameters.description,
          categoryId: parameters.categoryId,
          file: parameters.image,
          videoLink: parameters.videoLink,
          lang: _preferences.getLang,
          token: _preferences.getToken,
        ),
      );

  @override
  ResultFuture<BaseResponse> deleteAdvertisemrnts(
    IdOnlyParameter params,
  ) async =>
      executAndHandelError<BaseResponse>(
        () => _remoteData.deleteAdvertisements(
          id: "${params.id}",
          lang: _preferences.getLang,
          token: _preferences.getToken,
        ),
      );

  @override
  ResultFuture<BaseResponse> updateAdvertisemrnts(
    UpdateAdvertisementsParameter params,
  ) async =>
      executAndHandelError<BaseResponse>(
        () => _remoteData.updateAdvertisements(
          lang: _preferences.getLang,
          token: _preferences.getToken,
          id: params.id,
          categoryId: params.categoryId,
          file: params.image,
          description: params.description,
          videoLink: params.videoLink,
        ),
      );
}
