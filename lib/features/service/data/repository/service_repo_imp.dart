import '/features/service/domain/repository/service_repository.dart';

import '/index.dart';

class ServiceRepositoryImp implements BaseServiceRepository {
  ServiceRepositoryImp(this._remoteData, this._preferences);
  final ServiceClient _remoteData;
  final AppPreferences _preferences;

  @override
  ResultFuture<AllAdsModel> getAllAds(PageOnlyParameter parameter) async =>
      executAndHandelError<AllAdsModel>(
        () => _remoteData.allAds(
          page: parameter.page,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<AllVendorModel> getAllVendors(
    GetVendorsParameter? parameter,
  ) async =>
      executAndHandelError<AllVendorModel>(
        () => _remoteData.getAllVendors(
          filterParameter: parameter?.filterParameter,
          page: parameter!.page,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );
  @override
  ResultFuture<AllVendorModel> getOfficeConsultaionsData({
    required OfficeConsultaionsParameter pragma,
  }) async =>
      executAndHandelError<AllVendorModel>(
        () => _remoteData.getOfficeConsultaionsData(
          office: pragma.office,
          page: pragma.page,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<CategoriesModel> getAllCategories() async =>
      executAndHandelError<CategoriesModel>(
        () => _remoteData.getAllCategories(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<SubCategoryModel> getSupCategories({required int id}) async =>
      executAndHandelError<SubCategoryModel>(
        () => _remoteData.getSupCategories(
          id: id,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<CountryModel> fetchCities(IdOnlyParameter parameter) async =>
      executAndHandelError<CountryModel>(
        () => _remoteData.fetchCity(
          countryId: parameter.id,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );
  @override
  ResultFuture<AllAdsModel> hideAds(IdOnlyParameter parameter) async =>
      executAndHandelError<AllAdsModel>(
        () => _remoteData.hideAds(
          adsId: parameter.id,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<CountryModel> fetchCountry() async =>
      executAndHandelError<CountryModel>(
        () => _remoteData.fetchCountry(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<ContactUsModel> addVendorCommints({
    required AddVendorCommintsParameter? parama,
  }) async =>
      executAndHandelError<ContactUsModel>(
        () => _remoteData.addVendorRate(
          parameter: parama!,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<CommintModel> getVendorCommints({
    required GetVendorCommintsParameter parameter,
  }) async =>
      executAndHandelError<CommintModel>(
        () => _remoteData.getVendorRates(
          vendorId: parameter.vendorId,
          currentPage: parameter.currentPage,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );
}
