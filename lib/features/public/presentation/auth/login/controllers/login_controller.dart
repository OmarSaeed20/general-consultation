import 'package:flutter/cupertino.dart';

import '/index.dart';

import 'login_state.dart';

abstract class LoginController extends GetxController {
  void toggleObscure();
  void onChangedPassword({required String value});
  void onChangedPhone({String? phone, String? codeCountry});
  void isCheckPhoneValidOrNot({required bool value});
  Future<void> login();
}

class LoginControllerImp extends LoginController {
  LoginControllerImp({required this.loginUseCase, required this.prefs});
  final LoginUseCase loginUseCase;
  final AppPreferences prefs;

  Rx<LoginState> state = const LoginState().obs;
  @override
  void toggleObscure() => state(
        state.value.copyWith(
          isPassword: !state.value.isPassword,
          suffixIcon: state.value.isPassword
              ? CupertinoIcons.eye
              : CupertinoIcons.eye_slash,
        ),
      );

  @override
  void onChangedPhone({String? phone, String? codeCountry}) =>
      state(state.value.copyWith(phone: phone, codeCountry: codeCountry));

  @override
  void onChangedPassword({required String value}) =>
      state(state.value.copyWith(password: value));

  @override
  void isCheckPhoneValidOrNot({required bool value}) =>
      state(state.value.copyWith(isCorrectPhone: value));

  @override
  Future<void> login() async {
    if (!state.value.formKey!.currentState!.validate()) {
      return;
    }
    state(state.value.copyWith(rx: RequestState.loading));
    ApiResult<AuthenticationModel> result = await loginUseCase(
      LoginParameter(
        codeCountry: state.value.codeCountry,
        phone: state.value.phone.replaceAll(state.value.codeCountry, ""),
        password: state.value.password,
        fcmToken: "fcm_ddfefdqedsctoken",
        type: "customer",
      ),
    );

    result.when(
      success: (user) async {
        // Save Token
        await prefs.setToken('${user.data?.token}');
        UserServiceImp.to.currentUser.value = user.data;
        state(state.value.copyWith(rx: RequestState.success));
        if (user.data?.emailVerifiedAt == true) {
          prefs.onSubmittedLogin;
          //debugPrint(
              // "getToken>>>>>>>>>>>${Get.find<AppPreferences>().getToken}")
          Get.offNamedUntil(Routes.main, (route) => false);
        } else {
          ToastManager.showSuccess("قم بتاكيد حسابك اولا");
          Get.toNamed(Routes.verifyCodePage(state.value.phone));
        }
      },
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
    );
  }

  @override
  void onInit() {
    super.onInit();

    /// [initialize values]
    state(
      state.value.copyWith(
        formKey: GlobalKey<FormState>(),
        // phoneNumber: PhoneNumber(isoCode: "SA"),
      ),
    );
  }

   @override
  void dispose() {
    super.dispose();
    // ignore: invalid_use_of_protected_member
    state.value.formKey?.currentState?.dispose();
  }
}
