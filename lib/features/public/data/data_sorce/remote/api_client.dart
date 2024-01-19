import 'dart:io';

import 'package:dio/dio.dart';
import 'package:general_consultation/core/network/base/response/base_response.dart';
import 'package:general_consultation/features/public/data/model/about_us_model.dart';
// import 'package:general_consultation/index.dart';
import '/core/consts/end_points.dart';
import '/features/public/data/model/authentication_model.dart';
import 'package:retrofit/retrofit.dart';

// import '/index.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  //?  <<<<<<<<<<<<<<<<<<<<<<<<   register   >>>>>>>>>>>>>>>>>>>>>>>>
  @POST(EndPoints.register)
  Future<AuthenticationModel> register({
    @Field("name") required String name,
    @Field("mobile") required String phone,
    @Field("email") required String email,
    @Field("password") required String password,
    @Field("password_confirmation") required String passwordConfirmation,
    @Field("code_country") required String codeCountry,
    @Field("fcm_token") required String fcmToken,
    @Field("type") required String type,
    @Field("lang") required String lang,
  });

  @POST(EndPoints.verifyCode)
  Future<AuthenticationModel> verifyCodeRegister({
    @Field("code") required String code,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

//?  <<<<<<<<<<<<<<<<<<<<<<<<   login   >>>>>>>>>>>>>>>>>>>>>>>>
  @POST(EndPoints.login)
  Future<AuthenticationModel> login({
    @Field("code_country") required String codeCountry,
    @Field("mobile") required String phone,
    @Field("password") required String password,
    @Field("fcm_token") required String fcmToken,
    @Field("type") required String type,
    @Field("lang") required String lang,
  });

  @POST(EndPoints.resendCode)
  Future<AuthenticationModel> resendCode({
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  //?  <<<<<<<<<<<<<<<<<<<<<<<<   forget password   >>>>>>>>>>>>>>>>>>>>>>>>
  @POST(EndPoints.sendCode)
  Future<AuthenticationModel> setEmailAddress({
    @Field("mobile_or_email") required String email,
    @Header('x-lang') required String lang,
  });
  @POST(EndPoints.phoneOrEmail)
  Future<AuthenticationModel> verifyEmailAddress({
    @Field("mobile_or_email") required String email,
    @Field("code") required String code,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @POST(EndPoints.resetPassword)
  Future<AuthenticationModel> resetPassword({
    @Field("mobile_or_email") required String email,
    @Field("code") required String code,
    @Field("password") required String password,
    @Field("password_confirmation") required String passwordConfirm,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  //?  <<<<<<<<<<<<<<<<<<<<<<<<   setting   >>>>>>>>>>>>>>>>>>>>>>>>

  @POST(EndPoints.updatePassword)
  Future<ContactUsModel> updatePassword({
    @Field("old_password") required String oldPassord,
    @Field("password") required String password,
    @Field("password_confirmation") required String passwordConfirm,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });
  @POST(EndPoints.updateProfile)
  @MultiPart()
  Future<AuthenticationModel> updateProfile({
    @Part(name: "name") String? name,
    @Part(name: "code_country") String? codeCountry,
    @Part(name: "mobile") String? mobile,
    @Part(name: "image") File? image,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @GET(EndPoints.getUserData)
  Future<AuthenticationModel> getUserData({
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @POST(EndPoints.contactUs)
  Future<ContactUsModel> contactUs({
    @Field("message") required String message,
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @GET(EndPoints.aboutUsData)
  Future<AboutUsModel> aboutUsData({
    @Header('Authorization') required String token,
    @Header('x-lang') required String lang,
  });

  @POST(EndPoints.changeLang)
  Future<BaseResponse> changeLang({
    @Field('lang') required String lang,
    @Header('Authorization') required String token,
    @Header('x-lang') required String xLang,
  });
}
