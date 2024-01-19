import 'package:flutter/cupertino.dart';
import '/index.dart';
import 'register_state.dart';

abstract class RegisterController extends GetxController {
  void toggleObscure();
  void toggleObscureConfirm();
  void onChangedUsername({required String value});
  void onChangedPhone({String? phone, String? codeCountry});
  void onChangedEmail({required String value});
  void onChangedPassword({required String value});
  void onChangedPasswordConfirm({required String value});
  void isCheckPhoneValidOrNot({required bool value});
}

class RegisterControllerImp extends RegisterController {
  RegisterUseCase registerUseCase;

  RegisterControllerImp({required this.registerUseCase, required this.prefs});
  final AppPreferences prefs;
  final Rx<RegisterState> state =
      RegisterState(formKey: GlobalKey<FormState>()).obs;

  @override
  void onChangedUsername({required String value}) =>
      state(state.value.copyWith(username: value));

  @override
  void onChangedPhone({String? phone, String? codeCountry}) =>
      state(state.value.copyWith(phone: phone, codeCountry: codeCountry));

  @override
  void onChangedEmail({required String value}) =>
      state(state.value.copyWith(email: value));

  @override
  void onChangedPassword({required String value}) =>
      state(state.value.copyWith(password: value));

  @override
  void onChangedPasswordConfirm({required String value}) =>
      state(state.value.copyWith(passwordConfirm: value));

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
  void toggleObscureConfirm() => state(
        state.value.copyWith(
          isPasswordConfirm: !state.value.isPasswordConfirm,
          suffixIconConfirm: state.value.isPasswordConfirm
              ? CupertinoIcons.eye
              : CupertinoIcons.eye_slash,
        ),
      );
  @override
  void isCheckPhoneValidOrNot({required bool value}) =>
      state(state.value.copyWith(isCorrectPhone: value));

  void register() async {
    if (!state.value.formKey.currentState!.validate()) {
      return;
    }
    state(state.value.copyWith(rx: RequestState.loading));

    ApiResult<AuthenticationModel> loginResult = await registerUseCase(
      RegisterParameter(
        name: state.value.username,
        email: state.value.email,
        phone: state.value.phone.replaceAll(state.value.codeCountry, ""),
        password: state.value.password,
        codeCountry: state.value.codeCountry,
        fcmToken: "mjhdfbhdshsdhbvcnjsassav",
        type: "customer",
      ),
    );

    loginResult.when(
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
      success: (user) async {
        await prefs.setToken('${user.data?.token}');
        UserServiceImp.to.currentUser.value = user.data;
        // toast(user.message);
        state(state.value.copyWith(rx: RequestState.success));
        Get.toNamed(Routes.verifyCodePage(state.value.phone));
      },
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
    state.value.formKey.currentState?.dispose();
  }
}
