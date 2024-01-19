import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '/index.dart';

part 'service_client.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ServiceClient {
  factory ServiceClient(Dio dio, {String baseUrl}) = _ServiceClient;

  @GET(EndPoints.allAds)
  Future<AllAdsModel> allAds({
    @Query("page") required int page,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @GET(EndPoints.country)
  Future<CountryModel> fetchCountry({
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });
  @GET(EndPoints.city)
  Future<CountryModel> fetchCity({
    @Path("id") required int countryId,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });
  @POST(EndPoints.blockAds)
  Future<AllAdsModel> hideAds({
    @Path("id") required int adsId,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @GET(EndPoints.allAds)
  Future<CategoriesModel> getAllCategories({
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @GET(EndPoints.supCategories)
  Future<SubCategoryModel> getSupCategories({
    @Path() required int id,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @POST(EndPoints.allVendors)
  Future<AllVendorModel> getAllVendors({
    @Body() required FilterVendorParameter? filterParameter,
    @Query("page") required int page,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });
  @POST(EndPoints.vendorDetailes)
  Future<AllVendorModel> getOfficeConsultaionsData({
    @Field("office") required int office,
    @Query("page") required int page,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @GET(EndPoints.vendorRates)
  Future<CommintModel> getVendorRates({
    @Path("id") required int vendorId,
    @Query("page") required int currentPage,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @POST(EndPoints.addVendorRates)
  Future<ContactUsModel> addVendorRate({
    @Body() required AddVendorCommintsParameter parameter,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });
}
