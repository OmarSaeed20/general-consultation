import '/index.dart';

abstract class BaseServiceRepository {
  ResultFuture<AllAdsModel> getAllAds(PageOnlyParameter page);

  ResultFuture<CountryModel> fetchCountry();
  ResultFuture<CountryModel> fetchCities(IdOnlyParameter id);
  ResultFuture<BaseResponse> hideAds(IdOnlyParameter id);

  ResultFuture<CategoriesModel> getAllCategories();
  ResultFuture<SubCategoryModel> getSupCategories({required int id});
  ResultFuture<CommintModel> getVendorCommints({
    required GetVendorCommintsParameter parameter,
  });
  ResultFuture<ContactUsModel> addVendorCommints({
    required AddVendorCommintsParameter? parama,
  });

  ResultFuture<AllVendorModel> getAllVendors(GetVendorsParameter? pragma);
  ResultFuture<AllVendorModel> getOfficeConsultaionsData({
    required OfficeConsultaionsParameter pragma,
  });
}
