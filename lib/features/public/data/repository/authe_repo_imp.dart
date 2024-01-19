import '/index.dart';

class AuthenticationRepositoryImp implements BaseAuthenticationRepository {
  AuthenticationRepositoryImp(this._authApiClient, this._preferences);
  final AuthClient _authApiClient;
  final AppPreferences _preferences;
  @override
  ResultFuture<AuthenticationModel> login(LoginParameter parameter) async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.login(
          codeCountry: parameter.codeCountry,
          phone: parameter.phone,
          password: parameter.password,
          fcmToken: parameter.fcmToken,
          type: parameter.type,
          lang: Get.find<AppPreferences>().getLang,
        ),
      );

  @override
  ResultFuture<AuthenticationModel> register(
          RegisterParameter parameter) async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.register(
          name: parameter.name,
          phone: parameter.phone,
          email: parameter.email,
          password: parameter.password,
          passwordConfirmation: parameter.password,
          codeCountry: parameter.codeCountry,
          fcmToken: parameter.fcmToken,
          type: parameter.type,
          lang: Get.find<AppPreferences>().getLang,
        ),
      );

  @override
  ResultFuture<AuthenticationModel> verifyCodeRegister(
    VerifyParameter params,
  ) async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.verifyCodeRegister(
          code: params.code,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<AuthenticationModel> resendCode() async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.resendCode(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<AuthenticationModel> setEmailAddress(
    ForgotPasswordParameter params,
  ) async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.setEmailAddress(
          email: params.email!,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<AuthenticationModel> verifyEmailAddress(
    ForgotPasswordParameter params,
  ) async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.verifyEmailAddress(
          email: params.email!,
          code: params.code!,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<AuthenticationModel> resetPassword(
    ForgotPasswordParameter params,
  ) async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.resetPassword(
          email: params.email!,
          code: params.code!,
          password: params.password!,
          passwordConfirm: params.password!,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<BaseResponse> contactUs(ContactUsParameter params) async =>
      executAndHandelError<BaseResponse>(
        () => _authApiClient.contactUs(
          message: params.content,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<BaseResponse> updatePassword(
    ForgotPasswordParameter params,
  ) async =>
      executAndHandelError<BaseResponse>(
        () => _authApiClient.updatePassword(
          oldPassord: params.oldpassword!,
          password: params.password!,
          passwordConfirm: params.password!,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<AuthenticationModel> getUserData() async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.getUserData(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<AuthenticationModel> updateProfile(
    UpdateProfileParameter parameter,
  ) async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.updateProfile(
          name: parameter.name,
          codeCountry: parameter.codeCountry,
          mobile: parameter.phone,
          image: parameter.image,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<AboutUsModel> aboutUs() async =>
      executAndHandelError<AboutUsModel>(
        () => _authApiClient.aboutUsData(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<BaseResponse> changeLang({required String lang}) async =>
      executAndHandelError<BaseResponse>(
        () => _authApiClient.changeLang(
          lang: lang,
          token: _preferences.getToken,
          xLang: _preferences.getLang,
        ),
      );
}
