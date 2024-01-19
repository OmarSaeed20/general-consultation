import '/index.dart';

abstract class BaseAuthenticationRepository {
  ResultFuture<AuthenticationModel> login(LoginParameter parameters);
  ResultFuture<AuthenticationModel> register(RegisterParameter parameters);
  ResultFuture<AuthenticationModel> verifyCodeRegister(VerifyParameter params);
  ResultFuture<AuthenticationModel> resendCode();
  // Reset Password
  ResultFuture<AuthenticationModel> setEmailAddress(
      ForgotPasswordParameter params);
  ResultFuture<AuthenticationModel> verifyEmailAddress(
      ForgotPasswordParameter params);
  ResultFuture<AuthenticationModel> resetPassword(
      ForgotPasswordParameter params);
  ResultFuture<BaseResponse> contactUs(ContactUsParameter params);
  ResultFuture<BaseResponse> updatePassword(ForgotPasswordParameter params);
  ResultFuture<AuthenticationModel> updateProfile(
    UpdateProfileParameter params,
  );
  ResultFuture<AuthenticationModel> getUserData();

  ResultFuture<AboutUsModel> aboutUs();
  ResultFuture<BaseResponse> changeLang({required String lang});
}
