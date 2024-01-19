import 'package:flutter/cupertino.dart';

import '/index.dart';
import 'reset_forget_pass_state.dart';

abstract class ResetPasswordController extends GetxController {
  void toggleObscure();
  void toggleObscureConfirm();
  void onChangedPassword({required String value});
  void onChangedPasswordConfirm({required String value});
  Future<void> resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordControllerImp({required this.resetPasswordUseCase});

  final Rx<ResetPasswordState> state = const ResetPasswordState().obs;

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
  Future<void> resetPassword() async {
    //debugPrint("Token ====> ${Get.find<AppPreferences>().getToken}");
    //debugPrint("Code ====> ${state.value.code}");

    if (state.value.formKey!.currentState!.validate() == false) {
      return;
    }
    state(state.value.copyWith(requestState: RequestState.loading));

    ApiResult<AuthenticationModel> result = await resetPasswordUseCase(
      ForgotPasswordParameter(
        email: state.value.email,
        code: state.value.code,
        password: state.value.password,
      ),
    );

    result.when(
      failure: (failure) =>
          state(state.value.copyWith(requestState: handleRxError(failure))),
      success: (user) {
        state(state.value.copyWith(requestState: RequestState.success));
        Get.offNamedUntil(Routes.login, (route) => false);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    final parameters = Get.parameters;
    state(
      state.value.copyWith(
        formKey: GlobalKey<FormState>(),
        email: parameters["email"],
        code: parameters["code"],
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
