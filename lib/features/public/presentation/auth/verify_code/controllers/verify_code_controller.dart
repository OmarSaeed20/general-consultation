import 'dart:async';

import 'verify_code_state.dart';
import '/index.dart';

abstract class VerifyCodeController extends GetxController {
  void onChangedCode({required String value});
  Future<void> verifyEmail();
  Future<void> resendCode();
  void startTimerCountDown();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeControllerImp(
      this._verifyCodeUseCase, this._resendCodeUseCase, this.prefs);
  final VerifyCodeUseCase _verifyCodeUseCase;
  final ResendCodeUseCase _resendCodeUseCase;
  final AppPreferences prefs;

  final Rx<VerifyCodeState> state = const VerifyCodeState().obs;
  @override
  void onChangedCode({required String value}) {
    state(state.value.copyWith(code: value));
  }

  @override
  Future<void> verifyEmail() async {
    //debugPrint("Token ====> ${Get.find<AppPreferences>().getToken}");
    //debugPrint("Code ====> ${state.value.code}");
    if (state.value.code.isEmpty || state.value.code.length < 6) {
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
    state(state.value.copyWith(rx: RequestState.loading));

    ApiResult<AuthenticationModel> result = await _verifyCodeUseCase(
      VerifyParameter(code: state.value.code),
    );

    result.when(
      failure: (failure) =>
          state(state.value.copyWith(rx: handleRxError(failure))),
      success: (user) {
        state(state.value.copyWith(rx: RequestState.success));
        prefs.onSubmittedLogin;
        UserServiceImp.to.currentUser(user.data);
        Get.offNamedUntil(Routes.main, (route) => false);
      },
    );
  }

  @override
  Future<void> resendCode() async {
    state(state.value.copyWith(rxResendCode: RequestState.loading));
    ApiResult<AuthenticationModel> result = await _resendCodeUseCase();
    result.when(
      failure: (failure) =>
          state(state.value.copyWith(rxResendCode: handleRxError(failure))),
      success: (result) {
        // toast(result.message);
        startTimerCountDown();
        state(
          state.value.copyWith(rxResendCode: RequestState.success),
        );
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
              state(
                state.value.copyWith(timeCounter: state.value.timeCounter - 1),
              );
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
    state(
      state.value.copyWith(
        formKey: GlobalKey<FormState>(),
        errorAnimationType: StreamController<ErrorAnimationType>(),
        phone: parameters["phone"],
      ),
    );
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
