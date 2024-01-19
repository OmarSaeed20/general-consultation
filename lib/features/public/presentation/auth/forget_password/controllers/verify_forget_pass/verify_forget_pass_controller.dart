import 'dart:async';

import '/features/public/presentation/auth/forget_password/controllers/verify_forget_pass/verify_forget_pass_state.dart';

import '/index.dart';

class VerifyEmailControllerImp extends VerifyCodeController {
  final VerifyEmailUseCase verifyEmailUseCase;
  final EmailAddressUseCase resendCodeUseCase;
  // final ResendCodeUseCase resendCodeUseCase;
  VerifyEmailControllerImp(this.resendCodeUseCase, this.verifyEmailUseCase);

  final Rx<VerifyEmailState> state = const VerifyEmailState().obs;

  @override
  void onChangedCode({required String value}) {
    state(state.value.copyWith(code: value));
  }

  @override
  Future<void> verifyEmail() async {
    //debugPrint("Token ====> ${Get.find<AppPreferences>().getToken}");
    //debugPrint("Code ====> ${state.value.code}");
    if (state.value.code.isEmpty || state.value.code.length < 4) {
      state(
        state.value.copyWith(
          errorAnimationType: state.value.errorAnimationType!
            ..add(ErrorAnimationType.shake),
        ),
      );
      return;
    }
    if (state.value.formKey!.currentState!.validate() == false) {
      return;
    }
    state(state.value.copyWith(requestState: RequestState.loading));

    ApiResult<AuthenticationModel> result = await verifyEmailUseCase(
      ForgotPasswordParameter(email: state.value.email, code: state.value.code),
    );

    result.when(
      failure: (failure) =>
          state(state.value.copyWith(requestState: handleRxError(failure))),
      success: (user) {
        state(state.value.copyWith(requestState: RequestState.success));
        Get.toNamed(
            Routes.resetPasswordPage(state.value.email, state.value.code));
      },
    );
  }

  @override
  Future<void> resendCode() async {
    state(state.value.copyWith(rxResendCode: RequestState.loading));
    ApiResult<AuthenticationModel> result = await resendCodeUseCase(
        ForgotPasswordParameter(email: state.value.email));
    result.when(
      failure: (failure) => state(
        state.value.copyWith(rxResendCode: handleRxError(failure)),
      ),
      success: (result) {
        toast(result.message);
        startTimerCountDown();
        state(state.value.copyWith(rxResendCode: RequestState.success));
      },
    );
  }

  @override
  void startTimerCountDown() {
    state(state.value.copyWith(timeCounter: 60));
    const oneSeconds = Duration(seconds: 1);
    state(
      state.value.copyWith(
        timer: Timer.periodic(
          oneSeconds,
          (Timer timer) {
            if (state.value.timeCounter == 0) {
              timer.cancel();
            } else {
              state(state.value
                  .copyWith(timeCounter: state.value.timeCounter - 1));
            }
          },
        ),
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    final parameters = Get.parameters;
    state(state.value.copyWith(
      formKey: GlobalKey<FormState>(),
      errorAnimationType: StreamController<ErrorAnimationType>(),
      email: parameters["email"],
    ));
    startTimerCountDown();
  }

  @override
  void dispose() {
    super.dispose();
    if (state.value.timer?.isActive == true) state.value.timer?.cancel();
    // ignore: invalid_use_of_protected_member
    state.value.formKey?.currentState?.dispose();
  }
}
