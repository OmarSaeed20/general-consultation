import 'dart:io';

import 'package:dio/dio.dart';
import 'package:general_consultation/core/consts/end_points.dart';
import 'package:general_consultation/core/network/base/response/base_response.dart';
import 'package:general_consultation/features/my_ads/data/model/my_all_ads_model.dart';

import 'package:retrofit/retrofit.dart';

part 'ads_client.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AdsClient {
  factory AdsClient(Dio dio, {String baseUrl}) = _AdsClient;

  @POST(EndPoints.createAds)
  @MultiPart()
  Future<BaseResponse> createAd({
    @Header("x-lang") required String lang,
    @Header("Authorization") required String token,
    @Part(name: "category_id") required int categoryId,
    @Part(name: "description") required String description,
    @Part(name: "file") File? file,
    @Part(name: "video_link") required String? videoLink,
  });

  @GET(EndPoints.allMyAds)
  Future<MyAllAdsModel> myAllAds({
    @Query("page") required int page,
    @Header("Authorization") required String token,
  });

  @POST(EndPoints.deleteAds)
  Future<BaseResponse> deleteAdvertisements({
    @Header("x-lang") required String lang,
    @Header("Authorization") required String token,
    @Path("id") required String id,
  });

  @POST(EndPoints.editAds)
  @MultiPart()
  Future<BaseResponse> updateAdvertisements({
    @Header("x-lang") required String lang,
    @Header("Authorization") required String token,
    @Path("id") required int id,
    @Part(name: "category_id") required int categoryId,
    @Part(name: "description") required String description,
    @Part(name: "file") File? file,
    @Part(name: "video_link") required String? videoLink,
  });
}
