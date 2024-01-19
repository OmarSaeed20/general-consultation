import 'dart:io';

import 'package:dio/dio.dart';
import '/core/consts/end_points.dart';
import '/features/public/data/model/authentication_model.dart';
import '/features/main/data/model/home_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_client.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class HomeClient {
  factory HomeClient(Dio dio, {String baseUrl}) = _HomeClient;

  @GET(EndPoints.home)
  Future<HomeModel> getHome({
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @POST(EndPoints.logout)
  Future<ContactUsModel> logout({
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @POST(EndPoints.deleteAccount)
  Future<ContactUsModel> deleteAccount({
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @POST(EndPoints.customerInquiries)
  @MultiPart()
  Future<ContactUsModel> sendComplaint({
    @Part(name: "file") File? file,
    @Part(name: "category_id") required int categoryId,
    @Part(name: "message") required String? content,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });
}
