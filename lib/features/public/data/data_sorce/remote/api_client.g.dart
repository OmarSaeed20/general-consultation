// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AuthClient implements AuthClient {
  _AuthClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://consult.codeella.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AuthenticationModel> register({
    required name,
    required phone,
    required email,
    required password,
    required passwordConfirmation,
    required codeCountry,
    required fcmToken,
    required type,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'name': name,
      'mobile': phone,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'code_country': codeCountry,
      'fcm_token': fcmToken,
      'type': type,
      'lang': lang,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthenticationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthenticationModel> verifyCodeRegister({
    required code,
    required token,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'x-lang': lang,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {'code': code};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/checkcode',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthenticationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthenticationModel> login({
    required codeCountry,
    required phone,
    required password,
    required fcmToken,
    required type,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'code_country': codeCountry,
      'mobile': phone,
      'password': password,
      'fcm_token': fcmToken,
      'type': type,
      'lang': lang,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthenticationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthenticationModel> resendCode({
    required token,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'x-lang': lang,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/resend',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthenticationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthenticationModel> setEmailAddress({
    required email,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'x-lang': lang};
    _headers.removeWhere((k, v) => v == null);
    final _data = {'mobile_or_email': email};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/password/reset/send-code',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthenticationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthenticationModel> verifyEmailAddress({
    required email,
    required code,
    required token,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'x-lang': lang,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'mobile_or_email': email,
      'code': code,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/password/reset/check-single-code',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthenticationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthenticationModel> resetPassword({
    required email,
    required code,
    required password,
    required passwordConfirm,
    required token,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'x-lang': lang,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'mobile_or_email': email,
      'code': code,
      'password': password,
      'password_confirmation': passwordConfirm,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/password/reset/check-code',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthenticationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ContactUsModel> updatePassword({
    required oldPassord,
    required password,
    required passwordConfirm,
    required token,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'x-lang': lang,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'old_password': oldPassord,
      'password': password,
      'password_confirmation': passwordConfirm,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ContactUsModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/profile/update/password',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ContactUsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthenticationModel> updateProfile({
    name,
    codeCountry,
    mobile,
    image,
    required token,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'x-lang': lang,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (name != null) {
      _data.fields.add(MapEntry(
        'name',
        name,
      ));
    }
    if (codeCountry != null) {
      _data.fields.add(MapEntry(
        'code_country',
        codeCountry,
      ));
    }
    if (mobile != null) {
      _data.fields.add(MapEntry(
        'mobile',
        mobile,
      ));
    }
    if (image != null) {
      _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(
          image.path,
          filename: image.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'public/profile/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthenticationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthenticationModel> getUserData({
    required token,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'x-lang': lang,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/user-auth-data',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthenticationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ContactUsModel> contactUs({
    required message,
    required token,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'x-lang': lang,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {'message': message};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ContactUsModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/contact-us',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ContactUsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AboutUsModel> aboutUsData({
    required token,
    required lang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'x-lang': lang,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AboutUsModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/data/abouts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AboutUsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BaseResponse<dynamic>> changeLang({
    required lang,
    required token,
    required xLang,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'x-lang': xLang,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {'lang': lang};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'public/profile/change-lang',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
